<?php

namespace App\Controller;

use App\Entity\Article;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use App\Entity\News;
use App\Repository\NewsRepository;

class ArticleController extends AbstractController
{
    #[Route('/article', name: 'article')]
    public function index(NewsRepository $doctrine): Response
    {
        $news = $doctrine->findAll();
       
        return $this->render('article/index.html.twig', [
            'news' => $news,
           

        ]);
    }
    
}
