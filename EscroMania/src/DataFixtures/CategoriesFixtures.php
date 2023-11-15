<?php

namespace App\DataFixtures;

use App\Entity\Categories;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;
use Symfony\Component\String\Slugger\SluggerInterface;

class CategoriesFixtures extends Fixture
{
    private $counter = 1;

    public function __construct(private SluggerInterface $slugger)
    {
        
    }

    public function load(ObjectManager $manager): void
    {

        $parent2 = $this->createCategory('Game', null, $manager);
        $this->createCategory('Action', $parent2, $manager);
        $this->createCategory('Aventure', $parent2, $manager);
        $this->createCategory('Stratégie', $parent2, $manager);
        $this->createCategory('FPS', $parent2, $manager);
        $this->createCategory('Sport', $parent2, $manager);
        $this->createCategory('Sandbox', $parent2, $manager);
        $this->createCategory('Plateforme', $parent2, $manager);
        $this->createCategory('Action Adventure', $parent2, $manager);
        $this->createCategory('RPG', $parent2, $manager);
        $this->createCategory('Battle Royal', $parent2, $manager);
        $this->createCategory('Survival Horror', $parent2, $manager);
        $this->createCategory('Combat', $parent2, $manager);
        $this->createCategory('Party', $parent2, $manager);

        $parent = $this->createCategory('Console', null, $manager);
        $this->createCategory('Sega', $parent, $manager);
        $this->createCategory('Nintendo', $parent, $manager);
        $this->createCategory('Sony', $parent, $manager);
        $this->createCategory('Microsoft', $parent, $manager);      



        $manager->flush();
    }

    public function createCategory(string $name, Categories $parent =null , ObjectManager $manager)
    {
        $category = new Categories();
        $category->setName($name);
        $category->setslug($this->slugger->slug($category->getName())->lower());
        $category->setParent($parent);
        $manager->persist($category);

        $this->addReference('cat-'.$this->counter, $category);
        $this->counter++;

        return $category;
    }
}