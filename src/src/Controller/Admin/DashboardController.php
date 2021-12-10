<?php

namespace App\Controller\Admin;

use EasyCorp\Bundle\EasyAdminBundle\Config\Dashboard;
use EasyCorp\Bundle\EasyAdminBundle\Config\MenuItem;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractDashboardController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use App\Entity\News as NewsEntity;
use App\Entity\Article as ArticleEntity;


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
        yield MenuItem::linkToDashboard('Panel', 'fa fa-home');
        yield MenuItem::linkToCrud('News', 'fas fa-list', NewsEntity::class);
        yield MenuItem::linkToCrud('Article', 'fas fa-list', ArticleEntity::class);

    }
}