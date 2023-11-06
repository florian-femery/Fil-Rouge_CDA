<?php

namespace App\Entity;

use App\Repository\FournisseursRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: FournisseursRepository::class)]
class Fournisseurs
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 255)]
    private ?string $namefourni = null;

    #[ORM\Column(length: 255)]
    private ?string $adressefourni = null;

    #[ORM\Column(length: 10)]
    private ?string $phonefourni = null;

    #[ORM\Column(length: 255)]
    private ?string $mailfourni = null;

    #[ORM\OneToMany(mappedBy: 'Fournisseurs', targetEntity: Products::class)]
    private Collection $products;

    public function __construct()
    {
        $this->products = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getNamefourni(): ?string
    {
        return $this->namefourni;
    }

    public function setNamefourni(string $namefourni): static
    {
        $this->namefourni = $namefourni;

        return $this;
    }

    public function getAdressefourni(): ?string
    {
        return $this->adressefourni;
    }

    public function setAdressefourni(string $adressefourni): static
    {
        $this->adressefourni = $adressefourni;

        return $this;
    }

    public function getPhonefourni(): ?string
    {
        return $this->phonefourni;
    }

    public function setPhonefourni(string $phonefourni): static
    {
        $this->phonefourni = $phonefourni;

        return $this;
    }

    public function getMailfourni(): ?string
    {
        return $this->mailfourni;
    }

    public function setMailfourni(string $mailfourni): static
    {
        $this->mailfourni = $mailfourni;

        return $this;
    }

    /**
     * @return Collection<int, Products>
     */
    public function getProducts(): Collection
    {
        return $this->products;
    }

    public function addProduct(Products $product): static
    {
        if (!$this->products->contains($product)) {
            $this->products->add($product);
            $product->setFournisseurs($this);
        }

        return $this;
    }

    public function removeProduct(Products $product): static
    {
        if ($this->products->removeElement($product)) {
            // set the owning side to null (unless already changed)
            if ($product->getFournisseurs() === $this) {
                $product->setFournisseurs(null);
            }
        }

        return $this;
    }
}
