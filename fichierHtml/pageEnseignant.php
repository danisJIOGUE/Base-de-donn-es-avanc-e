<?php 

    // Installation des librairiess nécessaire pour l'importation des notes au format Excel
    use PhpOffice\PhpSpreadsheet\IOFactory;
    use PhpOffice\PhpSpreadsheet\Helper\Sample;
    require_once  '../fichierCSS/phpSpreadSheet/src/Bootstrap.php'; 
    $helper = new Sample();

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
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Informations personnelles<b class="caret"> </b></a>
                        <ul class="dropdown-menu">
                            <li><a href="#informations" id="styledropdown">Consulter mes informations</a></li>
                            <li><a href="#statistique" id="styledropdown">Mes Statistiques</a></li>
                        </ul>
                    </li>

                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Aspects pédagogiques<b class="caret"> </b></a>
                        <ul class="dropdown-menu">
                            <li><a href="#note" id="styledropdown">Gestion des notes</a></li>
                            <li><a href="#emploiTemp" id="styledropdown">Consulter mon emploi du temps</a></li>
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
            $q_information = "SELECT * FROM enseignant WHERE matricule = '".$_SESSION['matriculeEnseignant']."'";
            $result = sqlsrv_query($conn,$q_information);
            $result_info = sqlsrv_fetch_array($result);
            
            if (empty($result_info['date_connexion']) || $result_info['pwd'] == '1234567') {
                ?>
                    <script type="text/javascript">
                        alert("Merci de bienvouloir vous rendre dans la section Informations personnelles pour mettre à jour vos informations. En l'occurence votre mot de passe. \nLe cas écheant, vos prochaines connexion ne seront pas valides.");
                    </script>    
                <?php
            }
        ?>

    <!-- Information sur le responsable -->
    <section id="informations">
        <div class="container">
          
            <div class="col-lg-12 text-center">
                    <h2 class="section-heading">Vos informations personnelles</h2>
                    <h3 class="section-subheading text-muted">Vous avez la possibilité de mettre à jour et consulter vos informations personnelles. </h3>
            </div>
          <form method="POST" action="">
              
              <div class="form-row">
                <div class="form-group col-md-6">
                  <?php
                      echo "<img src='../fichierImage/photoEleve/".$result_info['photo']."' style='width:200px;height:150px; padding-left:50px'>";
                  ?>
                </div>
                <div class="form-group col-md-6">
                  <label for="matricule">Matricule</label>
                  <input type="text" class="form-control" name="matricule" readonly="true" id="matricule" value="<?=$result_info['matricule']?>">
                </div>

                <div class="form-group col-md-6">
                  <label for="statut">Votre Statut</label>
                  <input type="text" class="form-control" name="statut" readonly="true" id="statut" value="<?=$result_info['statut']?>">
                </div>

                <div class="form-group col-md-6">
                  <label for="connexion">Date & heure de dernière connexion</label>
                  <input type="text" class="form-control" id="statut_classe" readonly="true" name="date_connexion" value="<?=$result_info['date_connexion']?>">
                </div>

                <div class="form-group col-md-6">
                  <label for="connexion">Date & heure de dernière modification par l'administration</label>
                  <input type="text" class="form-control" id="date_suppression" readonly="true" name="date_suppression" value="<?=$result_info['date_connexion']?>">
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
                  <acronym title="Modifier le mot de passe normal"><label for="pwd">Votre mot de passe</label></acronym>
                  <input type="text" class="form-control" name="pwd" id="pwd" value="<?=$result_info['pwd']?>">
                </div>

                <div class="form-group col-md-6">
                  <acronym title="téléphone"><label for="pwd">Numero de téléphone</label></acronym>
                  <input type="text" class="form-control" name="telephone" id="telephone" value="<?=$result_info['telephone']?>">
                </div>

                <div class="form-group col-md-6">
                  <label for="mail">Adresse email</label>
                  <input type="email" class="form-control" id="mail" name="mail" value="<?=$result_info['adresse_mail']?>">
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
                  $q_con = "UPDATE  connexion SET pwd = '".$pwd_etd."', date_connexion = '".date('Y-m-d H:i:s')."' WHERE matricule = '".$_SESSION['matriculeEnseignant']."'";
                  $q_conn = sqlsrv_query($conn, $q_con);


                  //Sauvegarde des infos de l'étudiant
                  $q_sau = "UPDATE enseignant SET nom ='".$_POST['nom']."', prenom ='".$_POST['prenom']."', statut ='".$_POST['statut']."', adresse_mail = '".$_POST['mail']."', telephone = '".$_POST['telephone']."', date_connexion = '".date('Y-m-d H:i:s')."',  date_suppression = '".$_POST['date_suppression']."', pwd = '".$pwd_etd."' WHERE matricule = '".$_SESSION['matriculeEnseignant']."'";
                  $r_sauv = sqlsrv_query($conn, $q_sau);
                        if ($q_conn) {
                          if($r_sauv){
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
                        else{
                            ?>
                                 <script type="text/javascript">
                                     alert("Une erreur est survenue lors la mise à jour de vos informations. \n Merci de ressayer l'opération.");
                                 </script>
                            <?php
                        }
                }
            ?>

          
        </div>
    </section>

    <!-- </Gestion des étudiants> -->
    <section id="statistique">
        <div class="container">
            <?php
            // Recuperation des informations de l'étudiant dans les tbles absences & retards
                $q_nb_rtd = "SELECT nombre_minute FROM retard WHERE matricule = '".$_SESSION['matriculeEnseignant']."'";;
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

                $q_nb_abs = "SELECT nombre_heure FROM absence WHERE matricule = '".$_SESSION['matriculeEnseignant']."'";;
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
            <strong><h3>Statisques sur les matières enseignées</h3></strong>
            <div class="col-xs-2 col-sm-2 col-md-3 col-sm-offset-4 col-md-offset-4" style="float: left;">
                <form role="form" method="POST" id="form_modif">
                        <div class="panel panel-default" id="boite" >
                            <div class="panel-body"  id="boite_body">
                                <div class="row">
                                    <div class="col-xs-10 col-sm-10 col-md-12">
                                        <div class="form-group">
                                        <acronym title="La liste jointe correspond uniquement à vos matières au sein de l'ENSAE">
                                            <select required="true" required="required" name="classe" id="classe"></acronym> 
                                                <option>-----Choisissez une classe-----</option>
                                                    <?php
                                                    //parcourir le resultat de la requete pour créer les elements du SELECT
                                                        $query_classe = "SELECT classe from classe_has_enseignant_has_matiere where matricule =  '".$_SESSION['matriculeEnseignant']."'";
                                                        $r_class_lib = sqlsrv_query($conn, $query_classe);
                                                        while ($ligneC = sqlsrv_fetch_array($r_class_lib)) 
                                                            {
                                                                echo"<option>".utf8_encode($ligneC["classe"])."</option>";
                                                            }
                                                        
                                                    ?>
                                            </select>
                                        </div>
                                    </div>
                                <input type="submit" name = "valClasse" value="VALIDER" class="btn btn-info btn-block">
                            </div>
                        </div>
                    </div>
                </form>
            </div>

            <?php
                if (isset($_POST['valClasse'])) {

                    echo 
                    '
                        <div class="col-xs-2 col-sm-2 col-md-4 col-sm-offset-4 col-md-offset-4" style="float: left;">
                            <form role="form" method="POST" id="form_modif">
                                    <div class="panel panel-default" id="boite" >
                                        <div class="panel-body"  id="boite_body">
                                            <div class="row">
                                                <div class="col-xs-10 col-sm-10 col-md-12">
                                                    <div class="form-group"> 
                                                        <select required="true" required="required" name="nom_mat" id="nom_mat">
                                                            <option>-----Choisissez une de vos matières-----</option>
                                                                ';
                                                                    $query_lib_mat = "SELECT code_matiere from classe_has_enseignant_has_matiere where classe =  '".$_POST['classe']."'";
                                                                    $r_mat_lib = sqlsrv_query($conn, $query_lib_mat);
                                                                    while ($ligneM = sqlsrv_fetch_array($r_mat_lib)) 
                                                                        {
                                                                            echo"<option>".utf8_encode($ligneM["code_matiere"])."</option>";
                                                                        }
                                                        echo '</select>
                                                    </div>
                                                </div>
                                            <input type="submit" name = "valMatiere" value="ENREGISTRER" class="btn btn-info btn-block">
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    ';
                }
            ?>

            <?php
                // Affichage du nombre d'heures effectués suivant la matière
                if (isset($_POST['valMatiere'])) {
                    $mat = $_POST['nom_mat'];
                    $q_nb_mat = "SELECT heure_eff FROM matiere WHERE code_matiere = '".$_POST['nom_mat']."'";;
                    $params = array();
                    $options =  array( "Scrollable" => SQLSRV_CURSOR_KEYSET );
                    $r_nb_mat = sqlsrv_query( $conn, $q_nb_mat , $params, $options );

                    $row_count = sqlsrv_num_rows( $r_nb_mat );

                    $data_mat = []; // Tableau pour stocker les matricules existants
                    for($i = 0; $i < $row_count; $i++){
                            $data_mat[] = sqlsrv_fetch_array( $r_nb_mat, SQLSRV_FETCH_ASSOC);
                        }
                    $result_mat = 0;
                    foreach ($data_mat as $key => $value) {   
                        $result_mat = $result_mat  + implode($value);
                    }
                    echo 
                    '
                        <div class="row">
                            <div class="col-lg-12 text-center"> 
                                <h3 class="section-subheading text-muted">Voici le bilan de vos heures effectuer pour "'.$mat.'".</h3>
                            </div>
                        </div>
                        <div class="row">
                            <table class="table table-striped table-dark">
                              <thead>
                                <tr>
                                  <strong><h5>Statisques sur nombre heure effectué par matière et par classe</h5></strong>
                                  <!-- <th scope="col">First</th>
                                  <th scope="col">Last</th>
                                  <th scope="col">Handle</th> -->
                                </tr>
                              </thead>
                              <tbody>
                                <tr>
                                  <th scope="row">Nombre total heure effecuées</th>
                                  <td>'.$result_mat.'</td> 
                                </tr>
                              </tbody>
                            </table>
                        </div>

                    ';
                }
            ?>
        </div>
    </section>

    <!-- </Gestion des Enseignants> -->
    <section id="note">
        <div class="container">
            
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading"> IMPORTATION DES NOTES </h2>
                    <h3 class="section-subheading text-muted">Cette option vous donne la possibilité d'envoyer les notes des étudiants directment aux responsables des filières. Pour ce faire, vous devez renseigner les informations préables suivantes à savoir une des classe dans lquelle vous intervener à l'ENSAE. <strong><h6>Le fichier d'importation doit se situer dans l'emplacement : "..\fichierExcel"</h6></strong></h3><br>
                </div>
            </div>
            <!-- Choix de la classe -->
            <div class="col-xs-2 col-sm-2 col-md-3 col-sm-offset-4 col-md-offset-4" style="float: left;">
                <form role="form" method="POST" enctype="multipart/form-data">
                        <div class="panel panel-default" id="boite" >
                            <div class="panel-body"  id="boite_body">
                                <div class="row">
                                    <div class="col-xs-10 col-sm-10 col-md-12">
                                        <div class="form-group"> 
                                            <select required="true" required name="classeN" id="classe">
                                                <option>---Choisissez une classe---</option>
                                                    <?php
                                                    //parcourir le resultat de la requete pour créer les elements du SELECT
                                                        $query_classe = "SELECT classe from classe_has_enseignant_has_matiere where matricule =  '".$_SESSION['matriculeEnseignant']."'";
                                                        $r_class_lib = sqlsrv_query($conn, $query_classe);
                                                        while ($ligneC = sqlsrv_fetch_array($r_class_lib)) 
                                                            {
                                                                echo"<option>".utf8_encode($ligneC["classe"])."</option>";
                                                            }
                                                    ?>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <input type="submit" name = "choixClasse" value="VALIDER" class="btn btn-info btn-block">
                            </div>
                        </div>
                    </form>
                </div>    
            <?php
                if (isset($_POST['choixClasse'])) {
                    if (!($_POST['classeN'] == "---Choisissez une classe---")) {
                        $classeNote = $_POST['classeN'];
                        $_SESSION['classe'] = $_POST['classeN'];
                    echo '
                        <div class="col-xs-2 col-sm-2 col-md-3 col-sm-offset-4 col-md-offset-4" style="float: left;">
                            <form role="form" method="POST" enctype="multipart/form-data">
                                    <div class="panel panel-default" id="boite" >
                                        <div class="panel-body"  id="boite_body">
                                            <div class="row">
                                                <div class="col-xs-10 col-sm-10 col-md-12" style="text-align: center;">
                                                    <div class="form-group"> 
                                                        <select required="true" required name="idPeriode">
                                                            <option>---Choisissez la période---</option>';
                                                                //parcourir le resultat de la requete pour créer les elements du SELECT
                                                                    $query_periode = "SELECT idperiode from periode";
                                                                    $r_periode = sqlsrv_query($conn, $query_periode);
                                                                    while ($ligneP = sqlsrv_fetch_array($r_periode)) 
                                                                        {
                                                                            echo"<option>".utf8_encode($ligneP["idperiode"])."</option>";
                                                                        }
                                                                echo '
                                                        </select>
                                                    </div>
                                                </div>
                                                <div style="text-align: center;" class="col-xs-10 col-sm-10 col-md-12">
                                                    <div class="form-group"> 
                                                        <select required="true" required name="idStatut_note">
                                                            <option>---Choisissez le statut---</option>';
                                                                //parcourir le resultat de la requete pour créer les elements du SELECT
                                                                    $query_statut = "SELECT idstatut_note from statut_note ";
                                                                    $r_statut = sqlsrv_query($conn, $query_statut);
                                                                    while ($ligneS = sqlsrv_fetch_array($r_statut)) 
                                                                        {
                                                                            echo"<option>".utf8_encode($ligneS["idstatut_note"])."</option>";
                                                                        }
                                                                echo '
                                                        </select>
                                                    </div>
                                                </div>
                                                <div style="text-align: center;" class="col-xs-10 col-sm-10 col-md-12">
                                                    <div class="form-group"> 
                                                        <select required="true" required name="codeMatiere">
                                                            <option>---Choisissez la matière---</option>';
                                                                //parcourir le resultat de la requete pour créer les elements du SELECT
                                                                    $query_matiere = "SELECT code_matiere from classe_has_enseignant_has_matiere where matricule =  '".$_SESSION['matriculeEnseignant']."' AND classe = '".$classeNote."'";
                                                                    $r_matiere = sqlsrv_query($conn, $query_matiere);
                                                                    while ($ligneM = sqlsrv_fetch_array($r_matiere)) 
                                                                        {
                                                                            echo"<option>".utf8_encode($ligneM["code_matiere"])."</option>";
                                                                        }
                                                                echo '
                                                        </select>
                                                    </div>
                                                </div>
                                                <div style="text-align: center;" class="col-xs-10 col-sm-10 col-md-12">
                                                    <div class="form-group"> 
                                                        <input style="text-align: center;" type="file" name="fichierNote" required  placeholder="Choisir le fichier Excel" >
                                                    </div>
                                                </div>
                                                
                                            <input type="submit" style="text-align: center;" name = "importExcel" value="VALIDER IMPORTATION" class="btn btn-info btn-block">
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    ';
                    }
                    else{
                        ?>
                            <script type="text/javascript">
                                alert("Bienvouloir choisir une classe");
                            </script>
                        <?php
                        die();
                    }
                    
                }
            ?>
            
            
            <?php

                if (isset($_POST['importExcel'])) {
                    if (!($_POST['idPeriode'] == "---Choisissez la période---") && !($_POST['idStatut_note'] == "---Choisissez le statut---" ) && !($_POST['codeMatiere'] == "---Choisissez la matière---")) {
                        $idPeriode = $_POST['idPeriode'];
                        $idStatut_note = $_POST['idStatut_note'];
                        $codeMatiere = $_POST['codeMatiere'];

                        
                        $file = $_FILES['fichierNote'];

                            $inputFileType = 'Xlsx';

                            $inputFileName = '../fichierExcel/'.$_FILES['fichierNote']['name'];

                            if (file_exists($inputFileName)) {
                                $reader = IOFactory::createReader($inputFileType);

                                $reader->setReadDataOnly(true);
                                $spreadsheet = $reader->load($inputFileName);
                                $sheetData = $spreadsheet->getActiveSheet()->toArray(null, true, true, true);
                                $result_ipmport = 0;
                                    //iNSERT new row with place data
                                    $sql = '';
                                    for ($row=2; $row < count($sheetData); $row++) { 
                                        $xx = implode(",", $sheetData[$row]);
                                        $sql = "INSERT INTO carnetNote (matricule_etudiant, note, idperiode, idstatut_note, classe, matricule, code_matiere) values ($xx, '".$idPeriode."', '".$idStatut_note."', '".$_SESSION['classe']."', ".$_SESSION['matriculeEnseignant'].", '".$codeMatiere."');";
                                        $r_sql = sqlsrv_query($conn, $sql);
                                        if($r_sql){
                                            $result_ipmport = 1;
                                        }else{
                                            $result_ipmport = 2  ;
                                        }
                                    }
                                    if ($result_ipmport == 1) {
                                        ?>
                                            <script type="text/javascript">
                                                alert("Les notes ont été importé avec succès.");
                                            </script>
                                        <?php
                                    }
                                    else{
                                        ?>
                                            <script type="text/javascript">
                                                alert("Une erreur s'est produite lors de l'importation des notes.\n Merci de repprendre l'opération");
                                            </script>
                                        <?php
                                    }
                            }
                            else{
                                echo $inputFileName;
                                ?>
                                    <script type="text/javascript">
                                        alert("Le fichier choisi ne se trouve pas dans l'emplacement indiqué.\n Merci de le placer à l'emplacement : '../fichierExcel/'");
                                    </script>
                                <?php
                                die();
                            }   
                        
                    }
                    else{
                        ?>
                            <script type="text/javascript">
                                alert("Merci de remplir l'ensembles des champs indiqués.");
                            </script>
                        <?php
                        die();
                    }
                }
                   
            ?>
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
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading"> CONSULTER L'EMPLOI DU TEMPS </h2>
                    <h3 class="section-subheading text-muted">Cet mploi du temps correspond à celle de la semaine en cours. Les actualistions sont effectuées par semaine et sont du ressort de l'administration de l'école. </h3><br>
                </div>
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