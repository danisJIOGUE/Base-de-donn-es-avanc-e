
<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body>
	<div class="container">
            <?php
            // Recuperation des informations de l'étudiant dans les tbles absences & retards
                $q_nb_classe = "SELECT classe FROM enseignant_has_matiere WHERE matricule = '".$_SESSION['matriculeEnseignant']."'";
                $params = array();
                $options =  array( "Scrollable" => SQLSRV_CURSOR_KEYSET );
                $r_nb_classe = sqlsrv_query( $conn, $q_nb_classe , $params, $options);

                $row_count_classe = sqlsrv_num_rows($r_nb_classe);

                if ($row_count_classe == 1) {
                	
                }
                else{

                }
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
                    <h2 class="section-heading"> IMPORTATION DES NOTES </h2>
                    <h3 class="section-subheading text-muted">Cette option vous donne la possibilité d'envoyer les notes des étudiants directment aux responsables des filières. Pour ce faire, vous devez renseigner les informations préables suivantes.</h3>
                </div>
            </div>
            <!-- Choix de la classe -->
            <div class="col-xs-2 col-sm-2 col-md-5 col-sm-offset-4 col-md-offset-4" style="float: left;">
                <form role="form" method="POST" enctype="multipart/form-data">
                        <div class="panel panel-default" id="boite" >
                            <div class="panel-body"  id="boite_body">
                                <div class="row">
                                    <div class="col-xs-10 col-sm-10 col-md-12">
                                        <div class="form-group"> 
                                            <select required="true" required name="classe" id="classe">
                                                <option>---Choisissez une classe---</option>
                                                    <?php
                                                    //parcourir le resultat de la requete pour créer les elements du SELECT
                                                        $query_classe = "SELECT classe from enseignant_has_matiere where matricule =  '".$_SESSION['matriculeEnseignant']."'";
                                                        $r_class_lib = sqlsrv_query($conn, $query_classe);
                                                        while ($ligneC = sqlsrv_fetch_array($r_class_lib)) 
                                                            {
                                                                echo"<option>".utf8_encode($ligneC["classe"])."</option>";
                                                            }
                                                    ?>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-xs-10 col-sm-10 col-md-12">
                                        <div class="form-group"> 
                                            <select required="true" required name="idPeriode">
                                                <option>---Choisissez la période concernée---</option>
                                                    <?php
                                                    //parcourir le resultat de la requete pour créer les elements du SELECT
                                                        $query_periode = "SELECT idperiode from periode";
                                                        $r_periode = sqlsrv_query($conn, $query_periode);
                                                        while ($ligneP = sqlsrv_fetch_array($r_periode)) 
                                                            {
                                                                echo"<option>".utf8_encode($ligneP["idperiode"])."</option>";
                                                            }
                                                    ?>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-xs-10 col-sm-10 col-md-12">
                                        <div class="form-group"> 
                                            <select required="true" required name="idStatut_note">
                                                <option>---Choisissez le statut de la note---</option>
                                                    <?php
                                                    //parcourir le resultat de la requete pour créer les elements du SELECT
                                                        $query_statut = "SELECT idstatut_note from statut_note ";
                                                        $r_statut = sqlsrv_query($conn, $query_statut);
                                                        while ($ligneS = sqlsrv_fetch_array($r_statut)) 
                                                            {
                                                                echo"<option>".utf8_encode($ligneS["idstatut_note"])."</option>";
                                                            }
                                                    ?>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-xs-10 col-sm-10 col-md-12">
                                        <div class="form-group"> 
                                            <select required="true" required name="codeMatiere">
                                                <option>---Choisissez la matière---</option>
                                                    <?php
                                                    //parcourir le resultat de la requete pour créer les elements du SELECT
                                                        $query_matiere = "SELECT code_matiere from enseignant_has_matiere where matricule =  '".$_SESSION['matriculeEnseignant']."'";
                                                        $r_matiere = sqlsrv_query($conn, $query_matiere);
                                                        while ($ligneM = sqlsrv_fetch_array($r_matiere)) 
                                                            {
                                                                echo"<option>".utf8_encode($ligneM["code_matiere"])."</option>";
                                                            }
                                                    ?>
                                            </select>
                                        </div>
                                    </div>
                                    <input type="file" name="fichierNote" required  placeholder="Choisir le fichier Excel" >
                                <input type="submit" name = "importExcel" value="VALIDER IMPORTATION" class="btn btn-info btn-block">
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            
            <?php

                if (isset($_POST['importExcel'])) {
                    if (!($_POST['idPeriode'] == "---Choisissez la période concernée---") && !($_POST['idStatut_note'] == "---Choisissez le statut de la note---" ) && !($_POST['classe'] == "--Choisissez une classe---") && !($_POST['codeMatiere'] == "---Choisissez la matière---")) {
                        $idPeriode = $_POST['idPeriode'];
                        $idStatut_note = $_POST['idStatut_note'];
                        $classe = $_POST['classe'];
                        $codeMatiere = $_POST['codeMatiere'];
                        var_dump($_POST);

                        
                        $file = $_FILES['fichierNote'];

                            $inputFileType = 'Xlsx';

                            $inputFileName = '../fichierExcel/'.$_FILES['fichierNote']['name'];
                            echo $inputFileName;
                            var_dump($_FILES);
                            if (file_exists($inputFileName)) {
                                echo $inputFileName;
                                $reader = IOFactory::createReader($inputFileType);

                                $reader->setReadDataOnly(true);
                                $spreadsheet = $reader->load($inputFileName);
                                $sheetData = $spreadsheet->getActiveSheet()->toArray(null, true, true, true);
                                $result_ipmport = 0;
                                    //iNSERT new row with place data
                                    $sql = '';
                                    for ($row=2; $row < count($sheetData); $row++) { 
                                        $xx = implode(",", $sheetData[$row]);
                                        $sql = "INSERT INTO carnetNote (matricule_etudiant, note, idperiode, idstatut_note, classe, matricule, code_matiere) values ($xx, '".$idPeriode."', '".$idStatut_note."', '".$classe."', ".$_SESSION['matriculeEnseignant']."; '".$codeMatiere."');";
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
                                                alert("Une erreur s'est produite lors de l'importation des notes.\n Merci de repprendre l'opératio");
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
	
</body>
</html>