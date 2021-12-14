<?php

namespace App\Controller;

use Doctrine\ORM\Mapping\Id;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use App\Entity\News;

class NewsController extends AbstractController
{
    #[Route('/news/{id}', name: 'news')]
    public function index(ManagerRegistry $doctrine, $id): Response
    {
        $new = $doctrine->getRepository(News::class)->findOneBy(['id' => $id]);
        return $this->render('news/index.html.twig', [
            'new' => $new,
            
        ]);
    }
    
}
