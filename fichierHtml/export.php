<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body>

	<?php
	include'connexion.php';
	global $dataBase;

	$FileName = "../fichierExport/export.csv";

		

		$output = fopen("../fichierExport/export.csv", "w");

		$export = $dataBase->query("SELECT * FROM `questionnaire` ORDER BY id_quest asc");
		$res_exp = $export->fetch();


		$HeadingsArray = array();
		foreach ($res_exp as $name => $value) {
			
			$HeadingsArray[]=$name;

		}
        
		fputcsv($output, $HeadingsArray);

		while ($res_exp = $export->fetch()) {

			
			$valueArray = array();
			foreach ($res_exp as $name => $value) {
				$valueArray[] = $value;
			}
				print_r($valueArray);
                fputcsv($output, $valueArray);
        }
		
        fclose($output);

        header("Location: $FileName");
	?>
</body>
</html>