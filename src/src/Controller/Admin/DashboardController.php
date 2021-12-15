<?php

namespace App\Controller\Admin;

use EasyCorp\Bundle\EasyAdminBundle\Config\Dashboard;
use EasyCorp\Bundle\EasyAdminBundle\Config\MenuItem;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractDashboardController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use App\Entity\News as NewsEntity;
use App\Entity\Article as ArticleEntity;
use App\Entity\User as UserEntity;



class DashboardController extends AbstractDashboardController
{
   
    /**
     * @Route("/admin", name="admin")
     */
    public function index(): Response
    {
        return parent::index();
    }

    public function configureDashboard(): Dashboard
    {
        return Dashboard::new()
            ->setTitle('PanelAdmin');
            
    }

    public function configureMenuItems(): iterable
    {
        
        yield MenuItem::linkToDashboard('Panel', 'fab fa-android');
        yield MenuItem::linktoRoute('Back to Index', 'fas fa-home', 'index');
        yield MenuItem::linkToCrud('News', 'fas fa-comments', NewsEntity::class);
        yield MenuItem::linkToCrud('Article', 'fas fa-comments', ArticleEntity::class);
        yield MenuItem::linkToCrud('User', 'fas fa-user', UserEntity::class);
        

    }
}
