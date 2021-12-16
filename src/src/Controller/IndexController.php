<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use App\Entity\News;
use App\Repository\NewsRepository;
use Doctrine\Persistence\ManagerRegistry;

class IndexController extends AbstractController
{
    #[Route('/', name: 'index')]
    public function index(NewsRepository $doctrine): Response
    {
       
        $news = $doctrine->findAll();
        return $this->render('index/index.html.twig', [
           
            'news' => $news,
        ]);
    }
    
}
