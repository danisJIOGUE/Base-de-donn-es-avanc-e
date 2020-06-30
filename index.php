<?php session_start();?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Gérer l'affichage sur tous les écran avec un zoom prédéfini -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
	<title>Accueil</title>
	
	
	<!-- Pour accéder aux classes du bootstrap -->
	<link rel="stylesheet" href="fichierCSS/bootstrap/css/bootstrap.min.css">
    <!-- CSS Personnalisé -->
    <link href="fichierCSS/style.css" rel="stylesheet">

    <!--Icon du dessus-->
    <link rel="shortcut icon" type="image/x-icon" href="fichierImage/logo.png" />

	<!-- Police personnalisée -->
	<link href="fichierCSS/bootstrap/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<link href="fichierCSS/policePersonnalise.css" rel="stylesheet" type="text/css">
</head>

<body id="page-top" class="index">
<!--    
 -->
    <!-- Zone de redirection suivant les différents profils de connexion (visiteur ou étudiant ou administration) -->
    <!-- Cette zone doit être définit avant le header de la page actuelle pour qu'elle puisse marcher -->
    <?php

        include 'fichierHtml/connexion.php';   
    ?>

	<!-- Menu de navigation -->
	<nav class="navbar navbar-default navbar-fixed-top">
        <div class="container">
            <!-- Regroupement des options d'affichage -->
            <div class="navbar-header page-scroll">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand page-scroll" href="#page-top">Gestion du personnel de l'ENSAE-Dakar</a>
            </div>

            <!-- Collecter les liens de navigation, les formulaires et autres contenus pour le défilement -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li class="hidden">
                        <a href="#page-top"></a>
                    </li>
                    <li class="page-scroll">
                    	<a href="#Description">Description projet</a>
					</li>
                    <li>
                        <a class="page-scroll" href="#actualite">Actualité ENSAE</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#perspectives">Perspectives ENSAE</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#connexion">connexion</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>

    <!-- Entête  >
    <header>
        <div class="container" -->
            <div class="intro-text">
                <div id="carousel-appdev" class="carousel slide" data-ride="carousel">
                  <!-- Boutton de navigation -->
                  <ol class="carousel-indicators">
                    <li data-target="#carousel-appdev" data-slide-to="0" class="active"></li>
                    <li data-target="#carousel-appdev" data-slide-to="1"></li>
                    <li data-target="#carousel-appdev" data-slide-to="2"></li>
                    <li data-target="#carousel-appdev" data-slide-to="3"></li>
                    <li data-target="#carousel-appdev" data-slide-to="4"></li>
                  </ol>

                  <!-- Wrapper for slides -->
                  <div class="carousel-inner" role="listbox">
                    <div class="item active">
                      <img src="fichierImage/garde0.jfif" alt="garde0" style="height: 600px">
                      <div class="carousel-caption">
                        Situation géographique de l'ENSAE
                      </div>
                    </div>
                    <div class="item ">
                      <img src="fichierImage/page0.jpg" style=" width:1500px; height: 600px" alt="Visite Ministre">
                      <div class="carousel-caption">
                        Visite du Ministre de l'économie de la coopération et du plan
                      </div>
                    </div>
                    <div class="item ">
                      <img src="fichierImage/page2.jpg" alt="Visite Ministre">
                      <div class="carousel-caption">
                        Visite du Ministre de l'économie de la coopération et du plan
                      </div>
                    </div>
                    <div class="item ">
                      <img src="fichierImage/page1.jpg" alt="Visite à IFPRI" style="width:1500px; height: 600px">
                      <div class="carousel-caption">
                        Rencontre en ENSAE-Dakar et IFPRI
                      </div>
                    </div>
                    <div class="item ">
                      <img src="fichierImage/page3.JPG" alt="Remise des diplômes" style="width:1500px; height: 600px">
                      <div class="carousel-caption">
                        Cérémonie Journée d'intégration
                    </div>
                  </div>
                  <div class="item ">
                      <img src="fichierImage/page4.JPG" alt="Remise des diplômes" style="width:1500px; height: 600px">
                      <div class="carousel-caption">
                        Cérémonie Journée d'intégration
                    </div>
                  </div>
                   <center>
                     <a href="#Description" class="btn btn-circle page-scroll">
                        <i class="fa fa-angle-double-down animated"></i>
                  </a> 
                  </center>
                  <!-- Controls -->
                  <a class="left carousel-control" href="#carousel-appdev" role="button" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                    <span class="sr-only">Précédent</span>
                  </a>
                  <a class="right carousel-control" href="#carousel-appdev" role="button" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                    <span class="sr-only">Suivant</span>
                  </a>
                  
                  
                </div>  
            </div>
        </div>    
    <!-- </header> -->

    <section id="Description">  
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading">Description du projet</h2>
                    <!--h3 class="section-subheading text-muted">La seule limite </h3-->
                </div>
            </div>
            <div class="row text-center">
                <div class="col-md-4">
                    <span class="fa-stack fa-4x">
                        <i class="fa fa-circle fa-stack-2x text-primary"></i>
                        <i class="fa fa-gears fa-stack-1x fa-inverse"></i>
                    </span>
                    <h4 class="service-heading">Contexte et justification</h4>
                    <p class="text-muted" style='text-align: justify;'>Ce projet s'inscrit dans le cadre du cours de base de données avancées, et consiste à la <strong>MISE EN PLACE D’UNE BASE DE DONNÉES ET D’UNE APPLICATION WEB DE GESTION SCOLAIRE SÉCURISÉE</strong>.<br>
                    Pour parvenir à cette fin, l'utilisation des languages html, css, javaScript et php sont recommandés. Cependant, dans l'optique de rendre agréable la mise en forme de la page, nous avons fait recours au framework bootstrap et jquery.
                </p>
                </div>
                <div class="col-md-4">
                    <span class="fa-stack fa-4x">
                        <i class="fa fa-circle fa-stack-2x text-primary"></i>
                        <i class="fa fa-line-chart fa-stack-1x fa-inverse"></i>
                    </span>
                    <h4 class="service-heading">Objectifs</h4>
                    <p class="text-muted" style='text-align: justify;'>Le site de gestion de l'ENSAE-Dakar a prinicpalement pour objectif d'aider dans la réalisation des tâches courantes de l'administration.<br> 
                    Ceci étant, gâce à ce site, on pourra automatiser la gestion des emplois de temps, des bulletins des élèves la programmation des cours, avoir l'appréhension des usagers externes à l'école sur la qualité et leur niveau de considération pour l'école.</p>
                </div>
                <div class="col-md-4">
                    <span class="fa-stack fa-4x">
                        <i class="fa fa-circle fa-stack-2x text-primary"></i>
                        <i class="fa fa-pie-chart fa-stack-1x fa-inverse"></i>
                    </span>
                    <h4 class="service-heading">Repartition des tâches suivant les profils</h4>
                    <p class="text-muted" style='text-align: justify;'>Cette application de gestion scolaire de l'ENSAE-Dakar donne l'accès à 5 profils différents. Celui des élèves simples, élèves délégues de classe, des enseignants, des responsables et des responsables de filières.</p>
                </div>
                
            </div>
        </div>
    </section>

    <section id="actualite"  class="bg-light-gray">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading">Rénovation pédagogique</h2>
                    <h5 class="section-subheading text-muted" style='text-align: justify;'>L'ENSAE-Dakar est membe du Réseau des Ecoles de Statistiques AAfricaine (RESA). Dans le cadre de la préparation de la mise en œuvre de cette rénovation pédagogique, les Directeurs du RESA ont un point de presse, le mardi 15 Octobre 2019, dans les locaux de l’ENSEA d’Abidjan.<br>
                    Pour atteindre l’Excellence en Enseignement-Apprentissage, les écoles de formation statistique d’Afrique ont décidé de renforcer les filières existantes et de créer de nouvelles filières de formation en réponse aux besoins des Systèmes de Statistique Nationaux (SSN) des entreprises et des administrations de la sous-région.</h5>
                </div>
            </div>
   
            <div class="row">
                <div class="col-md-4 col-sm-6 portfolio-item">
                    <a href="#reference" class="portfolio-link" data-toggle="modal">
                        <div class="portfolio-hover">
                            <div class="portfolio-hover-content">
                                <i class="fa fa-plus fa-3x"></i>
                            </div>
                        </div>
                        <img src="fichierImage/renov1.jfif" class="img-responsive" style="height: 150px">
                    </a>
                    <div class="portfolio-caption">
                        <h4>Être une référence ...</h4>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6 portfolio-item">
                    <a href="#aide" class="portfolio-link" data-toggle="modal">
                        <div class="portfolio-hover">
                            <div class="portfolio-hover-content">
                                <i class="fa fa-plus fa-3x"></i>
                            </div>
                        </div>
                        <img src="fichierImage/renov2.jfif" class="img-responsive" style="height: 150px">
                    </a>
                    <div class="portfolio-caption">
                        <h4>et un outil décisionnel ...</h4>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6 portfolio-item">
                    <a href="#resultats" class="portfolio-link" data-toggle="modal">
                        <div class="portfolio-hover">
                            <div class="portfolio-hover-content">
                                <i class="fa fa-plus fa-3x"></i>
                            </div>
                        </div>
                        <img src="fichierImage/renov3.jfif" class="img-responsive" style="height: 150px">
                    </a>
                    <div class="portfolio-caption">
                        <h4>avec plusieurs résultats très informatifs.</h4>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6 portfolio-item">
                    <a href="#resultats" class="portfolio-link" data-toggle="modal">
                        <div class="portfolio-hover">
                            <div class="portfolio-hover-content">
                                <i class="fa fa-plus fa-3x"></i>
                            </div>
                        </div>
                        <img src="fichierImage/renov4.jfif" class="img-responsive" style="height: 150px">
                    </a>
                    <div class="portfolio-caption">
                        <h4>avec plusieurs résultats très informatifs.</h4>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6 portfolio-item">
                    <a href="#resultats" class="portfolio-link" data-toggle="modal">
                        <div class="portfolio-hover">
                            <div class="portfolio-hover-content">
                                <i class="fa fa-plus fa-3x"></i>
                            </div>
                        </div>
                        <img src="fichierImage/renov5.jfif" class="img-responsive" style="height: 150px">
                    </a>
                    <div class="portfolio-caption">
                        <h4>avec plusieurs résultats très informatifs.</h4>
                    </div>

                </div>
            </div>
            
        </div>
    </section>

    <section id="perspectives">
        <div class="container">
            <div class="responsive ">
            	<!--div class="row-5">
            		<div class="col-lg-6"-->
            			Projet de reconstruction du nouveau site de l'école à Diamniadio dans un horizon proche.<br>  
            			<iframe class="embed-responsive-item" width="400px" height="400px" src="https://www.youtube.com/embed/ADssRuHQkA0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
            		<!--/div>
            		<div class="col-lg-6"-->
            			
            		</div>
            		

            </div>
            	</div>
                
        </div>
        
    </section>

    

    <section id="connexion">
        <div class="container jumbotron text-center">
            <h3>FORMULAIRE D'AUTHENTIFICATION</h3>          
            <button type="Boutton" class="btn btn-success" data-toggle="modal" data-target="#loginModal">Entrer vos informations</button>
        </div>
        <div class="modal fade" role="dialog" id="loginModal" >
            <div class="modal-dialog">
                <form role="form" method="POST">
                <div class="modal-content">
                    <div class="modal-header">
                        <h3 class="modal-title">Formulaire de connexion</h3>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>

                    <div class="modal-body">
                        <div class="form-group">
                            <input type="text" name="matricule" id="matricule" required="required" placeholder="Entrer votre matriclue">
                        </div>
                        <div class="form-group">
                            <input type="password" name="pwd" id="pwd" required="required" placeholder="Entrer votre mot de passe" >
                        </div>
                    </div>

                    <div class="modal-footer">
                        <input type="submit" name="Submit" id="valide" value="connexion" class="btn btn-success" data-toggle="modal" data-target="#login2" onclick="valideConnexion()">
                    </div>
                </div>
                </form>
            </div>
        </div> 
        <?php 
            include 'fichierHtml/formConn.php';
        ?>      
    </section>


    


    <footer>
        <div class="container" style="background-color: black">
            <div class="row">
                <div class="col-md-4">
                    <span class="copyright" style="color: white">Copyright &copy; Danis JIOGUE 2020</span>
                </div>
                <div class="col-md-4">
                    <ul class="list-inline social-buttons">
                        <li><a href="https://twitter.com/home"><i class="fa fa-twitter"></i></a>
                        </li>
                        <li><a href="https://web.facebook.com/?_rdc=1&_rdr"><i class="fa fa-facebook"></i></a>
                        </li>
                        <li><a href="https://www.linkedin.com/in/danis-jiogue-88a193136/"><i class="fa fa-linkedin"></i></a>
                        </li>
                    </ul>
                </div>
                <div class="col-md-4">
                    <ul class="list-inline quicklinks">
                        <li><a href="#">Guide méthodologique Projet Web</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </footer>    
    





	<!-- Lien vers le javaScript -->
	
	<script type="text/javaScript" src="fichierCSS/bootstrap/js/jquery-3.4.1.min.js" ></script>
    <script type="text/javaScript" src="fichierCSS/bootstrap/js/bootstrap.min.js" ></script>

    <!-- Plugin JavaScript -->
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
    <script src="fichierJavaScript/classie.js"></script>
    <script src="fichierJavaScript/cbpAnimatedHeader.js"></script>

    <script src="fichierJavaScript/jqBootstrapValidation.js"></script-->
    <script src="fichierJavaScript/nous_contacter.js"></script>

    <!-- Thème personnalisé JavaScript -->
    <script src="fichierJavaScript/accueil.js"></script>

</body>
</html>