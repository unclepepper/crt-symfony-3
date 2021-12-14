<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use App\Entity\News;


use Doctrine\Persistence\ManagerRegistry;

class IndexController extends AbstractController
{
    #[Route('/', name: 'index')]
    public function index(ManagerRegistry $doctrine): Response
    {
       
        $news = $doctrine->getRepository(News::class)->findAll();
        return $this->render('index/index.html.twig', [
            'controller_name' => 'IndexController',
            'news' => $news,
        ]);
    }
}
