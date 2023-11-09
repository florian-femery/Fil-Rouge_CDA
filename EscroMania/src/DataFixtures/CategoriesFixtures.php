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

        $parent = $this->createCategory('Console', null, $manager);
        $this->createCategory('Sega Master System', $parent, $manager);
        $this->createCategory('Nes', $parent, $manager);
        $this->createCategory('PC', $parent, $manager);
        $this->createCategory('Megadrive', $parent, $manager);
        $this->createCategory('Neo Geo', $parent, $manager);
        $this->createCategory('Super Nintendo', $parent, $manager);
        $this->createCategory('Sega Saturn', $parent, $manager);
        $this->createCategory('PS1', $parent, $manager);
        $this->createCategory('Nintendo 64', $parent, $manager);
        $this->createCategory('Dreamcast', $parent, $manager);
        $this->createCategory('PS2', $parent, $manager);
        $this->createCategory('Gamecube', $parent, $manager);
        $this->createCategory('Xbox', $parent, $manager); 
        $this->createCategory('Wii', $parent, $manager);
        $this->createCategory('Xbox 360', $parent, $manager);
        $this->createCategory('PS3', $parent, $manager);        
        $this->createCategory('Wii U', $parent, $manager);
        $this->createCategory('Switch', $parent, $manager);
        $this->createCategory('Xbox One ', $parent, $manager);
        $this->createCategory('Xbox One S', $parent, $manager);
        $this->createCategory('PS4', $parent, $manager);
        $this->createCategory('PS4 Pro', $parent, $manager);
        $this->createCategory('Xbox One X', $parent, $manager);
        $this->createCategory('PS5', $parent, $manager);
        $this->createCategory('Xbox Series X', $parent, $manager);
        $this->createCategory('Xbox Series S', $parent, $manager);        


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

        $manager->flush();
    }

    public function createCategory(string $name, Categories $parent =null, ObjectManager $manager)
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