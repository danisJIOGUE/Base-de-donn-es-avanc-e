
<!DOCTYPE html>
<html>
<head>
    <title></title>
</head>
<body>


    <div class="container" style="background-color: lightblue">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading">GESTION DES ENSEIGNANTS DE L'ENSAE</h2>
                    <!--h3 class="section-subheading text-muted">La seule limite </h3-->
                </div>
            </div>
            <div class=" jumbotron text-center"style="background-color: lightyellow">
                <h3>FORMULAIRE D'AJOUT D'UN ENSEIGNANT' </h3>          
                <button type='Boutton' class="btn btn-success" data-toggle="modal" data-target="#loginModal_E">Entrer les informations de l'enseignant</button>
            </div>
            <div class="modal fade" role="dialog" id="loginModal_E">
                <div class="modal-dialog">
                    <form role="form" method="POST" enctype="multipart/form-data" action="AjoutEnseignant_Admin.php">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h3 class="modal-title">FORMULAIRE D'AJOUT</h3>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>

                            <div class="modal-body">
                                <div class="form-group">
                                    <input type="text" name="nom" required="required" id="nom" placeholder="Entrer le nom">
                                    <span id="nom_manquant"></span>
                                </div>
                                <div class="form-group">
                                    <input type="text" name="prenom" required="required" id="prenom" placeholder="Entrer le prénom" >
                                    <span id="prenom_manquant"></span>
                                </div>
                                <div class="form-group"> 
                                    <select required="true" required="required" name="statut" id="statut">
                                        <option>-----Choisissez Le statut-----</option>
                                        <option>Vacataire</option>
                                        <option>Permanant</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <input type="text" name="matricule" required="required" id="matricule" placeholder="Entrer le matricule" >
                                    
                                </div>
                                
                                <div class="form-group">
                                    <input type="file" name="photo" required="required" id="photo" placeholder="Choisir la photo" >
                                </div>
                            </div>

                            <div class="modal-footer">
                                <input type="submit" name="Submit" id="valideAjout" value="Ajouter" class="btn btn-success" data-toggle="modal" data-target="#login2" onclick="envoyer()">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            
            <!-- Importation des enseignants -->
            <div style="border: white 10px"> 
                <form action="" method="POST" enctype="multipart/form-data">
                    <table>
                        <tr>
                            <td>
                                <acronym title="Importer la liste des enseignants au fichier csv"><input style="text-align: center;" type="file" name="lst_enseign" required  placeholder="Choisir le fichier Excel" ></acronym>
                            </td>
                            <td>
                                <input type="submit" name="import_enseign" style="border: solid 2px; border-radius: 5px; background-color: gray" value="IMPORTER">
                            </td>
                        </tr>
                    </table>
                </form>
            
                <?php
                // Script d'importation
                    if (isset($_POST['import_enseign'])) {
                        if (isset($_FILES['lst_enseign']['name'])) {
                            $filename = explode(".",$_FILES['lst_enseign']['name']);
                            if ($filename[1] == "csv") {
                                $handle = fopen($_FILES['lst_enseign']['tmp_name'], "r");
                                $i = 0;  //Pour contrôler l'importation de la première ligne du tableau
                                $err_ens = 0;
                                while($data = fgetcsv($handle)){

                                    if ($i > 0) {
                                        $data_imp = explode(";", $data[0]);
                                        echo "<br>";
                                        $query_add="INSERT INTO  enseignant (matricule, nom, prenom , statut)
                                                VALUES ('".$data_imp[0]."','".$data_imp[1]."','".$data_imp[2]."','".$data_imp[3]."')"; 
                                        $r_add_ens = sqlsrv_query($conn, $query_add);
                                        if ($r_add_ens) {
                                            $r_ens = 1;
                                        }
                                        else{
                                            $r_ens = 2;
                                        }
                                    }
                                    $i++;
                                }
                                if ($err_ens == 1) {
                                    ?>
                                        <script type="text/javascript">
                                             alert("Importation effectué avec succès de la liste des enseignants.");
                                        </script>
                                     <?php
                                }
                                else if($err_ens == 2){
                                    ?>
                                        <script type="text/javascript">
                                            alert("Un problème est survenu lors de l'Importation de la liste des enseignants.");
                                        </script>
                                    <?php
                                }

                            }
                            else
                                {
                                    ?>
                                        <script type="text/javascript">
                                            alert("Merci de bienvouloir choisir un fichier au format '.csv'.");
                                        </script>
                                    <?php
                                }
                        }
                        else{
                            ?>
                                        <script type="text/javascript">
                                            alert("Aucun fichier n'est selectionné.");
                                        </script>
                                    <?php
                        }
                    }
                ?>
            </div>
            <form action="" method="POST" enctype="multipart/form-data" id="formulaire_e" style="padding-top: 10px">
                <table>
                    <tr>
                        <td><acronym title="Rechercher suivant le nom ou le prénom des enseignants." style="background-color: green">Rechercher  :   </acronym></td>
                        <td><input type="text" name="mot_cle_enseig" id="mot_cle_enseig" > </td>
                        <td><input type="submit" name="chercher" value="chercher"></td>
                    </tr>
                </table>
                <br>          
                    <table class="table table-dark">
                      <thead>
                        <tr>
                          <th scope="col">NOM</th>
                          <th scope="col">PRENOM</th>
                          <th scope="col">MATRICULE</th>
                          <th scope="col">STATUT</th>
                          <th scope="col">PHOTO</th>
                          <th colspan='3'></th>
                        </tr>
                      </thead>
                    <?php
                        if(isset($_POST['mot_cle_enseig'])){ //Requête de recherche des etudiants suivant leur nom
                            $q_cherche = "SELECT count(*) from enseignant where est_supprime = 'NON' AND nom like '%".$_POST['mot_cle_enseig']."%'"; 
                            $q_cher = "SELECT TOP (5) * from enseignant where est_supprime = 'NON' AND nom like '%".$_POST['mot_cle_enseig']."%'";
                            $res_c = sqlsrv_query($conn, $q_cher);
                            $res = sqlsrv_query($conn,$q_cherche);
                            $res_cher = sqlsrv_fetch_array($res);
                            $r_ens = implode($res_cher);
                            if($r_ens == "00"){// si la Requête de recherche des etudiants suivant leur nom on recherche svt le prenom
                                $q_cherche = "SELECT count(*) from enseignant where est_supprime = 'NON' AND CONCAT(nom,prenom) like '%".$_POST['mot_cle_enseig']."%'";
                                $q_cher = "SELECT TOP (5) * from enseignant where est_supprime = 'NON' AND CONCAT(nom,prenom) like '%".$_POST['mot_cle_enseig']."%'";
                                $res_c = sqlsrv_query($conn, $q_cher); 
                                $res = sqlsrv_query($conn, $q_cherche);
                                $res_cher = sqlsrv_fetch_array($res);
                                $r_ens = implode($res_cher);
                            } 

                            if(!($r_ens == "00")) { //Affichage des resultats de la recherche
                                while($etud = sqlsrv_fetch_array($res_c)){
                                    echo"<tr>
                                        <td>".utf8_encode($etud["nom"])."</td>
                                        <td>".$etud["prenom"]."</td>
                                        <td>". utf8_encode($etud["matricule"])."</td>
                                        <td>". utf8_encode($etud["statut"])."</td>
                                        <td><img src='../fichierImage/photoEleve/".$etud['photo']."' style='width:40px;height:40px;'></td>
                                        <td><a href='?codeM_e=".$etud["matricule"]."&action_en=M'>Modifier</a></td>
                                        <td><a href='?codeM_e=".$etud["matricule"]."&action_en=SL' onclick=\"return confirm('Etes-vous certain de vouloir effectuer une suppression logique ?');\">Suppression logique</a></td>
                                        <td><a href='?codeM_e=".$etud["matricule"]."&action_en=SP' onclick=\"return confirm('Etes-vous certain de vouloir effectuer une suppression physique ?');\">Suppression physique</a></td>
                                      </tr>"; 
                                      ?>
                                        <script>
                                            document.getElementById("mot_cle_enseig").focus();
                                        </script>
                                    <?php   
                                }
                            }
                            else{ // Aucun resultat ne correspond à la recherche affichage par defaut
                                ?>
                                    <script>
                                        alert("Aucun resultat ne correspond à votre recherche.\n Merci de re-essayer!!!");
                                        document.getElementById("mot_cle_enseig").focus();

                                    </script>
                                <?php
                                $qs = "SELECT   TOP (5) * FROM enseignant where est_supprime = 'NON' ORDER BY nom ASC ";
                                $sel = sqlsrv_query($conn, $qs);
                            while($etudiant = sqlsrv_fetch_array($sel)){
                                echo"<tr>
                                    <td>".utf8_encode($etudiant["nom"])."</td>
                                    <td>".$etudiant["prenom"]."</td>
                                    <td>". utf8_encode($etudiant["matricule"])."</td>
                                    <td>". utf8_encode($etudiant["statut"])."</td>
                                    <td><img src='../fichierImage/photoEleve/".$etudiant['photo']."' style='width:40px;height:40px;''></td>
                                    <td><a href='?codeM_e=".$etudiant["matricule"]."&action_en=M'>Modifier</a></td>
                                    <td><a href='?codeM_e=".$etudiant["matricule"]."&action_en=SL' onclick=\"return confirm('Etes-vous certain de vouloir effectuer une suppression logique ?');\">Suppression logique</a></td>
                                    <td><a href='?codeM_e=".$etudiant["matricule"]."&action_en=SP' onclick=\"return confirm('Etes-vous certain de vouloir effectuer une suppression physique ?');\">Suppression physique</a>
                                            </td>
                                  </tr>";   
                                }   
                            }                           
                            
                        }
                        else if(isset($_POST['afficheSupprime_ens'])){// Vérification pour l'affichage des etudiants supprimés logiquement
                            $q_affichesupprime = "SELECT count(*) FROM enseignant where est_supprime = 'OUI'";
                                $sup = sqlsrv_query($conn, $q_affichesupprime);
                                $count = sqlsrv_fetch_array($sup);
                                $sup_count = implode($count);
                            if (!($sup_count == "00")) {
                                $q_s = "SELECT TOP (5) * FROM enseignant where est_supprime = 'OUI' ORDER BY nom ASC ";
                                $sel_sup = sqlsrv_query($conn, $q_s);
                                while($etudiant_s = sqlsrv_fetch_array($sel_sup)){
                                    echo"<tr>
                                        <td>".utf8_encode($etudiant_s["nom"])."</td>
                                        <td>".$etudiant_s["prenom"]."</td>
                                        <td>". utf8_encode($etudiant_s["matricule"])."</td>
                                        <td>". utf8_encode($etudiant_s["statut"])."</td>
                                        <td><img src='../fichierImage/photoEleve/".$etudiant_s['photo']."' style='width:40px;height:40px;''></td>
                                        <td><a href='?codeM_e=".$etudiant_s["matricule"]."&action_en=M'>Modifier</a></td>
                                        <td><a href='?codeM_e=".$etudiant_s["matricule"]."&action_en=SL' onclick=\"return confirm('Etes-vous certain de vouloir effectuer une suppression logique ?');\">Suppression logique</a></td>
                                        <td><a href='?codeM_e=".$etudiant_s["matricule"]."&action_en=SP' onclick=\"return confirm('Etes-vous certain de vouloir effectuer une suppression physique ?');\">Suppression physique</a></td>
                                      </tr>"; 
                                      ?>
                                    <script>
                                        document.getElementById("mot_cle_enseig").focus();
                                    </script>
                                    <?php  
                                }
                            }
                            else{ // Aucun étudiant supprimé de façon logique
                                ?>
                                    <script>
                                        alert("Aucun Enseignant n'a été supprimé de façon logique!!");
                                        document.getElementById("mot_cle_enseig").focus();

                                    </script>
                                <?php
                                $qs = "SELECT TOP (5) * FROM enseignant where est_supprime = 'NON' ORDER BY nom ASC ";
                                $sel = sqlsrv_query($conn, $qs);
                            while($etudiant = sqlsrv_fetch_array($sel)){
                                echo"<tr>
                                    <td>".utf8_encode($etudiant["nom"])."</td>
                                    <td>".$etudiant["prenom"]."</td>
                                    <td>". utf8_encode($etudiant["matricule"])."</td>
                                    <td>". utf8_encode($etudiant["statut"])."</td>
                                    <td><img src='../fichierImage/photoEleve/".$etudiant['photo']."' style='width:40px;height:40px;''></td>
                                    <td><a href='?codeM_e=".$etudiant["matricule"]."&action_en=M'>Modifier</a></td>
                                    <td><a href='?codeM_e=".$etudiant["matricule"]."&action_en=SL' onclick=\"return confirm('Etes-vous certain de vouloir effectuer une suppression logique ?');\">Suppression logique</a></td>
                                    <td><a href='?codeM_e=".$etudiant["matricule"]."&action_en=SP' onclick=\"return confirm('Etes-vous certain de vouloir effectuer une suppression physique ?');\">Suppression physique</a></td>
                                  </tr>";   
                                }
                            }     
                        }
                        else{ // Affichages des étudiants
                            $qs = "SELECT TOP (5) * FROM enseignant where est_supprime = 'NON' ORDER BY nom ASC ";
                            $sel = sqlsrv_query($conn, $qs);
                            while($etudiant = sqlsrv_fetch_array($sel)){
                                echo"<tr>
                                    <td>".utf8_encode($etudiant["nom"])."</td>
                                    <td>".$etudiant["prenom"]."</td>
                                    <td>". utf8_encode($etudiant["matricule"])."</td>
                                    <td>". utf8_encode($etudiant["statut"])."</td>
                                    <td><img src='../fichierImage/photoEleve/".$etudiant['photo']."' style='width:40px;height:40px;''></td>
                                    <td><a href='?codeM_e=".$etudiant["matricule"]."&action_en=M'>Modifier</a></td>
                                    <td><a href='?codeM_e=".$etudiant["matricule"]."&action_en=SL' onclick=\"return confirm('Etes-vous certain de vouloir effectuer une suppression logique ?');\">Suppression logique</a></td>
                                    <td><a href='?codeM_e=".$etudiant["matricule"]."&action_en=SP' onclick=\"return confirm('Etes-vous certain de vouloir effectuer une suppression physique ?');\">Suppression physique</a></td>
                                  </tr>";   
                            }   
                        }

                        
                    ?>        
                </table>
            </form>
            <br>

            <form method="POST" action="">
                <table>
                    <tr>
                        <td><acronym title="afficher les enseignants qui ont été supprimé de façon logique"><input type="submit" name="afficheSupprime_ens" value="AFFICHER" style="border-radius: 5px; border: solid; background-color: green"></acronym></td>
                    </tr>
                </table>
            </form>
        <?php 

        if (isset($_GET["codeM_e"]) && isset( $_GET["action_en"] )) {
                    if ($_GET["action_en"] == "SL") //Suppression Logique
                    {
                        // var_dump($_SESSION);
                        // var_dump($_GET);
                                //=========DEBUT SUPPRESSION LOGIQUE
                        $querySup_e = "UPDATE enseignant SET id_user='".$_SESSION['matriculeResponsable']."',date_suppression='".date('Y-m-d H:i:s')."',est_supprime='OUI' WHERE matricule='".$_GET['codeM_e']."'"; //suppression logique
                        
                        $result_sup = sqlsrv_query($conn,$querySup_e);
                        // var_dump($querySup_e);
                        // var_dump($result_sup);
                        if ($result_sup) 
                        {
                            ?>
                                <script > alert('enseignant bien supprimé.\nMerci de re-actualiser la page.');
                                </script>
                            <?php
                        }
                        else{
                            ?>
                                <script > alert("Une erreur s'est produite lors de la supresion.\nMerci de re-essayer.");
                                </script>
                            <?php
                        }

                        
                        //=========FIN SUPPRESSION
                    }
                    else if($_GET['action_en'] == "SP"){ //Suppression physique
                        //Interdiction d'accès à la plateforme
                        $q_con_sup_e = "DELETE FROM connexion WHERE matricule =  '".$_GET['codeM_e']."'";
                        $res_con_s = sqlsrv_query($conn, $q_con_sup_e);

                        // SUpppression de la liste des étudiants
                        $querySup_p_e = "DELETE FROM enseignant WHERE matricule = '".$_GET['codeM_e']."'";
                        $result_sup_p = sqlsrv_query($conn, $querySup_p_e);

                        if ($result_sup_p) 
                        {  
                                ?>
                                    <script > 
                                        alert("enseignant bien supprimé.\n Il n'est plus dans la base de donnée et n'a plus accès à ce site.\nMerci de re-actualiser la page.");
                                    </script>

                                <?php 
                        }
                    }
                    else if($_GET['action_en'] == 'M') //%ODIFICATION
                    {
                        $queryM_en = "SELECT * FROM enseignant WHERE matricule = '".$_GET['codeM_e']."'";
                        $result_M = sqlsrv_query($conn, $queryM_en);
                        
                        if ($result_M) 
                        {
                            
                            while($etd = sqlsrv_fetch_array($result_M)){
                                echo 
                                    '<div class="row centered-form">
                                    <div class="col-xs-12 col-sm-8 col-md-4 col-sm-offset-2 col-md-offset-4">
                                    <form role="form" method="POST" id="form_modif">
                                    <div class="panel panel-default" id="boite" style="height:375px">
                                    <div class="panel-heading" id="boite_cor" style="height:50px">
                                        <h3 class="panel-title"> 
                                            MODIFICATIONS DES INFORMATIONS
                                        </h3>
                                    </div>
                                
                                    <div class="panel-body"  id="boite_body" style="height:0px">
                                        <div class="row">
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label class="form-control input-sm">Matricule</label>
                                                </div>
                                            </div>
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                   <input type="text" name="matricule_m" id="matricule_etudiant_m" class="form-control input-sm"  readonly="true" value = "' .$etd['matricule']. '">
                                                </div>
                                            </div>

                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label class="form-control input-sm">Nom enseignant : </label>
                                                </div>
                                            </div>
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <input type="text" id="name" name="nom_m" id="nom_etudiant_m" class="form-control input-sm"  value = "' .$etd['nom']. '">
                                                </div>
                                            </div>

                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label class="form-control input-sm">Prénom enseignant : </label>
                                                </div>
                                            </div>
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <input type="text" name="prenom_m" id="prenom_etudiant_m" class="form-control input-sm" value = "' .$etd['prenom']. '">
                                                </div> 
                                            </div>

                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label class="form-control input-sm">Statut enseignant : </label>
                                                </div>
                                            </div>

                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <input type="text" name="statut_m" id="statut_m" class="form-control input-sm" value = "' .$etd['statut']. '">
                                                </div> 
                                            </div>

                                        </div>
                                    </div>
                                    <input type="submit" name = "modifie_enseig" value="MODIFIER" class="btn btn-info btn-block">
                                </div>
                            </form>
                        </div>
                    </div>
                        ';
                        ?>
                                    <script>
                                        document.getElementById("name").focus();
                                        // alert("etudiant");
                                    </script>
                                <?php
                            }
                        
                        }
                        else
                        {
                            ?>
                                <script>
                                    alert("erreur de selection de l'enseignant")
                                    document.getElementById('boite').style.height='0px'
                                </script>

                            <?php

                        }
                    
                    }
                }

                if(isset($_POST['modifie_enseig'])){

                    $queryModif_en = "UPDATE enseignant SET nom ='".$_POST['nom_m']."', prenom ='".$_POST['prenom_m']."', statut ='".$_POST['statut_m']."', id_user = '".$_SESSION['matriculeResponsable']."', date_suppression = '".date('Y-m-d H:i:s')."' WHERE matricule = '".$_POST['matricule_m']."'";
                  $result_modif = sqlsrv_query($conn, $queryModif_en);

                        if ($result_modif) 
                        {
                            ?>

                                <script > 
                                    alert('Enseignant modifié avec succès.\nMerci de re-actualiser la page.');
                                    document.getElementById('boite').style.height='0px';

                                </script>

                            <?php
                        }
                }
            ?>
        </div>

</body>
</html>