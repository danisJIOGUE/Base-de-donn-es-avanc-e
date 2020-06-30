
<!DOCTYPE html>
<html>
<head>
    <title></title>
</head>
<body>


    <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading">GESTION DES EUTIDIANTS DE L'ENSAE</h2>
                    <!--h3 class="section-subheading text-muted">La seule limite </h3-->
                </div>
            </div>
            <div class="container jumbotron text-center">
                <h3>FORMULAIRE D'AJOUT DE L'ETUDIANT </h3>          
                <button type='Boutton' class="btn btn-success" data-toggle="modal" data-target="#loginModal_r">Entrer les informations de l'étudiant</button>
            </div>
            <div class="modal fade" role="dialog" id="loginModal_r">
                <div class="modal-dialog">
                    <form role="form" method="POST" enctype="multipart/form-data" action="AjoutEtudiant_Admin.php">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h3 class="modal-title">FORMULAIRE D'AJOUT</h3>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>

                            <div class="modal-body">
                                <div class="form-group">
                                    <input type="text" name="nomEtudiant" required="required" id="nomEtudiant" placeholder="Entrer le nom">
                                    <span id="nom_manquant"></span>
                                </div>
                                <div class="form-group">
                                    <input type="text" name="prenomEtudiant" required="required" id="prenomEtudiant" placeholder="Entrer le prénom" >
                                    <span id="prenom_manquant"></span>
                                </div>
                                <div class="form-group">
                                    <input type="text" name="DateNaissanceEtudiant" required="required" id="DateNaissanceEtudiant" placeholder="Entrer la date de naissance" >
                                    <span id="DateNaiss_manquant"></span>
                                </div>
                                <div class="form-group">
                                    <input type="text" name="matriculeEtudiant" required="required" id="matriculeEtudiant" placeholder="Entrer le matricule" >
                                    <span id="matricule_manquant"></span>
                                </div>
                                
                                <div class="form-group">
                                    <input type="text" name="NationalitéEtudiant" required="required" id="NationalitéEtudiant" placeholder="Entrer la nationalité" >
                                    <span id="nationalite_manquant"></span>
                                </div>
                                <div class="form-group">
                                    <acronym title="Choisir la photo de l'étudiant..."><input type="file" name="PhotoEtudiant" required="required" id="PhotoEtudiant" placeholder="Choisir la photo" ></acronym>
                                    <span id="nationalite_manquant"></span>
                                </div>
                                <div class="form-group"> 
                                    <select required="true" required="required" name="classeEtudiant" id="classeEtudiant">
                                        <span id="classe_manquant"></span>
                                        <option>-----Choisissez La classe de l'étudiant-----</option>
                                        <option>ITS1</option>
                                        <option>ITS2</option>
                                        <option>ITS3</option>
                                        <option>ITS4</option>
                                        <option>ISE1</option>
                                        <option>ISE2</option>
                                        <option>ISE3</option>
                                    </select>
                                </div>
                            </div>

                            <div class="modal-footer">
                                <input type="submit" name="Submit" id="valideAjout" value="Ajouter" class="btn btn-success" data-toggle="modal" data-target="#login2" onclick="envoyer()">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <!-- Importation des étudiants -->
            <div style="border: white 10px"> 
                <form action="" method="POST" enctype="multipart/form-data">
                    <table>
                        <tr>
                            <td>
                                <acronym title="Importer la liste des étudiants au fichier csv"><input style="text-align: center;" type="file" name="fichierNote" required  placeholder="Choisir le fichier Excel" ></acronym>
                            </td>
                            <td>
                                <input type="submit" name="import_eleve" style="border: solid 2px; border-radius: 5px; background-color: lightblue" value="IMPORTER">
                            </td>
                        </tr>
                    </table>
                </form>
            
                <?php
                // Script d'importation
                    if (isset($_POST['import_eleve'])) {
                        if (isset($_FILES['fichierNote']['name'])) {
                            $filename = explode(".",$_FILES['fichierNote']['name']);
                            if ($filename[1] == "csv") {
                                $handle = fopen($_FILES['fichierNote']['tmp_name'], "r");
                                $i = 0;  //Pour contrôler l'importation de la première ligne du tableau
                                $err = 1; //Pour contrôler les erreur d'importation
                                while($data = fgetcsv($handle)){

                                    if ($i > 0) {
                                        $data_imp = explode(";", $data[0]);
                                        echo "<br>";
                                        $query_add="INSERT INTO  etudiant (matricule_etudiant, classe, nom_etudiant ,prenom_etd, nationalite_etud, adresse)
                                                VALUES ('".$data_imp[0]."','".$data_imp[1]."','".$data_imp[2]."','".$data_imp[3]."','".$data_imp[4]."','".$data_imp[5]."')"; 
                                        
                                        $r_add = sqlsrv_query($conn, $query_add);
                                        if ($r_add) {
                                            $err = 1;
                                        }
                                        else{
                                            $err = 2;
                                        }
                                    }
                                    $i++;
                                }
                                if ($err == 1) {
                                    ?>
                                        <script type="text/javascript">
                                             alert("Importation effectué avec succès de la liste des étudiants.");
                                        </script>
                                     <?php
                                }
                                else if($err == 2){
                                    ?>
                                        <script type="text/javascript">
                                            alert("Un problème est survenu lors de l'Importation de la liste des étudiants.");
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
            <form action="" method="POST" enctype="multipart/form-data" id="formulaire_e" style="padding-top: 20px">
                <table>
                    <tr>
                        <td><acronym title="Rechercher suivant le nom ou le matricule des étudiants" style="background-color: green">Rechercher  :   </acronym></td>
                        <td><input type="text" name="mot_cle_e" id="mot_cle_e" > </td>
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
                          <th scope="col">CLASSE</th>
                          <th scope="col">PHOTO</th>
                          <th colspan='3'></th>
                        </tr>
                      </thead>
                    <?php
                        if(isset($_POST['mot_cle_e'])){ //Requête de recherche des etudiants suivant leur nom
                            $q_cherche = "SELECT count(*) from etudiant where est_supprime = 'NON' AND nom_etudiant like '%".$_POST['mot_cle_e']."%'"; 
                            $q_cher = "SELECT TOP (5) * from etudiant where est_supprime = 'NON' AND nom_etudiant like '%".$_POST['mot_cle_e']."%'";
                            $res_c = sqlsrv_query($conn, $q_cher);
                            $res = sqlsrv_query($conn,$q_cherche);
                            $res_cher = sqlsrv_fetch_array($res);

                            $r_cher_etd = implode($res_cher);
                            if($r_cher_etd == "00"){// si la Requête de recherche des etudiants suivant leur nom est vide on recherche svt le matricule
                                $q_cherche = "SELECT count(*) from etudiant where est_supprime = 'NON' AND matricule_etudiant like '%".$_POST['mot_cle_e']."%'";
                                $q_cher = "SELECT TOP (5) * from etudiant where est_supprime = 'NON' AND matricule_etudiant like '%".$_POST['mot_cle_e']."%'";
                                $res_c = sqlsrv_query($conn, $q_cher); 
                                $res = sqlsrv_query($conn, $q_cherche);
                                $res_cher = sqlsrv_fetch_array($res);
                                $r_cher_etd = implode($res_cher);
                            } 

                            if(!($r_cher_etd == "00")){ //Affichage des resultats de la recherche
                                while($etud = sqlsrv_fetch_array($res_c)){
                                    echo"<tr>
                                        <td>".utf8_encode($etud["nom_etudiant"])."</td>
                                        <td>".$etud["prenom_etd"]."</td>
                                        <td>". utf8_encode($etud["matricule_etudiant"])."</td>
                                        <td>". utf8_encode($etud["classe"])."</td>
                                        <td><img src='../fichierImage/photoEleve/".$etud['photo_etudiant']."' style='width:40px;height:40px;'></td>
                                        <td><a href='?codeM=".$etud["matricule_etudiant"]."&action_et=M'>Modifier</a></td>
                                        <td><a href='?codeM=".$etud["matricule_etudiant"]."&action_et=SL' onclick=\"return confirm('Etes-vous certain de vouloir effectuer une suppression logique ?');\">Suppression logique</a></td>
                                        <td><a href='?codeM=".$etud["matricule_etudiant"]."&action_et=SP' onclick=\"return confirm('Etes-vous certain de vouloir effectuer une suppression physique ?');\">Suppression physique</a></td>
                                      </tr>"; 
                                      ?>
                                        <script>
                                            document.getElementById("mot_cle_e").focus();
                                        </script>
                                    <?php   
                                }
                            }
                            else{ // Aucun resultat ne correspond à la recherche affichage par defaut
                                ?>
                                    <script>
                                        alert("Aucun resultat");
                                        document.getElementById("mot_cle_e").focus();

                                    </script>
                                <?php
                                $qs = "SELECT   TOP (5) * FROM etudiant where est_supprime = 'NON' ORDER BY nom_etudiant ASC ";
                                $sel = sqlsrv_query($conn, $qs);
                            while($etudiant = sqlsrv_fetch_array($sel)){
                                echo"<tr>
                                    <td>".utf8_encode($etudiant["nom_etudiant"])."</td>
                                    <td>".$etudiant["prenom_etd"]."</td>
                                    <td>". utf8_encode($etudiant["matricule_etudiant"])."</td>
                                    <td>". utf8_encode($etudiant["classe"])."</td>
                                    <td><img src='../fichierImage/photoEleve/".$etudiant['photo_etudiant']."' style='width:40px;height:40px;''></td>
                                    <td><a href='?codeM=".$etudiant["matricule_etudiant"]."&action_et=M'>Modifier</a></td>
                                    <td><a href='?codeM=".$etudiant["matricule_etudiant"]."&action_et=SL' onclick=\"return confirm('Etes-vous certain de vouloir effectuer une suppression logique ?');\">Suppression logique</a></td>
                                    <td><a href='?codeM=".$etudiant["matricule_etudiant"]."&action_et=SP' onclick=\"return confirm('Etes-vous certain de vouloir effectuer une suppression physique ?');\">Suppression physique</a>
                                            </td>
                                  </tr>";   
                                }   
                            }                           
                            
                        }
                        else if(isset($_POST['afficheSupprime_e'])){// Vérification pour l'affichage des etudiants supprimés logiquement
                            $q_affichesupprime = "SELECT count(*) FROM etudiant where est_supprime = 'OUI'";
                                $sup = sqlsrv_query($conn, $q_affichesupprime);
                                $count = sqlsrv_fetch_array($sup);
                            if ($count > 0) {
                                $q_s = "SELECT TOP (5) * FROM etudiant where est_supprime = 'OUI' ORDER BY nom_etudiant ASC ";
                                $sel_sup = sqlsrv_query($conn, $q_s);
                                while($etudiant_s = sqlsrv_fetch_array($sel_sup)){
                                    echo"<tr>
                                        <td>".utf8_encode($etudiant_s["nom_etudiant"])."</td>
                                        <td>".$etudiant_s["prenom_etd"]."</td>
                                        <td>". utf8_encode($etudiant_s["matricule_etudiant"])."</td>
                                        <td>". utf8_encode($etudiant_s["classe"])."</td>
                                        <td><img src='../fichierImage/photoEleve/".$etudiant_s['photo_etudiant']."' style='width:40px;height:40px;''></td>
                                        <td><a href='?codeM=".$etudiant_s["matricule_etudiant"]."&action_et=M'>Modifier</a></td>
                                        <td><a href='?codeM=".$etudiant_s["matricule_etudiant"]."&action_et=SL' onclick=\"return confirm('Etes-vous certain de vouloir effectuer une suppression logique ?');\">Suppression logique</a></td>
                                        <td><a href='?codeM=".$etudiant_s["matricule_etudiant"]."&action_et=SP' onclick=\"return confirm('Etes-vous certain de vouloir effectuer une suppression physique ?');\">Suppression physique</a></td>
                                      </tr>"; 
                                      ?>
                                    <script>
                                        document.getElementById("mot_cle_e").focus();
                                    </script>
                                    <?php  
                                }
                            }
                            else{ // Aucun étudiant supprimé de façon logique
                                ?>
                                    <script>
                                        alert("Aucun etudiant n'a été supprimé de façon logique!!");
                                        document.getElementById("mot_cle_e").focus();

                                    </script>
                                <?php
                                $qs = "SELECT TOP (5) * FROM etudiant where est_supprime = 'NON' ORDER BY nom_etudiant ASC ";
                                $sel = sqlsrv_query($conn, $qs);
                            while($etudiant = sqlsrv_fetch_array($sel)){
                                echo"<tr>
                                    <td>".utf8_encode($etudiant["nom_etudiant"])."</td>
                                    <td>".$etudiant["prenom_etd"]."</td>
                                    <td>". utf8_encode($etudiant["matricule_etudiant"])."</td>
                                    <td>". utf8_encode($etudiant["classe"])."</td>
                                    <td><img src='../fichierImage/photoEleve/".$etudiant['photo_etudiant']."' style='width:40px;height:40px;''></td>
                                    <td><a href='?codeM=".$etudiant["matricule_etudiant"]."&action_et=M'>Modifier</a></td>
                                    <td><a href='?codeM=".$etudiant["matricule_etudiant"]."&action_et=SL' onclick=\"return confirm('Etes-vous certain de vouloir effectuer une suppression logique ?');\">Suppression logique</a></td>
                                    <td><a href='?codeM=".$etudiant["matricule_etudiant"]."&action_et=SP' onclick=\"return confirm('Etes-vous certain de vouloir effectuer une suppression physique ?');\">Suppression physique</a></td>
                                  </tr>";   
                                }
                            }     
                        }
                        else{ // Affichages des étudiants
                            $qs = "SELECT TOP (5) * FROM etudiant where est_supprime = 'NON' ORDER BY nom_etudiant ASC ";
                            $sel = sqlsrv_query($conn, $qs);
                            while($etudiant = sqlsrv_fetch_array($sel)){
                                echo"<tr>
                                    <td>".utf8_encode($etudiant["nom_etudiant"])."</td>
                                    <td>".$etudiant["prenom_etd"]."</td>
                                    <td>". utf8_encode($etudiant["matricule_etudiant"])."</td>
                                    <td>". utf8_encode($etudiant["classe"])."</td>
                                    <td><img src='../fichierImage/photoEleve/".$etudiant['photo_etudiant']."' style='width:40px;height:40px;''></td>
                                    <td><a href='?codeM=".$etudiant["matricule_etudiant"]."&action_et=M'>Modifier</a></td>
                                    <td><a href='?codeM=".$etudiant["matricule_etudiant"]."&action_et=SL' onclick=\"return confirm('Etes-vous certain de vouloir effectuer une suppression logique ?');\">Suppression logique</a></td>
                                    <td><a href='?codeM=".$etudiant["matricule_etudiant"]."&action_et=SP' onclick=\"return confirm('Etes-vous certain de vouloir effectuer une suppression physique ?');\">Suppression physique</a></td>
                                  </tr>";   
                            }   
                        }

                        
                    ?>        
                </table>
            </form>
            <br>

            <form method="POST" action_et="">
                <table>
                    <tr>
                        <td><acronym title="afficher les étudiants qui ont été supprimé"><input type="submit" name="afficheSupprime_e" value="AFFICHER" style="border-radius: 5px; border: solid; background-color: green"></acronym></td>
                    </tr>
                </table>
            </form>
        <?php 

        if (isset($_GET["codeM"]) && isset( $_GET["action_et"] )) {
                $action = $_GET["action_et"];
                $Mat = $_GET["codeM"];
                    if ($_GET["action_et"] == "SL") //Suppression Logique
                    {
                        //=========DEBUT SUPPRESSION LOGIQUE
                        $querySup = "UPDATE etudiant SET id_user='".$_SESSION['matriculeResponsable']."',date_modification='".date('Y-m-d H:i:s')."',est_supprime='OUI' WHERE matricule_etudiant='".$_GET['codeM']."'"; //suppression logique
                        
                        $result_sup = sqlsrv_query($conn,$querySup);
                        if ($result_sup) 
                        {
                            ?>
                                <script > alert('Etudiant bien supprimé.\nMerci de re-actualiser la page.');</script>
                            <?php
                            unset($_GET['action_et']);
                            unset($_GET['codeM']);
                        }
                        unset($action);
                        unset($Mat);
                        //=========FIN SUPPRESSION
                    }
                    else if($_GET['action_et'] == "SP"){ //Suppression physique
                        //Interdiction d'accès à la plateforme
                        $q_con_sup = "DELETE FROM connexion WHERE matricule =  '".$_GET['codeM']."'";
                        $res_con_s = sqlsrv_query($conn, $q_con_sup);

                        // SUpppression de la liste des étudiants
                        $querySup_p = "DELETE FROM etudiant WHERE matricule_etudiant = '".$_GET['codeM']."'";
                        $result_sup_p = sqlsrv_query($conn, $querySup_p);

                        if ($result_sup_p) 
                        {  
                            if($res_con_s){
                                ?>
                                    <script > 
                                        alert("etudiant bien supprimé.\n Il n'est plus dans la base de donnée et n'a plus accès à ce site.\nMerci de re-actualiser la page.");
                                    </script>
                                <?php
                            } 
                        }
                    }
                    else if($_GET['action_et'] == 'M') //%ODIFICATION
                    {
                        $queryM = "SELECT * FROM etudiant WHERE matricule_etudiant = '".$_GET['codeM']."'";
                        $result_M = sqlsrv_query($conn, $queryM);
                        
                        if ($result_M) 
                        {  
                            while($etd = sqlsrv_fetch_array($result_M)){
                                $control = 1;
                                echo 
                                    '<div class="row centered-form">
                                    <div class="col-xs-12 col-sm-8 col-md-4 col-sm-offset-2 col-md-offset-4">
                                    <form role="form" method="POST" id="form_modif">
                                    <div class="panel panel-default " id="boite" style="height:375px">
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
                                                   <input type="text" name="matricule_etudiant_m" id="matricule_etudiant_m" class="form-control input-sm"  readonly="true" value = "' .$etd['matricule_etudiant']. '">
                                                </div>
                                            </div>

                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label class="form-control input-sm">Nom Etudiant : </label>
                                                </div>
                                            </div>
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <input type="text" id="name" name="nom_etudiant_m" id="nom_etudiant_m" class="form-control input-sm"  value = "' .$etd['nom_etudiant']. '">
                                                </div>
                                            </div>

                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label class="form-control input-sm">Prénom Etudiant : </label>
                                                </div>
                                            </div>
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <input type="text" name="prenom_etudiant_m" id="prenom_etudiant_m" class="form-control input-sm" value = "' .$etd['prenom_etd']. '">
                                                </div> 
                                            </div>

                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label class="form-control input-sm">Date Naissance : </label>
                                                </div>
                                            </div>
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <input type="text" name="date_naissance_etud_m" id="date_naissance_etud_m" class="form-control input-sm" value = "' .$etd['date_naissance_etud']. '">
                                                </div> 
                                            </div>

                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label class="form-control input-sm">Nationalité Etudiant: </label>
                                                </div>
                                            </div>
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <input type="text" name="nationalite_etud_m" id="nationalite_etud_m" class="form-control input-sm" value = "' .$etd['nationalite_etud']. '">
                                                </div> 
                                            </div>

                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label class="form-control input-sm">Classe Etudiant: </label>
                                                </div>
                                            </div>
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <input type="text" name="classe_etudiant_m" id="classe_etudiant_m" class="form-control input-sm" value = "' .$etd['classe']. '">
                                                </div> 
                                            </div>
                                        </div>
                                    </div>
                                    <input type="submit" name = "modifie_etudiant" value="MODIFIER" class="btn btn-info btn-block">
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
                                    alert("erreur de selection de l'étudiant")
                                    document.getElementById('boite').style.height='0px'
                                </script>

                            <?php

                        }
                    
                    }
                }

                if(isset($_POST['modifie_etudiant'])){

                    $queryModif = "UPDATE etudiant SET nom_etudiant ='".$_POST['nom_etudiant_m']."', prenom_etd ='".$_POST['prenom_etudiant_m']."', date_naissance_etud ='".$_POST['date_naissance_etud_m']."', nationalite_etud='".$_POST['nationalite_etud_m']."', classe = '".$_POST['classe_etudiant_m']."', id_user = '".$_SESSION['matriculeResponsable']."', date_modification = '".date('Y-m-d H:i:s')."' WHERE matricule_etudiant = '".$_POST['matricule_etudiant_m']."'";
                  $result_modif = sqlsrv_query($conn, $queryModif);

                        if ($result_modif) 
                        {
                            ?>

                                <script > 
                                    alert('Etudiant bien modifié.\nMerci de re-actualiser la page.');

                                </script>

                            <?php
                            unset($_GET['action_et']);
                            unset($_GET['codeM']);
                             
                        }
                        unset($_POST['modifie_etudiant']);
                }

            ?>
        </div>

</body>
</html>