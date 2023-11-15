<?php

namespace App\Controller\Admin;

use App\Entity\Images;
use App\Entity\Products;
use App\Form\ProductsFormType;
use App\Repository\ProductsRepository;
use App\Service\PictureService;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\String\Slugger\SluggerInterface;

#[Route('/admin/produits', name: 'admin_products_')]
class ProductsController extends AbstractController
{
    #[Route('/', name: 'index')]
    public function index(): Response
    {
        return $this->render('admin/products/index.html.twig');
    }

    #[Route('/ajout', name: 'add')]
    public function add(Request $request, EntityManagerInterface $em, SluggerInterface $slugger, PictureService $pictureService): Response
    {
        $this->denyAccessUnlessGranted('ROLE_ADMIN');

        //On crée un "nouveau produit"
        $product = new Products();

        //On crée le formilaire
        $productForm = $this->createForm(ProductsFormType::class, $product);

        //On traite la requête du formulaire
        $productForm->handleRequest($request);

        //On vérifie si le formulaire est soumis ET valide
        if($productForm->isSubmitted() && $productForm->isValid()){
            // On récupère les images
            $images = $productForm->get('images')->getData();
            
            foreach($images as $image){
                // On définit le dossier de destination
                $folder = 'products';

                // On appelle le service d'ajout
                $fichier = $pictureService->add($image, $folder, 300, 300);

                $img = new Images();
                $img->setName($fichier);
                $product->addImage($img);
            }

            // On génère le slug
            $slug = $slugger->slug($product->getName());
            $product->setSlug($slug);

            // On arrondit le prix 
             $prix = $product->getPrice() * 100;
             $product->setPrice($prix);

            // On stocke
            $em->persist($product);
            $em->flush();

            $this->addFlash('success', 'Produit ajouté avec succès');

            // On redirige
            return $this->redirectToRoute('admin_products_index');
        }

        return $this->render('admin/products/add.html.twig',[
            'productForm' => $productForm->createView()
        ]);

        //return $this->renderForm('admin/products/add.html.twig', compact('productForm'));
        // ['productForm' => $productForm]
    }

    #[Route('/edition/{id}', name: 'edit')]
    public function edit(Products $products, Request $request, EntityManagerInterface $em, SluggerInterface $slugger, PictureService $pictureService): Response
    {
        $this->denyAccessUnlessGranted('PRODUCT_EDIT', $products);

        // On divise le prix par 100
        $prix = $products->getPrice() / 100;
        $products->setPrice($prix);

        // On crée le formulaire
        $productForm = $this->createForm(ProductsFormType::class, $products);

        // On traite la requête du formulaire
        $productForm->handleRequest($request);

        //On vérifie si le formulaire est soumis ET valide
        if($productForm->isSubmitted() && $productForm->isValid()){
            // On récupère les images
            $images = $productForm->get('images')->getData();
            
            foreach($images as $image){
                // On définit le dossier de destination
                $folder = 'products';

                // On appelle le service d'ajout
                $fichier = $pictureService->add($image, $folder, 300, 300);

                $img = new Images();
                $img->setName($fichier);
                $products->addImage($img);
            }          
            
            // On génère le slug
            $slug = $slugger->slug($products->getName());
            $products->setSlug($slug);

            // On arrondit le prix 
            $prix = $products->getPrice() * 100;
            $products->setPrice($prix);

            // On stocke
            $em->persist($products);
            $em->flush();

            $this->addFlash('success', 'Produit modifié avec succès');

            // On redirige
            return $this->redirectToRoute('admin_products_index');
        }


        return $this->render('admin/products/edit.html.twig',[
            'productForm' => $productForm->createView(),
            'product' => $products
        ]);

        //return $this->renderForm('admin/products/edit.html.twig', compact('productForm'));
        // ['productForm' => $productForm]
    }

    #[Route('/suppression/{id}', name: 'delete')]
    public function delete(Products $products): Response
    {
        $this->denyAccessUnlessGranted('PRODUCT_DELETE', $products);
        return $this->render('admin/products/index.html.twig');
    }

    #[Route('/suppression/image/{id}', name: 'delete_image', methods: ['DELETE'])]
    public function deleteImage(Images $image, Request $request, EntityManagerInterface $em, PictureService $pictureService): JsonResponse
    {
        // On récupère le contenu de la requête
        $data = json_decode($request->getContent(), true);

        if($this->isCsrfTokenValid('delete' . $image->getId(), $data['_token'])){
            // Le token csrf est valide
            // On récupère le nom de l'image
            $nom = $image->getName();

            if($pictureService->delete($nom, 'products', 300, 300)){
                // On supprime l'image de la base de données
                $em->remove($image);
                $em->flush();

                return new JsonResponse(['success' => true], 200);
            }
            // La suppression a échoué
            return new JsonResponse(['error' => 'Erreur de suppression'], 400);
        }

        return new JsonResponse(['error' => 'Token invalide'], 400);
    }

}