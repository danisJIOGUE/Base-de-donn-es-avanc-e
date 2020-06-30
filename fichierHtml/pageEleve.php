<?php session_start(); 
include 'connexion.php';?>
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
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">INFORMATIONS PERSONNELLES<b class="caret"> </b></a>
                        <ul class="dropdown-menu">
                            <li><a href="#informations_personnelle" id="styledropdown">Gérer ses informations</a></li>
                            <li><a href="#Sante" id="styledropdown">Etat de santé</a></li>
                            <li><a href="#discipline" id="styledropdown">Aspect disciplinaire</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">INFORMATIONS SCOLAIRE<b class="caret"> </b></a>
                        <ul class="dropdown-menu">
                            <li><a href="#emploiTemp" id="styledropdown">CONSULTER L'EMPLOI DU TEMPS</a></li>
                            <li><a href="#note" id="styledropdown">CONSULTER SES NOTES</a></li>
                        </ul>
                    </li>
                    
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Se déconnecter<b class="caret"> </b></a>
                        <ul class="dropdown-menu">
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
            $q_information = "SELECT * FROM etudiant Where matricule_etudiant = '".$_SESSION['matriculeEtudiant']."'";
            $result = sqlsrv_query($conn,$q_information);
            $result_info = sqlsrv_fetch_array($result);
            
            if (empty($result_info['date_connexion']) || $result_info['pwd'] == '12345') {
                ?>
                    <script type="text/javascript">
                        alert("Merci de bienvouloir vous rendre dans la section Informations personnelles pour mettre à jour vos informations. En l'occurence votre mot de passe. \nLe cas écheant, vos prochaines connexion ne seront pas valides.");
                    </script>    
                <?php
            }

    ?>


    <section id="informations_personnelle">
        <div class="container">
          
            <div class="col-lg-12 text-center">
                    <h2 class="section-heading">Vos informations personnelles</h2>
                    <h3 class="section-subheading text-muted">Vous avez la possibilité de mettre à jour vos informations strictement personnelles. Ceux relatives à l'aspect académiques sont du ressort de l'administration. Toutes fois, vous avez la possibilité de savoir quel membre de l'administration à modifier vos informations.</h3>
            </div>
          <form method="POST" action="">
              
              <div class="form-row">
                <div class="form-group col-md-6">
                  <?php
                      echo "<img src='../fichierImage/photoEleve/".$result_info['photo_etudiant']."' style='width:200px;height:150px; padding-left:50px'>";
                  ?>
                </div>
                <div class="form-group col-md-6">
                  <label for="nom">Nom</label>
                  <input type="Nom" class="form-control"  name="nom" id="nom" value="<?=$result_info['nom_etudiant']?>">
                </div>
                <div class="form-group col-md-6">
                  <label for="prenom">Prénom</label>
                  <input type="text" class="form-control" id="prenom" name="prenom" value="<?=$result_info['prenom_etd']?>">
                </div>
                <!-- <div class="form-group col-md-6">
                  <label for="mail">Adresse email</label>
                  <input type="email" class="form-control" id="mail" name="mail" value="<?=$result_info['email_etudiant']?>">
                </div> -->
                <div class="form-group col-md-6">
                  <label for="matricule">Matricule</label>
                  <input type="text" class="form-control" name="matricule" readonly="true" id="matricule" value="<?=$result_info['matricule_etudiant']?>">
                </div>
                <div class="form-group col-md-6">
                  <label for="naissance">Date de naissance</label>
                  <input type="text" class="form-control" name="naissance" id="naissance" value="<?=$result_info['date_naissance_etud']?>">
                </div>
                <div class="form-group col-md-6">
                  <label for="nationalite">Nationalité</label>
                  <input type="text" class="form-control" name="nationalite" id="nationalite" value="<?=$result_info['nationalite_etud']?>">
                </div>
                <div class="form-group col-md-3">
                  <label for="classe">Classe</label>
                  <input type="text" class="form-control" name="classe" readonly="true" id="classe" value="<?=$result_info['classe']?>">
                </div>
                <div class="form-group col-md-3">
                  <label for="classe">STATUT</label>
                  <input type="text" class="form-control" name="classe" id="classe" value="<?=$result_info['statut']?>">
                </div>
                <div class="form-group col-md-6">
                  <label for="connexion">Date & heure de dernière connexion</label>
                  <input type="text" class="form-control" id="statut_classe" readonly="true" name="statut_classe" value="<?=$result_info['date_connexion']?>">
                </div>
                <div class="form-group col-md-6">
                  <label for="modif">Date & heure de la dernière modification</label>
                  <input type="text" class="form-control" name="modif" id="modif" readonly="true" value="<?=$result_info['date_modification']?>">
                </div>
                <div class="form-group col-md-6">
                  <label for="personne">l'identifiant de la dernière personne à modifier vos informations</label>
                  <input type="text" class="form-control" id="personne" name="personne" readonly="true" value="<?=$result_info['id_user']?>">
                </div>
                <div class="form-group col-md-6">
                  <acronym title="Entrer le mot de passe normal"><label for="pwd">Votre mot de passe</label></acronym>
                  <input type="text" class="form-control" name="pwd" id="pwd" value="<?=$result_info['pwd']?>">
                </div>
                
                <div class="form-group col-md-6">
                  <label for="supprime">Vous avez été supprimé de la liste des élèves</label>
                  <input type="text" class="form-control" id="supprime" name="supprime" readonly="true" value="<?=$result_info['est_supprime']?>">
                </div>
                
              </div>

              <div class="form-group">
                  <label for="adresse">votre adresse à Dakar</label>
                <input type="text" class="form-control" id="adresse" name="adresse" placeholder="1234 Main St" value="<?=$result_info['adresse']?>">
                
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
                  $q_con = "UPDATE  connexion SET pwd = '".$pwd_etd."', date_connexion = '".date('Y-m-d H:i:s')."' WHERE matricule = '".$_SESSION['matriculeEtudiant']."'";
                  $q_conn = sqlsrv_query($conn, $q_con);


                  //Sauvegarde des infos de l'étudiant
                  $q_sau = "UPDATE etudiant SET nom_etudiant ='".$_POST['nom']."', prenom_etd ='".$_POST['prenom']."', date_naissance_etud ='".$_POST['naissance']."', statut = '".$_POST['statut']."', nationalite_etud='".$_POST['nationalite']."', date_connexion = '".date('Y-m-d H:i:s')."', pwd = '".$pwd_etd."', adresse = '".$_POST['adresse']."' WHERE matricule_etudiant = '".$_SESSION['matriculeEtudiant']."'";
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
                                     alert("Informations update avec succès");
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


    <section id="Sante">
        <div class="container">
            <div class="col-lg-12 text-center">
                    <h2 class="section-heading">METTRE A JOUR SES INFORMATIONS SANITAIRES</h2>
                    <h3 class="section-subheading text-muted">Vous avez la possibilité de mettre à jour les informations relatives à votre état de santé. <br> Ces dernières seront utilisées pour justifier vos éventuelles heures d'absences</h3>
            </div>
            <div class="row centered-form">
                <div class="col-xs-12 col-sm-12 col-md-8 col-sm-offset-2 col-md-offset-2">
                    <form role="form" method = "POST" enctype="multipart/form-data">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title" class="text-align:center"> 
                                    Merci de mettre à jour vos informations sanitaires
                                </h3>
                            </div>
                            
                            <div class="panel-body">
                                <div class="row">

                                    <div class="col-xs-6 col-sm-6 col-md-6">
                                        <div class="form-group">
                                            <input type="text" name="nomEtd" id="nomEtd"  class="form-control input-sm" readonly="true" value="<?=$result_info['nom_etudiant']?>">
                                        </div>
                                    </div>

                                    <div class="col-xs-6 col-sm-6 col-md-6">
                                        <div class="form-group">
                                            <input type="text" name="prenomEtd" id="prenomEtd" class="form-control input-sm" readonly="true" value="<?=$result_info['prenom_etd']?>">
                                        </div>
                                    </div>

                                    <div class="col-xs-6 col-sm-6 col-md-6">
                                        <div class="form-group">
                                            <input type="text" name="nomMaladie" id="nomMaladie" class="form-control input-sm" placeholder="le nom de votre maladie">
                                        </div>
                                    </div>

                                    <div class="col-xs-12 col-sm-12 col-md-12">
                                        <div class="form-group">
                                            <label>Avez vous effectuer un consultation médicale ?</label>
                                            <input type="radio" name="consultation" value="1" onclick="consultation(this)" required="required"> OUI
                                            <input type="radio" name="consultation" value="2" onclick="consultation(this)" required="required"> NON
                                        </div>
                                    </div> 

                                    <div class="col-xs-12 col-sm-12 col-md-12">
                                        <div class="form-group">
                                            <label id="hosp">Avez vous étez hospitalisé ?</label>
                                            <input type="radio" name="hospitalise" id="hops1"  value="1" onclick="hospitalise(this)" required="required"> OUI
                                            <input type="radio" name="hospitalise" id="hops1" value="2"  onclick="hospitalise(this)" required="required"> NON
                                        </div> 
                                    </div>

                                    <div class="col-xs-12 col-sm-12 col-md-12">
                                        <div class="form-group">
                                            <input type="number" name="durreH" id="durreH" style="display: none;" id="durreH" class="form-control input-sm" placeholder="Entrer la durée de votre hospitalaisation">
                                        </div>
                                    </div>


                                    <div class="col-xs-6 col-sm-6 col-md-6">
                                        <div class="form-group">
                                            <input type="datetime" name="dateD" id="dateD" class="form-control input-sm" placeholder="Entrer la Date de debut au format JJ/MOIS/ANNEE">
                                        </div>
                                    </div>

                                    <div class="col-xs-6 col-sm-6 col-md-6">
                                        <div class="form-group">
                                            <input type="datetime" name="dateF" id="dateF" class="form-control input-sm" placeholder="Entrer la Date de fin au format JJ/MOIS/ANNEE">
                                        </div>
                                    </div>

                                    <div class="col-xs-6 col-sm-6 col-md-6">
                                        <div class="form-group">
                                            <input type="number" name="durreM" id="durreM" class="form-control input-sm" placeholder="Entrer la durée de votre maladie">
                                        </div>
                                    </div>

                                    <div class="col-xs-12 col-sm-12 col-md-12">
                                        <div class="form-group">
                                            <acronym title="Taille < 300 Ko"><input type="hidden" name="MAX_FILE_SIZE" value="300000" /> <input type="file" name="pdfFile" /></acronym>
                                        </div> 
                                    </div>
                                </div>

                            </div>
                            <input type="submit" name = "envoieSante" value="Mettre à jour" class="btn btn-info btn-block">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <?php
            if (isset($_POST['envoieSante'])) {
                $infos = "INSERT INTO etat_sante (matricule, nom, prenom, nom_maladie, consultation, hospitalisation, duree_hospitalisation, duree_maladie, dateDebut, dateFin, justificatif, date_soumission) values ('".$_SESSION['matriculeEtudiant']."','".$result_info['nom_etudiant']."','".$result_info['prenom_etd']."','".$_POST['nomMaladie']."','".$_POST['consultation']."','".$_POST['hospitalise']."','".$_POST['durreH']."','".$_POST['durreM']."','".$_POST['dateD']."','".$_POST['dateF']."','".$_FILES['pdfFile']['name']."','".date('Y-m-d H:i:s')."')";
                $sante = sqlsrv_query($conn,$infos);
                // var_dump($sante);
                // var_dump($infos);
                if ($sante === false) {
                    ?>
                        <script type="text/javascript">
                            alert("Une erreur est survenue lors de la Sauvegarde de vos informations.\n Merci de bienvouloir reprendre l'opération");
                        </script>
                    <?php
                }
                else{
                    ?>
                        <script type="text/javascript">
                            alert("Etat de sante update avec succès.");
                        </script>
                    <?php
                }
            }
            
        ?>
        </div>
    </section>

    <!-- Aspect disciplinaire -->
    <section id="discipline">
        <div class="container">
            <?php
            // Recuperation des informations de l'étudiant dans les tbles absences & retards
                $q_nb_rtd = "SELECT nombre_minute FROM retard WHERE matricule_etudiant = '".$_SESSION['matriculeEtudiant']."'";;
                $params = array();
                $options =  array( "Scrollable" => SQLSRV_CURSOR_KEYSET );
                $r_nb_rtd = sqlsrv_query( $conn, $q_nb_rtd , $params, $options );

                $row_count = sqlsrv_num_rows( $r_nb_rtd );

                $data = []; // Tableau pour stocker les matricules existants
                for($i = 0; $i < $row_count; $i++){
                        $data[] = sqlsrv_fetch_array( $r_nb_rtd, SQLSRV_FETCH_ASSOC);
                    }
                $result_rtd = 0;
                foreach ($data as $key => $value) {   
                    $result_rtd = $result_rtd  + implode($value);
                }

                $q_nb_abs = "SELECT nombre_heure FROM absence WHERE matricule_etudiant = '".$_SESSION['matriculeEtudiant']."'";;
                $params = array();
                $options =  array( "Scrollable" => SQLSRV_CURSOR_KEYSET );
                $r_nb_abs = sqlsrv_query( $conn, $q_nb_abs , $params, $options );

                $row_count = sqlsrv_num_rows( $r_nb_abs );

                $data_abs = []; // Tableau pour stocker les matricules existants
                for($i = 0; $i < $row_count; $i++){
                        $data_abs[] = sqlsrv_fetch_array( $r_nb_abs, SQLSRV_FETCH_ASSOC);
                    }
                $result_abs = 0;
                foreach ($data_abs as $key => $value) {   
                    $result_abs = $result_abs  + implode($value);
                }
            ?>
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading"> ASPECT DISCIPLINAIRE </h2>
                    <h3 class="section-subheading text-muted">Voici le bilan de votre comportement disciplinaire sur l'année en cours en cours.</h3>
                </div>
            </div>
            <div class="row">
                <table class="table table-striped table-dark">
                  <thead>
                    <tr>
                      <strong><h3>Statisques sur les abscences et les retards</h3></strong>
                      <!-- <th scope="col">First</th>
                      <th scope="col">Last</th>
                      <th scope="col">Handle</th> -->
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <th scope="row">Nombre de minutes de retards</th>
                      <td><?=$result_rtd?></td> 
                    </tr>
                    <tr>
                      <th scope="row">Nombre d'heure d'absences</th>
                      <td><?=$result_abs?></td> 
                    </tr>
                  </tbody>
                </table>
            </div>
        </div>
    </section>
     

     <!-- Gestion des notes -->
    <?php
        //Connexion à la table
        $q_emploi1 = "SELECT * FROM emploiTemps WHERE idheure ='08h - 10h' AND code_jour = 'LUNDI'";
        $q_emploi2 = "SELECT * FROM emploiTemps WHERE idheure ='10h15 - 12h15' AND code_jour = 'LUNDI'";
        $q_emploi3 = "SELECT * FROM emploiTemps WHERE idheure ='14h30 - 16h30' AND code_jour = 'LUNDI'";
        $q_emploi4 = "SELECT * FROM emploiTemps WHERE idheure ='16h45 - 18h45' AND code_jour = 'LUNDI'";
        $q_emploi5 = "SELECT * FROM emploiTemps WHERE idheure ='08h - 10h' AND code_jour = 'MARDI'";
        $q_emploi6 = "SELECT * FROM emploiTemps WHERE idheure ='10h15 - 12h15' AND code_jour = 'MARDI'";
        $q_emploi7 = "SELECT * FROM emploiTemps WHERE idheure ='14h30 - 16h30' AND code_jour = 'MARDI'";
        $q_emploi8 = "SELECT * FROM emploiTemps WHERE idheure ='16h45 - 18h45' AND code_jour = 'MARDI'";
        $q_emploi9 = "SELECT * FROM emploiTemps WHERE idheure ='08h - 10h' AND code_jour = 'MERCREDI'";
        $q_emploi10 = "SELECT * FROM emploiTemps WHERE idheure ='10h15 - 12h15' AND code_jour = 'MERCREDI'";
        $q_emploi11 = "SELECT * FROM emploiTemps WHERE idheure ='08h - 10h' AND code_jour = 'JEUDI'";
        $q_emploi12 = "SELECT * FROM emploiTemps WHERE idheure ='10h15 - 12h15' AND code_jour = 'JEUDI'";
        $q_emploi13 = "SELECT * FROM emploiTemps WHERE idheure ='14h30 - 16h30' AND code_jour = 'JEUDI'";
        $q_emploi14 = "SELECT * FROM emploiTemps WHERE idheure ='16h45 - 18h45' AND code_jour = 'JEUDI'";
        $q_emploi15 = "SELECT * FROM emploiTemps WHERE idheure ='08h - 10h' AND code_jour = 'VENDREDI'";
        $q_emploi16 = "SELECT * FROM emploiTemps WHERE idheure ='10h15 - 12h15' AND code_jour = 'VENDREDI'";
        $q_emploi17 = "SELECT * FROM emploiTemps WHERE idheure ='14h30 - 16h30' AND code_jour = 'VENDREDI'";
        $q_emploi18 = "SELECT * FROM emploiTemps WHERE idheure ='16h45 - 18h45' AND code_jour = 'VENDREDI'";
        $q_emploi19 = "SELECT * FROM emploiTemps WHERE idheure ='08h - 10h' AND code_jour = 'SAMEDI'";
        $q_emploi20 = "SELECT * FROM emploiTemps WHERE idheure ='10h15 - 12h15' AND code_jour = 'SAMEDI'";

        $r_emploi1 = sqlsrv_query($conn, $q_emploi1);
        $r_emploi2 = sqlsrv_query($conn, $q_emploi2);
        $r_emploi3 = sqlsrv_query($conn, $q_emploi3);
        $r_emploi4 = sqlsrv_query($conn, $q_emploi4);
        $r_emploi5 = sqlsrv_query($conn, $q_emploi5);
        $r_emploi6 = sqlsrv_query($conn, $q_emploi6);
        $r_emploi7 = sqlsrv_query($conn, $q_emploi7);
        $r_emploi8 = sqlsrv_query($conn, $q_emploi8);
        $r_emploi9 = sqlsrv_query($conn, $q_emploi9);
        $r_emploi10 = sqlsrv_query($conn, $q_emploi10);
        $r_emploi11 = sqlsrv_query($conn, $q_emploi11);
        $r_emploi12 = sqlsrv_query($conn, $q_emploi12);
        $r_emploi13 = sqlsrv_query($conn, $q_emploi13);
        $r_emploi14 = sqlsrv_query($conn, $q_emploi14);
        $r_emploi15 = sqlsrv_query($conn, $q_emploi15);
        $r_emploi16 = sqlsrv_query($conn, $q_emploi16);
        $r_emploi17 = sqlsrv_query($conn, $q_emploi17);
        $r_emploi18 = sqlsrv_query($conn, $q_emploi18);
        $r_emploi19 = sqlsrv_query($conn, $q_emploi19);
        $r_emploi20 = sqlsrv_query($conn, $q_emploi20);

        $timetable1 = sqlsrv_fetch_array($r_emploi1);
        $timetable2 = sqlsrv_fetch_array($r_emploi2);
        $timetable3 = sqlsrv_fetch_array($r_emploi3);
        $timetable4 = sqlsrv_fetch_array($r_emploi4);
        $timetable5 = sqlsrv_fetch_array($r_emploi5);
        $timetable6 = sqlsrv_fetch_array($r_emploi6);
        $timetable7 = sqlsrv_fetch_array($r_emploi7);
        $timetable8 = sqlsrv_fetch_array($r_emploi8);
        $timetable9 = sqlsrv_fetch_array($r_emploi9);
        $timetable10 = sqlsrv_fetch_array($r_emploi10);
        $timetable11 = sqlsrv_fetch_array($r_emploi11);
        $timetable12 = sqlsrv_fetch_array($r_emploi12);
        $timetable13 = sqlsrv_fetch_array($r_emploi13);
        $timetable14 = sqlsrv_fetch_array($r_emploi14);
        $timetable15 = sqlsrv_fetch_array($r_emploi15);
        $timetable16 = sqlsrv_fetch_array($r_emploi16);
        $timetable17 = sqlsrv_fetch_array($r_emploi17);
        $timetable18 = sqlsrv_fetch_array($r_emploi18);
        $timetable19 = sqlsrv_fetch_array($r_emploi19);
        $timetable20 = sqlsrv_fetch_array($r_emploi20);

        // Recupération du nom des enseignants
        $q_nom1 = "SELECT * FROM enseignant WHERE matricule = '".$timetable1['matricule']."'";
        $q_nom2 = "SELECT * FROM enseignant WHERE matricule = '".$timetable2['matricule']."'";
        $q_nom3 = "SELECT * FROM enseignant WHERE matricule = '".$timetable3['matricule']."'";
        $q_nom4 = "SELECT * FROM enseignant WHERE matricule = '".$timetable4['matricule']."'";
        $q_nom5 = "SELECT * FROM enseignant WHERE matricule = '".$timetable5['matricule']."'";
        $q_nom6 = "SELECT * FROM enseignant WHERE matricule = '".$timetable6['matricule']."'";
        $q_nom7 = "SELECT * FROM enseignant WHERE matricule = '".$timetable7['matricule']."'";
        $q_nom8 = "SELECT * FROM enseignant WHERE matricule = '".$timetable8['matricule']."'";
        $q_nom9 = "SELECT * FROM enseignant WHERE matricule = '".$timetable9['matricule']."'";
        $q_nom10 = "SELECT * FROM enseignant WHERE matricule = '".$timetable10['matricule']."'";
        $q_nom11 = "SELECT * FROM enseignant WHERE matricule = '".$timetable11['matricule']."'";
        $q_nom12 = "SELECT * FROM enseignant WHERE matricule = '".$timetable12['matricule']."'";
        $q_nom13 = "SELECT * FROM enseignant WHERE matricule = '".$timetable13['matricule']."'";
        $q_nom14 = "SELECT * FROM enseignant WHERE matricule = '".$timetable14['matricule']."'";
        $q_nom15 = "SELECT * FROM enseignant WHERE matricule = '".$timetable15['matricule']."'";
        $q_nom16 = "SELECT * FROM enseignant WHERE matricule = '".$timetable16['matricule']."'";
        $q_nom17 = "SELECT * FROM enseignant WHERE matricule = '".$timetable17['matricule']."'";
        $q_nom18 = "SELECT * FROM enseignant WHERE matricule = '".$timetable18['matricule']."'";
        $q_nom19 = "SELECT * FROM enseignant WHERE matricule = '".$timetable19['matricule']."'";
        $q_nom20 = "SELECT * FROM enseignant WHERE matricule = '".$timetable20['matricule']."'";

        $r_nom1 = sqlsrv_query($conn,$q_nom1);
        $r_nom2 = sqlsrv_query($conn,$q_nom2);
        $r_nom3 = sqlsrv_query($conn,$q_nom3);
        $r_nom4 = sqlsrv_query($conn,$q_nom4);
        $r_nom5 = sqlsrv_query($conn,$q_nom5);
        $r_nom6 = sqlsrv_query($conn,$q_nom6);
        $r_nom7 = sqlsrv_query($conn,$q_nom7);
        $r_nom8 = sqlsrv_query($conn,$q_nom8);
        $r_nom9 = sqlsrv_query($conn,$q_nom9);
        $r_nom10 = sqlsrv_query($conn,$q_nom10);
        $r_nom11 = sqlsrv_query($conn,$q_nom11);
        $r_nom12 = sqlsrv_query($conn,$q_nom12);
        $r_nom13 = sqlsrv_query($conn,$q_nom13);
        $r_nom14 = sqlsrv_query($conn,$q_nom14);
        $r_nom15 = sqlsrv_query($conn,$q_nom15);
        $r_nom16 = sqlsrv_query($conn,$q_nom16);
        $r_nom17 = sqlsrv_query($conn,$q_nom17);
        $r_nom18 = sqlsrv_query($conn,$q_nom18);
        $r_nom19 = sqlsrv_query($conn,$q_nom19);
        $r_nom20 = sqlsrv_query($conn,$q_nom20);

        $r_nom_ens1 = sqlsrv_fetch_array($r_nom1);
        $r_nom_ens2 = sqlsrv_fetch_array($r_nom2);
        $r_nom_ens3 = sqlsrv_fetch_array($r_nom3);
        $r_nom_ens4 = sqlsrv_fetch_array($r_nom4);
        $r_nom_ens5 = sqlsrv_fetch_array($r_nom5);
        $r_nom_ens6 = sqlsrv_fetch_array($r_nom6);
        $r_nom_ens7 = sqlsrv_fetch_array($r_nom7);
        $r_nom_ens8 = sqlsrv_fetch_array($r_nom8);
        $r_nom_ens9 = sqlsrv_fetch_array($r_nom9);
        $r_nom_ens10 = sqlsrv_fetch_array($r_nom10);
        $r_nom_ens11 = sqlsrv_fetch_array($r_nom11);
        $r_nom_ens12 = sqlsrv_fetch_array($r_nom12);
        $r_nom_ens13 = sqlsrv_fetch_array($r_nom13);
        $r_nom_ens14 = sqlsrv_fetch_array($r_nom14);
        $r_nom_ens15 = sqlsrv_fetch_array($r_nom15);
        $r_nom_ens16 = sqlsrv_fetch_array($r_nom16);
        $r_nom_ens17 = sqlsrv_fetch_array($r_nom17);
        $r_nom_ens18 = sqlsrv_fetch_array($r_nom18);
        $r_nom_ens19 = sqlsrv_fetch_array($r_nom19);
        $r_nom_ens20 = sqlsrv_fetch_array($r_nom20);

    ?>
    <section id="emploiTemp">
        <div class="container">
            <div class="col-lg-12 text-center">
                    <h2 class="section-heading"> CONSULTER L'EMPLOI DU TEMPS </h2>
                    <h3 class="section-subheading text-muted">Cet mploi du temps correspond à celle de la semaine en cours. Les actualistions sont effectuées par semaine et sont du ressort de l'administration de l'école. </h3><br>
                </div>
            <table class="table table-sm">
                    <thead>
                        <tr>
                            <th scope="col"></th>
                            <th scope="col">LUNDI</th>
                            <th scope="col">MARDI</th>
                            <th scope="col">MERCREDI</th>
                            <th scope="col">JEUDI</th>
                            <th scope="col">VENDREDI</th>
                            <th scope="col">SAMEDI</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th scope="row"><input type="text" name="heure1" value="08h - 10h" readonly style="background-color:lightgray"></th>
                            <td style="font-size: 5px">
                                <legend style="font-size: 10px; text-align: center;"><?php echo $timetable1['code_matiere']."_".$r_nom_ens1['nom']."_".$r_nom_ens1['prenom']."_".$timetable1['code_salle']?></legend>    
                            </td>
                            <td>
                                <legend style="font-size: 10px; text-align: center;"><?php echo $timetable5['code_matiere']."_".$r_nom_ens5['nom']."_".$r_nom_ens5['prenom']."_".$timetable5['code_salle']?></legend>    
                            </td>
                            <td>
                                <legend style="font-size: 10px; text-align: center;"><?php echo $timetable9['code_matiere']."_".$r_nom_ens9['nom']."_".$r_nom_ens9['prenom']."_".$timetable9['code_salle']?></legend>    
                            </td>
                            <td>
                                <legend style="font-size: 10px; text-align: center;"><?php echo $timetable11['code_matiere']."_".$r_nom_ens11['nom']."_".$r_nom_ens11['prenom']."_".$timetable11['code_salle']?></legend>    
                            </td>
                            <td>
                                <legend style="font-size: 10px; text-align: center;"><?php echo $timetable15['code_matiere']."_".$r_nom_ens15['nom']."_".$r_nom_ens15['prenom']."_".$timetable15['code_salle']?></legend>    
                            </td>
                            <td>
                                <legend style="font-size: 10px; text-align: center;"><?php echo $timetable19['code_matiere']."_".$r_nom_ens19['nom']."_".$r_nom_ens19['prenom']."_".$timetable19['code_salle']?></legend>    
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><input type="text" name="heure2" value="10h15 - 12h15" readonly style="background-color:lightgray"></th>
                            <td>
                                <legend style="font-size: 10px; text-align: center;"><?php echo $timetable2['code_matiere']."_".$r_nom_ens2['nom']."_".$r_nom_ens2['prenom']."_".$timetable2['code_salle']?></legend>    
                            </td>
                            <td>
                                <legend style="font-size: 10px; text-align: center;"><?php echo $timetable6['code_matiere']."_".$r_nom_ens6['nom']."_".$r_nom_ens6['prenom']."_".$timetable6['code_salle']?></legend>    
                            </td>
                            <td>
                                <legend style="font-size: 10px; text-align: center;"><?php echo $timetable10['code_matiere']."_".$r_nom_ens10['nom']."_".$r_nom_ens10['prenom']."_".$timetable10['code_salle'];?></legend>    
                            </td>
                            <td>
                                <legend style="font-size: 10px; text-align: center;"><?php echo $timetable12['code_matiere']."_".$r_nom_ens12['nom']."_".$r_nom_ens12['prenom']."_".$timetable12['code_salle']?></legend>    
                            </td>
                            <td>
                                <legend style="font-size: 10px; text-align: center;"><?php echo $timetable16['code_matiere']."_".$r_nom_ens16['nom']."_".$r_nom_ens16['prenom']."_".$timetable16['code_salle']?></legend>    
                            </td>
                            <td>
                                <legend style="font-size: 10px; text-align: center;"><?php echo $timetable20['code_matiere']."_".$r_nom_ens20['nom']."_".$r_nom_ens20['prenom']."_".$timetable20['code_salle']?></legend>    
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><input type="text" name="heure3" value="14h30 - 16h30" readonly style="background-color:lightgray"></th>
                            <td>
                                <legend style="font-size: 10px; text-align: center;"><?php echo $timetable3['code_matiere']."_".$r_nom_ens3['nom']."_".$r_nom_ens3['prenom']."_".$timetable3['code_salle']?></legend>    
                            </td>
                            <td>
                                <legend style="font-size: 10px; text-align: center;"><?php echo $timetable7['code_matiere']."_".$r_nom_ens7['nom']."_".$r_nom_ens7['prenom']."_".$timetable7['code_salle']?></legend>    
                            </td>
                            <td></td>
                            <td>
                                <legend style="font-size: 10px; text-align: center;"><?php echo $timetable13['code_matiere']."_".$r_nom_ens13['nom']."_".$r_nom_ens13['prenom']."_".$timetable13['code_salle']?></legend>    
                            </td>
                            <td>
                                <legend style="font-size: 10px; text-align: center;" ><?php echo $timetable17['code_matiere']."_".$r_nom_ens17['nom']."_".$r_nom_ens17['prenom']."_".$timetable17['code_salle']?></legend>    
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <th scope="row"><input type="text" name="heure4" value="16h30 - 18h30" readonly style="background-color:lightgray"></th>
                            <td>
                                <legend style="font-size: 10px; text-align: center;"><?php echo $timetable4['code_matiere']."_".$r_nom_ens4['nom']."_".$r_nom_ens4['prenom']."_".$timetable4['code_salle']?></legend>    
                            </td>
                            <td>
                                <legend style="font-size: 10px; text-align: center;"><?php echo $timetable8['code_matiere']."_".$r_nom_ens8['nom']."_".$r_nom_ens8['prenom']."_".$timetable8['code_salle']?></legend>    
                            </td>
                            <td></td>
                            <td>
                                <legend style="font-size: 10px; text-align: center;"><?php echo $timetable14['code_matiere']."_".$r_nom_ens14['nom']."_".$r_nom_ens14['prenom']."_".$timetable14['code_salle']?></legend>    
                            </td>
                            <td>
                                <legend style="font-size: 10px; text-align: center;"><?php echo $timetable18['code_matiere']."_".$r_nom_ens18['nom']."_".$r_nom_ens18['prenom']."_".$timetable18['code_salle']?></legend>    
                            </td>
                            <td></td>
                        </tr>
                    </tbody>
                              
                </table>
        </div>    
    </section>

    <!-- CARNET DE NOTE -->
    <?php    //Afficahages des notes de l'étudiant suivant les matières disponibles
        $q_note = "SELECT * FROM carnetNote where matricule_etudiant = '".$_SESSION['matriculeEtudiant']."'";
        $r_note = sqlsrv_query($conn, $q_note);
    ?>
    <section id="note">
        <div class="container">
            <div class="col-lg-12 text-center">
                    <h2 class="section-heading"> CONSULTER VOS NOTES DU TEMPS </h2>
                    <h3 class="section-subheading text-muted">Cet interface vous permet d'avoir vos notes en temps réels, en effet, après que l'enseignant ait soumis vos notes aux responsables de filières, vous avez la possibilité de les consulter. </h3><br>
            </div>
            <table class="table ">
                <thead>
                    <tr>
                        <th scope="col">NOM MATIERE</th>
                        <th scope="col">NOTE</th>
                        <th scope="col">PERIODE</th>
                        <th scope="col">STATUT NOTE</th>
                    </tr>
                    </thead>
                        <?php
                            while($result_note =  sqlsrv_fetch_array($r_note)){

                                echo"<tr>
                                        <td>".utf8_encode($result_note["code_matiere"])."</td>
                                        <td>".utf8_encode($result_note["note"])."</td>
                                        <td>". utf8_encode($result_note["idperiode"])."</td>
                                        <td>". utf8_encode($result_note["idstatut_note"])."</td>

                                    </tr>";  
                            }
                        ?>

        </div>
    </section>

    <!-- Section cérémonie -->
    <section>
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
                            <!-- <img class="img-responsive" src="../fichierImage/Image/image1.jpg" alt=""> -->
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
                            <!-- <img class="img-responsive img-centered" src="../fichierImage/Image/image2.jpg" alt=""> -->
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
                            <!-- <img class="img-responsive img-centered" src="../fichierImage/Image/image3.jpg" alt=""> -->
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

    <!-- Thème personnalisé JavaScript -->
    <script src="../fichierJavaScript/accueil.js"></script>

</body>
</html>