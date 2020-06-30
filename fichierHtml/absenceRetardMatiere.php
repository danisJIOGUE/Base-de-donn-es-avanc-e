<div class="container">
            <div class="col-lg-12 text-center">
                    <h2 class="section-heading">RENSEIGNER LES ABSENCES ET LES RETARDS DES ENSEIGNANTS ET ETUDIANTS</h2>
                    <h5 class="section-subheading text-muted">Vous êtes tenus de mettre à jour cette section à la fin de chaque cours. Un contrôle sera effectué par le responsable de filière. Des sanctions sont prévues pour une mauvaise fois ou tout autre comportement ne requerrant pas de rigueur de votre part.</h5>
            </div>

            <div class="row" id="AbsencesRetards">
                <br>
                <h3  style="text-align: center; margin-top: 20px">ABSENCES & RETARDS DES ETUDIANTS</h3>
                <div class="col">
                    <!-- <div class="row lefted-form"> -->
                        <div class="col-xs-12 col-sm-10 col-md-5 col-sm-offset-1 col-md-offset-1" style="float: left;">
                            <form role="form" method="POST">
                                <div class="panel panel-default" id="boite" style="height:375px">
                                <div class="panel-heading" id="boite_cor" style="height:50px">
                                    <h3 class="panel-title" style="text-align: center"> 
                                        RETARDS DES ETUDIANTS
                                    </h3>
                                </div>
                           
                                <div class="panel-body"  id="boite_body" style="height:0px">
                                    <div class="row">
                                        <div class="col-xs-10 col-sm-10 col-md-12">
                                            <div class="form-group">
                                                <input type="text" name="matricule_etd_rtd" required id="matricule_etd_rtd" class="form-control input-sm" placeholder="Entrer le matricule de l'étudiant">
                                            </div>
                                        </div>

                                        <div class="col-xs-10 col-sm-10 col-md-12">
                                            <div class="form-group">
                                                <input type="text" name="date_etd_rtd" required id="date_etd_rtd" class="form-control input-sm" placeholder="Entrer la date au format JJ/MM/AAAA">
                                            </div>
                                        </div>

                                        <div class="col-xs-10 col-sm-10 col-md-12">
                                            <div class="form-group">
                                                <input type="number" name="heure_etd_rtd" required id="heure_etd_rtd" class="form-control input-sm" placeholder="Entrer le nombre de minutes">
                                            </div>
                                        </div>

                                        <div class="col-xs-10 col-sm-10 col-md-12">
                                            <div class="form-group">
                                                <input type="text" required name="matiere_etd_rtd" id="matiere_etd_rtd" class="form-control input-sm" placeholder="Entrer la matière">
                                            </div>
                                        </div>
                                    </div>
                                    <input type="submit" name = "rtd_etudiant" value="ENREGISTRER" class="btn btn-info btn-block">
                                </div>
                            </form>
                        </div>
                    <!-- </div> -->
                </div>
                <?php
                    if (isset($_POST['rtd_etudiant'])) {
                        $q_rtd_etd = "INSERT INTO retard (matricule_etudiant, code_matiere, date_rtd, nombre_minute) values ('".$_POST['matricule_etd_rtd']."', '".$_POST['matiere_etd_rtd']."', '".$_POST['date_etd_rtd']."', '".$_POST['heure_etd_rtd']."')";
                        $r_rtd_etd = sqlsrv_query($conn,$q_rtd_etd);
                        if($r_rtd_etd){
                            ?>
                                <script type="text/javascript">
                                    alert("Le retard enregistré avec succès");
                                </script>
                            <?php
                        }
                        else{
                            ?>
                                <script type="text/javascript">
                                    alert("Un problème est survenu lors de l'enregistrement.\n bienvouloir reprendre l'opération.");
                                </script>
                            <?php
                        }
                    }
                ?>
                <div class="col">
                    <!-- <div class="row lefted-form"> -->
                        <div class="col-xs-12 col-sm-10 col-md-5 col-sm-offset-1 col-md-offset-1" style="float: left;">
                            <form role="form" method="POST" id="form_modif">
                                <div class="panel panel-default" id="boite" style="height:375px">
                                <div class="panel-heading" id="boite_cor" style="height:50px">
                                    <h3 class="panel-title" style="text-align: center"> 
                                        ABSENCES DES ETUDIANTS
                                    </h3>
                                </div>
                           
                                <div class="panel-body"  id="boite_body" style="height:0px">
                                    <div class="row">
                                        <div class="col-xs-10 col-sm-10 col-md-12">
                                            <div class="form-group">
                                                <input type="text" name="matricule_etd_abs" id="matricule_etd_abs" class="form-control input-sm" placeholder="Entrer le matricule de l'étudiant">
                                            </div>
                                        </div>

                                        <div class="col-xs-10 col-sm-10 col-md-12">
                                            <div class="form-group">
                                                <input type="text" name="date_etd_abs" id="date_etd_abs" class="form-control input-sm" placeholder="Entrer le date au format JJ/MM/AAAA">
                                            </div>
                                        </div>

                                        <div class="col-xs-10 col-sm-10 col-md-12">
                                            <div class="form-group">
                                                <input type="number" name="heure_etd_abs" id="heure_etd_abs" class="form-control input-sm" placeholder="Entrer le nombre d'heure">
                                            </div>
                                        </div>

                                        <div class="col-xs-10 col-sm-10 col-md-12">
                                            <div class="form-group">
                                                <input type="text" name="matiere_etd_abs" id="matiere_etd_abs" class="form-control input-sm" placeholder="Entrer la matière">
                                            </div>
                                        </div>
                                    </div>
                                    <input type="submit" name = "abs_etudiant" value="ENREGISTRER" class="btn btn-info btn-block">
                                </div>
                            </form>
                        </div>
                    <!-- </div> -->
                </div>
            </div>
            <?php
                    if (isset($_POST['abs_etudiant'])) {
                        $q_rtd_etd = "INSERT INTO absence (matricule_etudiant, code_matiere, date_abs, nombre_heure) values ('".$_POST['matricule_etd_abs']."', '".$_POST['matiere_etd_abs']."', '".$_POST['date_etd_abs']."', '".$_POST['heure_etd_abs']."')";
                        $r_abs_etd = sqlsrv_query($conn, $q_rtd_etd);
                        if($r_abs_etd){
                            ?>
                                <script type="text/javascript">
                                    alert("L'absence enregistré avec succès");
                                </script>
                            <?php
                        }
                        else{
                            ?>
                                <script type="text/javascript">
                                    alert("Un problème est survenu lors de l'enregistrement.\n bienvouloir reprendre l'opération.");
                                </script>
                            <?php
                        }
                    }
                ?>

            <h3 style="text-align: center">ABSENCES & RETARDS DES ENSEIGNANTS</h3>
            <div class="row">
                <div class="col">
                    <!-- <div class="row lefted-form"> -->
                        <div class="col-xs-12 col-sm-10 col-md-5 col-sm-offset-1 col-md-offset-1" style="float: left;">
                            <form role="form" method="POST" id="form_modif">
                                <div class="panel panel-default" id="boite" style="height:375px">
                                <div class="panel-heading" id="boite_cor" style="height:50px">
                                    <h3 class="panel-title" style="text-align: center"> 
                                        RETARDS DES ENSEIGNANTS
                                    </h3>
                                </div>
                           
                                <div class="panel-body"  id="boite_body" style="height:0px">
                                    <div class="row">
                                        <div class="col-xs-10 col-sm-10 col-md-12">
                                            <div class="form-group">
                                                <input type="text" name="matricule_ens_rtd" id="matricule_ens_rtd" class="form-control input-sm" placeholder="Entrer le matricule de l'enseignant">
                                            </div>
                                        </div>

                                        <div class="col-xs-10 col-sm-10 col-md-12">
                                            <div class="form-group">
                                                <input type="text" name="date_ens_rtd" id="date_ens_rtd" class="form-control input-sm" placeholder="Entrer la date au format JJ/MM/AAAA">
                                            </div>
                                        </div>

                                        <div class="col-xs-10 col-sm-10 col-md-12">
                                            <div class="form-group">
                                                <input type="number" name="heure_ens_rtd" id="heure_ens_rtd" class="form-control input-sm" placeholder="Entrer le nombre de minutes">
                                            </div>
                                        </div>

                                        <div class="col-xs-10 col-sm-10 col-md-12">
                                            <div class="form-group">
                                                <input type="text" name="matiere_ens_rtd" id="matiere_ens_rtd" class="form-control input-sm" placeholder="Entrer la matière">
                                            </div>
                                        </div>
                                    </div>
                                    <input type="submit" name = "rtd_enseignant" value="ENREGISTRER" class="btn btn-info btn-block">
                                </div>
                            </form>
                        </div>
                    <!-- </div> -->
                </div>
                <?php
                    if (isset($_POST['rtd_enseignant'])) {
                        $q_rtd_etd = "INSERT INTO retard (matricule, code_matiere, date_rtd, nombre_minute) values ('".$_POST['matricule_ens_rtd']."', '".$_POST['matiere_ens_rtd']."', '".$_POST['date_ens_rtd']."', '".$_POST['heure_ens_rtd']."')";
                        $r_rtd_etd = sqlsrv_query($conn, $q_rtd_etd);
                        if($r_rtd_etd){
                            ?>
                                <script type="text/javascript">
                                    alert("Le retard enregistré avec succès");
                                </script>
                            <?php
                        }
                        else{
                            ?>
                                <script type="text/javascript">
                                    alert("Un problème est survenu lors de l'enregistrement.\n bienvouloir reprendre l'opération.");
                                </script>
                            <?php
                        }
                    }
                ?>

                <div class="col">
                    <!-- <div class="row lefted-form"> -->
                        <div class="col-xs-12 col-sm-10 col-md-5 col-sm-offset-1 col-md-offset-1" style="float: left;">
                            <form role="form" method="POST" id="form_modif">
                                <div class="panel panel-default" id="boite" style="height:375px">
                                <div class="panel-heading" id="boite_cor" style="height:50px">
                                    <h3 class="panel-title" style="text-align: center"> ABSENCE DES ENSEIGNANTS
                                    </h3>
                                </div>
                           
                                <div class="panel-body"  id="boite_body" style="height:0px">
                                    <div class="row">
                                        <div class="col-xs-10 col-sm-10 col-md-12">
                                            <div class="form-group">
                                                <input type="text" name="matricule_ens_abs" id="matricule_ens_abs" class="form-control input-sm" placeholder="Entrer le matricule de l'enseignant">
                                            </div>
                                        </div>

                                        <div class="col-xs-10 col-sm-10 col-md-12">
                                            <div class="form-group">
                                                <input type="text" name="date_ens_abs" id="date_ens_abs" class="form-control input-sm" placeholder="Entrer le date au format JJ/MM/AAAA">
                                            </div>
                                        </div>

                                        <div class="col-xs-10 col-sm-10 col-md-12">
                                            <div class="form-group">
                                                <input type="number" name="heure_ens_abs" id="heure_ens_abs" class="form-control input-sm" placeholder="Entrer le nombre d'heure">
                                            </div>
                                        </div>

                                        <div class="col-xs-10 col-sm-10 col-md-12">
                                            <div class="form-group">
                                                <input type="text" name="matiere_ens_abs" id="matiere_ens_abs" class="form-control input-sm" placeholder="Entrer la matière">
                                            </div>
                                        </div>
                                    </div>
                                    <input type="submit" name = "abs_enseignant" value="ENREGISTRER" class="btn btn-info btn-block">
                                </div>
                            </form>
                        </div>
                    <!-- </div> -->
                </div> 
            </div> 
            <?php
                    if (isset($_POST['abs_enseignant'])) {
                        $q_abs_ens = "INSERT INTO absence (matricule, code_matiere, date_abs, nombre_heure) values ('".$_POST['matricule_ens_abs']."', '".$_POST['matiere_ens_abs']."', '".$_POST['date_ens_abs']."', '".$_POST['heure_ens_abs']."')";
                        $r_abs_ens = sqlsrv_query($conn, $q_abs_ens);
                        if($r_abs_ens){
                            ?>
                                <script type="text/javascript">
                                    alert("L'absence enregistré avec succès");
                                </script>
                            <?php
                        }
                        else{
                            ?>
                                <script type="text/javascript">
                                    alert("Un problème est survenu lors de l'enregistrement.\n bienvouloir reprendre l'opération.");
                                </script>
                            <?php
                        }
                    }
                ?>

            <div class="col-lg-12 text-center">
                    <h2 class="section-heading">RENSEIGNER INFORMATIONS RELATIVES A LA MATIERE QUI VIENT D'ETRE ABORDE</h2>
            </div>
            <?php
                $query_ue = "SELECT code_ue FROM classe_has_unite_enseignement WHERE classe = '".$classe_etd."'";
                $r_ue = sqlsrv_query($conn, $query_ue);
                                    // $res1 = sqlsrv_fetch_array($r_ue);
                                    // $q_lib_ue = "SELECT libele_ue FROM unite_enseignement where code_ue = '".$res1['code_ue']."'";
                                    // $res2 = sqlsrv_query($conn,$q_lib_ue);
            ?>
            <div style="text-align: center;">
                <form action="" method="POST" enctype="multipart/form-data" style="text-align: center;">
                    <table>
                        <tr>
                            <td>
                                <select required="true" required="required" name="codeUE" id="codeUE">
                                    <option>-----Choisissez L'UE concerné par la matière-----</option>
                                    <?php
                                        //parcourir le resultat de la requete pour créer les elements du SELECT
                                        while ($ligne = sqlsrv_fetch_array($r_ue)) 
                                        {
                                            echo"<option>".utf8_encode($ligne["code_ue"])."</option>";
                                        }
                                    ?>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="submit" name="code_lib_ue" value="Valider le choix de l'UE"></td>
                        </tr>
                    </table>
                </form>
            </div>
            
            
            <div class="row" id="matiere">
                <div class="row lefted-form">
                        <div class="col-xs-12 col-sm-12 col-md-8 col-sm-offset-2 col-md-offset-2" style="float: left;">
                            <form role="form" method="POST" id="form_modif">
                                <div class="panel panel-default" id="boite" style="height:375px">
                                <div class="panel-heading" id="boite_cor" style="height:50px">
                                    <h3 class="panel-title" style="text-align: center"> INFORMATIONS MATIERE
                                    </h3>
                                </div>
                                <div class="panel-body"  id="boite_body" style="height:0px">
                                    <div class="row">
                                        <div class="col-xs-10 col-sm-10 col-md-12">
                                            <div class="form-group"> 
                                                <select required="true" required="required" name="nom_mat" id="nom_mat">
                                                    <option>-----Choisissez la matière-----</option>
                                                    <?php
                                                      //parcourir le resultat de la requete pour créer les elements du SELECT
                                                        if (isset($_POST['code_lib_ue'])) {
                                                                if (!($_POST['codeUE'] == "-----Choisissez L'UE concerné par la matière-----")) {
                                                                $query_lib_mat = "SELECT * from matiere where code_ue = '".$_POST['codeUE']."'";
                                                                $r_mat_lib = sqlsrv_query($conn, $query_lib_mat);
                                                                    while ($ligneM = sqlsrv_fetch_array($r_mat_lib)) 
                                                                {
                                                                    echo"<option>".utf8_encode($ligneM["libele"])."</option>";
                                                                }
                                                            }
                                                            else{
                                                                ?>
                                                                    <script type="text/javascript">
                                                                        alert("choisir d'abord l'ue correspondant");
                                                                    </script>
                                                                <?php
                                                            }
                                                        }
                                                      ?>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-xs-10 col-sm-10 col-md-12">
                                            <div class="form-group">
                                                <input type="text" name="matricule_ens_mat" id="matricule_ens_mat" class="form-control input-sm" placeholder="Entrer le matricule de l'enseignant">
                                            </div>
                                        </div>

                                        <div class="col-xs-10 col-sm-10 col-md-12">
                                            <div class="form-group">
                                                <input type="text" name="date_mat" id="date_mat" class="form-control input-sm" placeholder="Entrer le date au format JJ/MM/AAAA">
                                            </div>
                                        </div>

                                        <div class="col-xs-10 col-sm-10 col-md-12">
                                            <div class="form-group">
                                                <input type="number" name="heure_eff" id="heure_eff" class="form-control input-sm" placeholder="Entrer le nombre d'heure effectué ce jour">
                                            </div>
                                        </div>

                                        <div class="col-xs-10 col-sm-10 col-md-12">
                                            <div class="form-group">
                                                <input type="number" name="heure_tot" id="heure_tot" class="form-control input-sm" placeholder="Entrer le nombre d'heure total effectué à ce jour">
                                            </div>
                                        </div>

                                    </div>
                                    <input type="submit" name = "valMatiere" value="ENREGISTRER" class="btn btn-info btn-block">
                                </div>
                            </form>
                        </div>
                    </div>
                    <?php
                        if (isset($_POST['valMatiere'])) {
                            $q_mat_val = "UPDATE matiere SET  matricule = '".$_POST['matricule_ens_mat']."', heure_eff = '".$_POST['heure_eff']."', total_heure_eff = '".$_POST['heure_tot']."', id_user = '".$_SESSION['matriculeEtudiant']."', date_modification = '".date('Y-m-d H:i:s')."', date_mat = '".$_POST['date_mat']."' WHERE libele = '".$_POST['nom_mat']."'";
                            
                            $r_mat_val = sqlsrv_query($conn, $q_mat_val);
                            if($r_mat_val){
                                ?>
                                    <script type="text/javascript">
                                        alert("Informations mises à jour avec succès");
                                    </script>
                                <?php
                            }
                            else{
                                ?>
                                    <script type="text/javascript">
                                        alert("Un problème est survenu lors de l'enregistrement.\n bienvouloir reprendre l'opération.");
                                    </script>
                                <?php
                            }

                        }
                    ?>
            </div>
        </div>