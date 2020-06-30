<form action="" method="POST" enctype="multipart/form-data" id="formulaire_e">
                <table>
                    <tr>
                        <td><input style="text-align: center;" type="file" name="fichierNote" required  placeholder="Choisir le fichier Excel" ></td>
                        <td><input type="text" name="mot_cle_e" id="mot_cle_e" > </td>

                                    <td><select required="true" required="required" name="classeEtudiant" id="classeEtudiant">
                                        <span id="classe_manquant"></span>
                                        <option>-----Choisissez La classe de l'étudiant-----</option>
                                        <option>ITS1</option>
                                        <option>ITS2</option>
                                        <option>ITS3</option>
                                        <option>ITS4</option>
                                        <option>ISE1</option>
                                        <option>ISE2</option>
                                        <option>ISE3</option>
                                    </select></td>
                              
                        <td><input type="submit" name="chercher" value="chercher"></td>
                    </tr>
                </table>

                
            </form>
<?php
    include 'connexion.php';
    if (isset($_POST['chercher'])) {

        if (isset($_FILES['fichierNote']['name'])) {
            $filename = explode(".",$_FILES['fichierNote']['name']);
            if ($filename[1] == "csv") {
                $handle = fopen($_FILES['fichierNote']['tmp_name'], "r");
                while($data = fgetcsv($handle)){

                    $khari = explode(";", $data[0]);
                    // print_r($khari);
                    echo "<br>";
                    // print_r(explode(";", $data[0]));
                    // echo "<br>";

                    // print_r(implode(",", explode(";", $data[0])));
                    // echo "<br>";
                    $query_add="INSERT INTO  answer (`AnswerValue`,`AnswerKey` ,`Question`)
                            VALUES ('".$khari[0]."','".$khari[1]."','".$khari[2]."','".$khari[3]."','".$khari[4]."','".$khari[5]."')";
                    // // for ($i=0; $i <5 ; $i++) { 
                    
                    print_r($query_add);
                    // echo "<br>";
                    // echo "<br>";
                    // }

                    
                }

            }
            else
                {
                    echo "BAD";
                }
        }
        // $q_nb_rtd = "SELECT nombre_minute FROM retard WHERE matricule_etudiant = '".$_POST['mot_cle_e']."'";;
        // $params = array();
        // $options =  array( "Scrollable" => SQLSRV_CURSOR_KEYSET );
        // $r_nb_rtd = sqlsrv_query( $conn, $q_nb_rtd , $params, $options );

        // $row_count = sqlsrv_num_rows( $r_nb_rtd );

        // $data = []; // Tableau pour stocker les matricules existants
        // for($i = 0; $i < $row_count; $i++){
        //         $data[] = sqlsrv_fetch_array( $r_nb_rtd, SQLSRV_FETCH_ASSOC);
        //     }
        // $result = array_sum($data);
        // var_dump($data);
        // $result = 0;
        // foreach ($data as $key => $value) {   
        //     $result = $result  + implode($value);
        // }
        // echo $result;;
    }
    
?>

