<?php

namespace Theodo\EventBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Response;

class DefaultController extends Controller
{
    public function indexAction($name, $count)
    {
        /*$templating = $this->container->get('templating');


        $content = $templating->render(
            'EventBundle:Default:index.html.twig',
            array('name' => $name)
        );

        return new Response($content);*/


        $em = $this->getDoctrine()->getManager();
        /*$repo = $em->getRepository('EventBundle:Event');
        $event = $repo->findOneBy(array(
            'name' => 'Darth\'s surprise birthday party',
        ));
    */


        return $this->render('EventBundle:Default:index.html.twig',  array(
            'name' => $name,
            'count' => $count,
           // 'event' =>$event
        ));


    }
}
