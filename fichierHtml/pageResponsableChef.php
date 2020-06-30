<?php 
    session_start();
    include'connexion.php';
?>

<!DOCTYPE html>
<html lang="fr">
<head>
    <title>ENSAE</title>
    <meta charset="utf-8">
    <!-- Gérer les compatibiltés -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <!-- Gérer l'affichage sur tous les écran avec un zoom prédéfini -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="Site ENSAE-Dakar" content="Projet programmation WEB">
    <meta name="Danis JIOGUE" content="Etudiant ITS4">
  


    <!-- Pour accéder aux classes du bootstrap -->
    <link rel="stylesheet" href="../fichierCSS/bootstrap/css/bootstrap.min.css">
    <!-- Gestion des polices-->
    <link href="../fichierCSS/bootstrap/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">


    <!--Icon du dessus-->
    <link rel="shortcut icon" type="image/x-icon" href="../fichierImage/logo.png" />


    <!-- Ma propre feuille de style -->
    <link rel="stylesheet" type="text/css" href="../fichierCSS/style.css">
    <link href="../fichierCSS/policePersonnalise.css" rel="stylesheet" type="text/css">
    <link href="../fichierCSS/standard_style.css" rel="stylesheet" type="text/css">

    
</head>

<body id="page-top" class="index">

  <!-- Menu de navigation -->
  <nav class="navbar navbar-default navbar-fixed-top">
        <div class="container">
            <!-- Regroupement des options d'affichage -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand page-scroll" href="#page-top">BIENVENUE A ENSAE-Dakar</a>
            </div>

            <!-- Collecter les liens de navigation, les formulaires et autres contenus pour le défilement -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Information ENSAE<b class="caret"> </b></a>
                        <ul class="dropdown-menu">
                            <li ><a id="styledropdown" href="#objectifs" >Objectif de la formation</a></li>
                            <li><a href="#administration" id="styledropdown">Membres de l'administration</a></li>
                        </ul>
                    </li>

                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Gestion du personnel<b class="caret"> </b></a>
                        <ul class="dropdown-menu">
                            <li><a href="#GestionEtudiant" id="styledropdown">Gestion des étudiants</a></li>
                            <li><a href="#GestionEnseignant" id="styledropdown">Gestion des enseignants</a></li>
                        </ul>
                    </li>

                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Informations personnelles<b class="caret"> </b></a>
                        <ul class="dropdown-menu">
                            <li><a href="#informations_personnelle" id="styledropdown">Gérer ses informations</a></li>
                            <li><a href="#deconnexion" id="styledropdown">Se déconnecter</a></li>
                        </ul>
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
                      <img src="../fichierImage/garde0.jfif" alt="garde0" style="height: 600px">
                      <div class="carousel-caption">
                        Situation géographique de l'ENSAE
                      </div>
                    </div>
                    <div class="item ">
                      <img src="../fichierImage/page0.jpg" style=" width:1500px; height: 600px" alt="Visite Ministre">
                      <div class="carousel-caption">
                        Visite du Ministre de l'économie de la coopération et du plan
                      </div>
                    </div>
                    <div class="item ">
                      <img src="../fichierImage/page2.jpg" alt="Visite Ministre">
                      <div class="carousel-caption">
                        Visite du Ministre de l'économie de la coopération et du plan
                      </div>
                    </div>
                    <div class="item ">
                      <img src="../fichierImage/page1.jpg" alt="Visite à IFPRI" style="width:1500px; height: 600px">
                      <div class="carousel-caption">
                        Rencontre en ENSAE-Dakar et IFPRI
                      </div>
                    </div>
                    <div class="item ">
                      <img src="../fichierImage/page3.JPG" alt="Remise des diplômes" style="width:1500px; height: 600px">
                      <div class="carousel-caption">
                        Cérémonie Journée d'intégration
                    </div>
                  </div>
                  <div class="item ">
                      <img src="../fichierImage/page4.JPG" alt="Remise des diplômes" style="width:1500px; height: 600px">
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

    <section id="objectifs" class="bg-light-gray">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading">OBJECTIF DE LA FORMATION A L'ENSAE</h2>
                    <h3 class="section-subheading text-muted" style='text-align: justify;'>L’objectif général de la formation est de la mettre à la disposition du systèmes statistiques des pays Africain des cadres compétants, capables de concevoir et réaliser des enquêtes et recensement d'envergure national, intervenir dans le calcul des agrégats macroéconomiques.</h3>
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
                        <img src="../fichierImage/Image/image3.jpg">
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
                        <img src="../fichierImage/Image/image7.jpg">
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
                        <img src="../fichierImage/Image/image1.jpg">
                    </a>
                    <div class="portfolio-caption">
                        <h4>Une formation orientée résultat ...</h4>
                    </div>
                </div>
            </div>
            
        </div>
    </section>


    <section id="administration">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading">Présentation du personnel de l'ENSAE</h2>
                    <h3 class="section-subheading text-muted">L'ENSAE ancienement reconnu sous l'appelation ENSA, à vu le jour en Octobre 2008. Cette école a des étudiants provenant d'origines diverses. Pour le compte de l'anné scolaire 2019 - 2020, 15 nationalités Africaines sont représentées au sein de l'ENSAE.</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <ul class="timeline">
                        <li>
                            <div class="timeline-image">
                                <img class="img-circle img-responsive fa-2x" src="" alt="">
                            </div>
                            <div class="timeline-panel">
                                <div class="timeline-heading">
                                    <h4 class="subheading">Directeur</h4>
                                </div>
                                <div class="timeline-body">
                                    <p class="text-muted" style='text-align: justify'>M. Abdou DIOUF : directeur de l'ENSAE. Il est entré en service depuis octobre 2017. </p>
                                </div>
                            </div>
                        </li>
                        <li class="timeline-inverted">
                            <div class="timeline-image">
                                <!-- <img class="img-circle img-responsive" src="" alt=""> -->
                            </div>
                            <div class="timeline-panel">
                                <div class="timeline-heading">
                                    <h4 class="subheading">Cordinateur des études</h4>
                                </div>
                                <div class="timeline-body">
                                    <p class="text-muted" style='text-align: justify'>Ce poste est assuré depuis 2008 par M. Mamadou DANSHOKHO. Qui est un ancien des écoles du RESA</p>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="timeline-image">
                                <!-- <img class="img-circle img-responsive" src="" alt=""> -->
                            </div>
                            <div class="timeline-panel">
                                <div class="timeline-heading">
                                    <h4 class="subheading">Dr Souleymane FOFANA</h4>
                                </div>
                                <div class="timeline-body">
                                    <p class="text-muted" style='text-align: justify'>Responsable de la filière des Ingénieurs des Travaux Statistiques (ITS). Il a obtenu son Doctorat en 2005 spécialité des probabilités appliqué.</p>
                                </div>
                            </div>
                        </li>
                        <li class="timeline-inverted">
                            <div class="timeline-image">
                                <!-- <img class="img-circle img-responsive" src="Images/jus.jpg" alt=""> -->
                            </div>
                            <div class="timeline-panel">
                                <div class="timeline-heading">
                                    <h4 class="subheading">M. Idrissa DIAGNE</h4>
                                </div>
                                <div class="timeline-body">
                                    <p class="text-muted" style='text-align: justify'>Responsable de la formation des Ingénieurs des Statiscien Economistes. Il est un ressortissant de l'ENSAE promotion 2011 et actuellement en parallèle avec ses activités à l'ENSAE, il poursuit un programme de Doctorat à l'université de LAVAL.</p>
                                </div>
                            </div>
                        </li>
                        <li class="timeline-inverted">
                            <div class="timeline-image">
                                <!-- <img class="img-circle img-responsive" src="Images/logisticm.jpg" alt=""> -->
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </section>

    <!-- Informations personnelles --> 
        <?php
            $q_information = "SELECT * FROM responsable Where matricule_responsable = '".$_SESSION['matriculeResponsable']."'";
            $result = sqlsrv_query($conn,$q_information);
            $result_info = sqlsrv_fetch_array($result);
            
            if (empty($result_info['date_connexion']) || $result_info['pwd'] == '123456') {
                ?>
                    <script type="text/javascript">
                        alert("Merci de bienvouloir vous rendre dans la section Informations personnelles pour mettre à jour vos informations. En l'occurence votre mot de passe. \nLe cas écheant, vos prochaines connexion ne seront pas valides.");
                    </script>    
                <?php
            }
        ?>

    <!-- </Gestion des étudiants> -->
    <section id="GestionEtudiant">
        <?php
            include'GestionEtudiant.php';
        ?>
    </section>

    <!-- </Gestion des Enseignants> -->
    <section id="GestionEnseignant">
        <?php
            include'GestionEnseignant.php';
        ?>
    </section>

    <!-- Information sur le responsable -->
    <section id="informations_personnelle">
        <div class="container">
          
            <div class="col-lg-12 text-center">
                    <h2 class="section-heading">Vos informations personnelles</h2>
                    <h3 class="section-subheading text-muted">Vous avez la possibilité de mettre à jour et consulter vos informations personnelles. </h3>
            </div>
          <form method="POST" action="">
              
              <div class="form-row">
                <div class="form-group col-md-6">
                  <?php
                      echo "<img src='../fichierImage/photoEleve/".$result_info['photo_resp']."' style='width:200px;height:150px; padding-left:50px'>";
                  ?>
                </div>
                <div class="form-group col-md-6">
                  <label for="nom">Nom</label>
                  <input type="Nom" class="form-control"  name="nom" id="nom" value="<?=$result_info['nom']?>">
                </div>
                <div class="form-group col-md-6">
                  <label for="prenom">Prénom</label>
                  <input type="text" class="form-control" id="prenom" name="prenom" value="<?=$result_info['prenom']?>">
                </div>
                <div class="form-group col-md-6">
                  <label for="matricule">Votre statut</label>
                  <input type="text" class="form-control" name="statut" readonly="true" id="statut" value="<?=$result_info['statut']?>">
                </div>
                <div class="form-group col-md-6">
                  <label for="mail">Adresse email</label>
                  <input type="email" class="form-control" id="mail" name="mail" value="<?=$result_info['adresse_mail']?>">
                </div>
                <div class="form-group col-md-6">
                  <label for="matricule">Matricule</label>
                  <input type="text" class="form-control" name="matricule" readonly="true" id="matricule" value="<?=$result_info['matricule_responsable']?>">
                </div>
                
                <div class="form-group col-md-6">
                  <label for="connexion">Date & heure de dernière connexion</label>
                  <input type="text" class="form-control" id="statut_classe" readonly="true" name="statut_classe" value="<?=$result_info['date_connexion']?>">
                </div>
                
                <div class="form-group col-md-6">
                  <acronym title="Entrer le mot de passe normal"><label for="pwd">Votre mot de passe</label></acronym>
                  <input type="password" class="form-control" name="pwd" id="pwd" value="<?=$result_info['pwd']?>">
                </div>

                <div class="form-group col-md-6">
                  <label for="posteR">Votre poste au sein de l'ENSAE</label>
                  <input type="text" class="form-control" name="posteR" id="posteR" value="<?=$result_info['poste']?>">
                </div>
                
                <div class="form-group col-md-6">
                  <acronym title="Entrer le mot de passe normal"><label for="fonction">Votre date de prise de fonction</label></acronym>
                  <input type="text" class="form-control" name="fonction" id="fonction" value="<?=$result_info['date_fonction']?>">
                </div>
              </div>
              
              <input type="submit" name="modifie_info" onclick="modifie_infos()" class="btn btn-primary" value="Effectuer la modification">
              <!-- <button type="submit" name="modifie_info" onclick="modifie_infos"  class="btn btn-primary"></button> -->
            </form>

            <?php
                if(isset($_POST['modifie_info'])){
                  //Hashage ddu mot de passe
                  $options = [
                      'cost' => 12,
                  ];
                  $pwd_etd = password_hash($_POST['pwd'], PASSWORD_BCRYPT, $options);

                  //Sauvegarde du mot de passe hahé dans la table connexion
                  $q_con = "UPDATE  connexion SET pwd = '".$pwd_etd."', date_connexion = '".date('Y-m-d H:i:s')."' WHERE matricule = '".$_SESSION['matriculeResponsable']."'";
                  $q_conn = sqlsrv_query($conn, $q_con);


                  //Sauvegarde des infos de l'étudiant
                  $q_sau = "UPDATE responsable SET nom ='".$_POST['nom']."', prenom ='".$_POST['prenom']."', poste ='".$_POST['posteR']."', date_fonction='".$_POST['fonction']."', adresse_mail = '".$_POST['mail']."', date_connexion = '".date('Y-m-d H:i:s')."', statut = '".$_POST['statut']."' , pwd = '".$pwd_etd."' WHERE matricule_responsable = '".$_SESSION['matriculeResponsable']."'";
                  $q_sauv = sqlsrv_query($conn, $q_sau);
                  // echo $q_sau;
                  // echo "<br>";
                  // echo $q_con;
                  // var_dump($q_sauv);
                  // var_dump($q_conn);

                        if ($q_conn) {
                          if($q_sauv){
                            ?>
                                 <script type="text/javascript">
                                     alert("Informations update avec succès.\nMerci de re-actualiser la page.");
                                 </script>
                            <?php
                          }
                          else{
                            ?>
                                 <script type="text/javascript">
                                     alert("Une erreur est survenue lors du hashage de votre mot de passe. \n Merci de ressayer l'opération.");
                                 </script>
                            <?php
                          }   
                        }
                }
            ?>

          
        </div>
    </section>

    
    <!-- Déconnexion -->
        <form method="POST" id="deconnexion">
            <div class="row">
                <div class=" col-sm-6">
                    <input type="submit" name="deconnexion" class="btn  btn-primary  btn-lg" value="Se déconnecter">    
                </div>
                
            </div>
             

            <?php
                if(isset($_POST['deconnexion'])){

                    session_destroy();
                    ?>
                        <script>
                            window.location.href=('../index.php');
                        </script>
                    <?php
                }
            ?>           
        </form>
    
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
    


    <!-- Portfolio -->
    <!-- Détailler les contenus listés! -->

    <!-- Référence -->
    <div class="portfolio-modal modal fade" id="reference" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-content">
            <div class="close-modal" data-dismiss="modal">
                <div class="lr">
                    <div class="rl">
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-lg-offset-2">
                        <div class="modal-body">
                            <!-- Détails -->
                            <h4>Une référence en matière travail sur les données</h4>
                            <p class="item-intro text-muted">Les produits de l'Ecole Nationale de la Statistique et de l'Analyse Economique sont réputés être de très bonne qualité. Ceci s'illustre par la confiance et le nombre sans cesse croissant de partenariat que l'école a avec les strutctures natioanles, sous-régionales, internationales et des étblissements de renomé internationale.</p>
                            <img class="img-responsive" src="fichierImage/Image/image1.jpg" alt="">
                            <button type="button" class="btn btn-primary" data-dismiss="modal"><i class="fa fa-times"></i></button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Décisionnel -->
    <div class="portfolio-modal modal fade" id="aide" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-content">
            <div class="close-modal" data-dismiss="modal">
                <div class="lr">
                    <div class="rl">
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-lg-offset-2">
                        <div class="modal-body">
                            <h4>Aide à la décision</h4>
                            <p style='text-align: justify'>Mettre à la disposition des décideurs des ressources humaines capables de mener des études qui collent le plus à la réalité avec des outils modernes de télécommunications.</p>
                            <img class="img-responsive img-centered" src="fichierImage/Image/image2.jpg" alt="">
                            <button type="button" class="btn btn-primary" data-dismiss="modal"><i class="fa fa-times"></i></button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Résultats -->
    <div class="portfolio-modal modal fade" id="resultats" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-content">
            <div class="close-modal" data-dismiss="modal">
                <div class="lr">
                    <div class="rl">
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-lg-offset-2">
                        <div class="modal-body">
                            <!-- Détails -->
                            <h4>Résultats attendus</h4>
                            <p class="item-intro text-muted">La formation à l'ENSAE devrait pemerttre aux apprenants d'être des as dans le domaines de la statistique. En effet, avec le boom démographique auquel est confronté l'Afrique il est très important d'avoir des ressources humaines de qualités pour mener des études et donner des résultats qui reflètent le plus possible la réalité des populations. Ces données statistiques sont d'avantages importantes pour :</p>
                            <ul class="fa-ul" style='text-align: left'>
                                <li><i class="fa-li fa fa-spinner fa-spin"></i>Une bonne planification des dépenses de l'Etat ;</li>
                                <br>
                                <li><i class="fa-li fa fa-spinner fa-spin"></i>Permettre au pays d'être au rendez-vous sur les programmes arrêtés au niveau international telle que le programme de développement durable 2030 : les Objectifs du Développement Durable (ODD) ;</li>
                                <br>
                                <li><i class="fa-li fa fa-spinner fa-spin"></i>Facilité la comparaison entre les pays de mêmes profil ceci dans l'optique de se donner les obectifs sur le chemin à parcourir pour au moins égaler les autres ; </li>
                                <br>
                                <li><i class="fa-li fa fa-spinner fa-spin"></i>Concourir à une meilleure image du pays à l'international, ce qui pourrait aboutir à une hausse des Investissements Direct Etrangers.</li>
                                
                            </ul>
                            <img class="img-responsive img-centered" src="fichierImage/Image/image3.jpg" alt="">
                            <button type="button" class="btn btn-primary" data-dismiss="modal"><i class="fa fa-times"></i></button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


  <!-- Lien vers le javaScript -->
  
    <script type="text/javaScript" src="../fichierCSS/bootstrap/js/jquery-3.4.1.min.js" ></script>
    <script type="text/javaScript" src="../fichierCSS/bootstrap/js/bootstrap.min.js" ></script>

    <!-- Plugin JavaScript -->
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
    <script src="../fichierJavaScript/classie.js"></script>
    <script src="../fichierJavaScript/cbpAnimatedHeader.js"></script>

    <script src="../fichierJavaScript/jqBootstrapValidation.js"></script-->
    <script src="../fichierJavaScript/nous_contacter.js"></script>

    <!-- Mes scripts JavaScript -->
    <script src="../fichierJavaScript/accueil.js"></script>

</body>
</html>