<?php
	session_start();
	include'connexion.php';

?>
<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body>

</body>
</html>


<?php
	

	$PhotoEtudiant = $_FILES['PhotoEtudiant']['name'];
	$file_tmp_name = $_FILES['PhotoEtudiant']['tmp_name'];
	$imageSize = $_FILES['PhotoEtudiant']['size'];

	$upload_dir ='../fichierImage/photoEleve/';
	$imageExt = strtolower(pathinfo($PhotoEtudiant, PATHINFO_EXTENSION));
	$valid_extension=array('jpeg','jpg','png','gif','pdf');
	$pictureEtudiant = rand(1000, 1000000).".".$imageExt;
	move_uploaded_file($file_tmp_name, $upload_dir.$pictureEtudiant);

	$_SESSION['photo'] = $pictureEtudiant;

	// Préparation de la requête pour vérifier si le matricule existe déjà dans la table étudiant
	$q_mat = "SELECT matricule_etudiant FROM etudiant";
	$params = array();
    $options =  array( "Scrollable" => SQLSRV_CURSOR_KEYSET );
    $stmt = sqlsrv_query( $conn, $q_mat , $params, $options );

    $row_count = sqlsrv_num_rows( $stmt );

    $data = []; // Tableau pour stocker les matricules existants
    for($i = 0; $i < $row_count; $i++){
            $data[] = sqlsrv_fetch_array( $stmt, SQLSRV_FETCH_ASSOC);
        }
    

    foreach ($data as $key => $value) {   
        if ($_POST['matriculeEtudiant'] == implode($value)) {
            $result = "True";
        }
    }
	// Préparation de la requête pour vérifier si le matricule existe déjà dans la table connexion
    $q_mat_con = "SELECT matricule FROM connexion";
	$params = array();
    $options =  array( "Scrollable" => SQLSRV_CURSOR_KEYSET );
    $stmt_con = sqlsrv_query( $conn, $q_mat_con , $params, $options );

    $row_count_con = sqlsrv_num_rows( $stmt_con );

    $data_con = []; // Tableau pour stocker les matricules existants
    for($j = 0; $j < $row_count_con; $j++){
            $data_con[] = sqlsrv_fetch_array( $stmt_con, SQLSRV_FETCH_ASSOC);
        }
    

    foreach ($data_con as $key => $value) {   
        if ($_POST['matriculeEtudiant'] == implode($value)) {
            $result_con = "True";
        }
    }

	
	if(!(is_numeric($_POST['matriculeEtudiant']))){
		?>
			<script>
				alert("Le matricule entré n'est un numérique.\n Il doit un entier de 5 positions");
				window.location.href=('pagesuperAdmin.php');
			</script>
		<?php
	}
	else{
		if(strlen($_POST['matriculeEtudiant'])!=5){
		?>
			<script>
				alert("Ce matricule n'est pas celui d'un étudiant.\n Il doit un entier de 5 positions");
				window.location.href=('pagesuperAdmin.php');
			</script>
		<?php
		}
		//On lie chaque marqueur à une valeur :
		if ($_POST['classeEtudiant'] == "-----Choisissez La classe de l'étudiant-----") {
			?>
				<script>
					alert("Les valeurs entrés ne sont pas autorisées.\nReprendre l'opération!!!");
					window.location.href=('pagesuperAdmin.php');
				</script>
			<?php			
			die();
		}
	else {
		if ($result_con == "True") {
			?>
				<script>
					alert("Ce matricule est déjà attribué à un autre étudiant dans la table de connexion.\nmerci de bienvouloir revérifier la saisie");
					window.location.href=('pagesuperAdmin.php');
				</script>
			<?php
		}
		else if($result == "True") {
			?>
				<script>
					alert("Ce matricule est déjà attribué à un autre élève.\nmerci de bienvouloir revérifier la saisie");
					window.location.href=('pagesuperAdmin.php');
				</script>
			<?php
			
		}
		else {
			$q = "INSERT INTO etudiant (matricule_etudiant, classe, nom_etudiant, prenom_etd, date_naissance_etud, nationalite_etud, photo_etudiant, pwd) VALUES ('".$_POST['matriculeEtudiant']."','".$_POST['classeEtudiant']."','".$_POST['nomEtudiant']."','".$_POST['prenomEtudiant']."','".$_POST['DateNaissanceEtudiant']."','".$_POST['NationalitéEtudiant']."','".$pictureEtudiant."','12345')";

				

				$q_r = sqlsrv_query($conn, $q);
				if ($q_r) {
					$q_connexion = "INSERT INTO connexion (matricule, pwd) values ('".$_POST['matriculeEtudiant']."','12345')";
					$r_connexion = sqlsrv_query($conn, $q_connexion);
					?>
						<script>
							alert("Problème d'exécution de la requête matricule déjà existant");
						</script>
					<?php
				}	
				else{
					?>
						<script>
							alert("Problème d'exécution de la requête matricule déjà existant");
						</script>
					<?php
				}
				header('Location:pagesuperAdmin.php');
			}
		}
	}
	
?>