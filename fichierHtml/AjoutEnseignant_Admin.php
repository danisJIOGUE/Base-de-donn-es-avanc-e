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
	

	$photo = $_FILES['photo']['name'];
	$file_tmp_name = $_FILES['photo']['tmp_name'];
	$imageSize = $_FILES['photo']['size'];

	$upload_dir ='../fichierImage/photoEleve/';
	$imageExt = strtolower(pathinfo($photo, PATHINFO_EXTENSION));
	$valid_extension=array('jpeg','jpg','png','gif','pdf');
	$pictureEtudiant = rand(1000, 1000000).".".$imageExt;
	move_uploaded_file($file_tmp_name, $upload_dir.$pictureEtudiant);

	$_SESSION['photo'] = $pictureEtudiant;

	// Préparation de la requête pour vérifier si le matricule existe déjà dans la table étudiant
	$q_mat = "SELECT matricule FROM enseignant";
	$params = array();
    $options =  array( "Scrollable" => SQLSRV_CURSOR_KEYSET );
    $stmt = sqlsrv_query( $conn, $q_mat , $params, $options );

    $row_count = sqlsrv_num_rows( $stmt );

    $data = []; // Tableau pour stocker les matricules existants
    for($i = 0; $i < $row_count; $i++){
            $data[] = sqlsrv_fetch_array( $stmt, SQLSRV_FETCH_ASSOC);
        }
    
    foreach ($data as $key => $value) {   
        if ($_POST['matricule'] == implode($value)) {
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
        if ($_POST['matricule'] == implode($value)) {
            $result_con = "True";
        }
    }

	
	if(!(is_numeric($_POST['matricule']))){
		?>
			<script>
				alert("Le matricule entré n'est un numérique.\n Il doit un entier de 5 positions");
				window.location.href=('pagesuperAdmin.php');
			</script>
		<?php
	}
	else{
		if(strlen($_POST['matricule'])!=7){
		?>
			<script>
				alert("Ce matricule n'est pas celui d'un enseignant.\n Il doit un entier de 7 positions");
				window.location.href=('pagesuperAdmin.php');
			</script>
		<?php
		}
		//On lie chaque marqueur à une valeur :
		if ($_POST['statut'] == "-----Choisissez Le statut-----") {
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
					alert("Ce matricule est déjà attribué à un autre enseignant dans la table de connexion.\nmerci de bienvouloir revérifier la saisie");
					window.location.href=('pagesuperAdmin.php');
				</script>
			<?php
		}
		else if($result == "True") {
			?>
				<script>
					alert("Ce matricule est déjà attribué à un autre enseignant.\nmerci de bienvouloir revérifier la saisie");
					window.location.href=('pagesuperAdmin.php');
				</script>
			<?php
			
		}
		else {
			$q = "INSERT INTO enseignant (matricule, statut, nom, prenom,  photo, pwd) VALUES ('".$_POST['matricule']."','".$_POST['statut']."','".$_POST['nom']."','".$_POST['prenom']."','".$pictureEtudiant."','1234567')";

				

				$q_r = sqlsrv_query($conn, $q);
				if ($q_r) {
					$q_connexion = "INSERT INTO connexion (matricule, pwd) values ('".$_POST['matricule']."','1234567')";
					$r_connexion = sqlsrv_query($conn, $q_connexion);
					?>
						<script>
							alert("L'enseignant a été ajouté avec succès");
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