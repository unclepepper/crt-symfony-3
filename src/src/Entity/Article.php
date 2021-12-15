<?php

namespace App\Entity;

use App\Repository\ArticleRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=ArticleRepository::class)
 */
class Article
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $text;

    /**
     * @ORM\Column(type="datetime_immutable")
     */
    private $createAt;

    /**
     * @ORM\ManyToOne(targetEntity=News::class, inversedBy="articals")
     */
    private $news;

    /**
     * @ORM\OneToMany(targetEntity=News::class, mappedBy="article")
     */
    private $id_news;

    public function __construct()
    {
        $this->id_news = new ArrayCollection();
        
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getText(): ?string
    {
        return $this->text;
    }

    public function setText(string $text): self
    {
        $this->text = $text;

        return $this;
    }

    public function getCreateAt(): ?\DateTimeImmutable
    {
        return $this->createAt;
    }

    public function setCreateAt(\DateTimeImmutable $createAt): self
    {
        $this->createAt = $createAt;

        return $this;
    }

    public function getNews(): ?News
    {
        return $this->news;
    }

    public function setNews(?News $news): self
    {
        $this->news = $news;

        return $this;
    }

    /**
     * @return Collection|News[]
     */
    public function getIdNews(): Collection
    {
        return $this->id_news;
    }

    public function addIdNews(News $idNews): self
    {
        if (!$this->id_news->contains($idNews)) {
            $this->id_news[] = $idNews;
            $idNews->setArticle($this);
        }

        return $this;
    }

    public function removeIdNews(News $idNews): self
    {
        if ($this->id_news->removeElement($idNews)) {
            // set the owning side to null (unless already changed)
            if ($idNews->getArticle() === $this) {
                $idNews->setArticle(null);
            }
        }

        return $this;
    }
    
}
