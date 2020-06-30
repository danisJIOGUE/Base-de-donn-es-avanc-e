<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body>

	<?php
		if ( isset( $_POST["Submit"] ) )
		{
			//verifier si les paramètres saisies existent dans la base 
			$query = "SELECT * FROM connexion WHERE matricule = '".$_POST["matricule"]."'";
			$res = sqlsrv_query($conn,$query);
			

			if ($res === false) 
			{
				?>
			        <script>
			            alert("Le Matricule entré doit être un entier avec un nombre de carctères bien spécifié.\n Merci de recharger la page.");
			                </script>
			            <?php
				die( print_r( sqlsrv_errors(), true));
			}
			else
			{
				if(strlen($_POST['matricule']) == 5){
					while ($ligne = sqlsrv_fetch_array($res)) 
					{
					    $_SESSION['matriculeEtudiant'] = $ligne['matricule'];
					    $matricule = $ligne['matricule'];
					    $passe = $ligne['pwd'];
					    $date = $ligne['date_connexion'];
					    $profil = $ligne['profil'];
					}
					// var_dump($ligne);
					if ($profil == "SIMPLE") {//Connexion d'un simple étudiant
						if ((isset($_POST['pwd'])) && !(empty($date))){
							if(password_verify($_POST['pwd'], $passe)){	
								if(isset($_SESSION['matriculeEtudiant'])){
									if (strlen($_SESSION['matriculeEtudiant']) > 0) //test si cette variable n'est pas vide
									{
									    //Rediriger automatiquement l'utilisateur vers la page d'accueil (index.php)
									    // echo "infos correct";
									    ?>
							                <script>
							                    window.location.href=('fichierHtml/pageEleve.php');
							                </script>
							            <?php
									}
								}
								else
								{
									//Le login et le mot de passe saisies n'exitent pas dans la table UTILISATEUR.
									//afficher un message à l'utilisateur
									?>
						                <script>
						                    alert("Les informations renseignées sont incorrectes.\n Merci de bienvouloir recommencer l'opération");
						                </script>
						            <?php
								}
							}
							else     //mot de passe après hashage incorrect
				            {
				                ?>
				                    <script>
				                        alert("Votre mot de passe ne correspond avec celui de la dernière modification");
				                    </script>
				                <?php
				            }
			            }
			            else{  // L'étudiant ne s'est jamais connecté donc pwd non hashé : vérification traditionnelle
			            	if(isset($matricule)){
								if (isset($_POST['pwd']) && ($_POST['pwd'] == $passe)) {
					            	?>
									    <script>
										    window.location.href=('fichierHtml/pageEleve.php');
									    </script>
									<?php
					            }	
					            else{
					            	?>
								        <script>
								            alert('Le mot de passe renseigné ne correspond pas');
								        </script>
								    <?php
					            }
							}
							else{
								?>
									<script>
									    alert('Le matricule non exitant');
									</script>
								<?php
							}
			            }
					}
					else if ($profil == "DELEGUE") {//Connexion des étudiants délégués
						if ((isset($_POST['pwd'])) && !(empty($date))){
							if(password_verify($_POST['pwd'], $passe)){	
								if(isset($_SESSION['matriculeEtudiant'])){
									if (strlen($_SESSION['matriculeEtudiant']) > 0) //test si cette variable n'est pas vide
									{
									    //Rediriger automatiquement l'utilisateur vers la page d'accueil (index.php)
									    // echo "infos correct";
									    ?>
							                <script>
							                    window.location.href=('fichierHtml/pageEleveDelegue.php');
							                </script>
							            <?php
									}
								}
								else
								{
									//Le login et le mot de passe saisies n'exitent pas dans la table UTILISATEUR.
									//afficher un message à l'utilisateur
									?>
						                <script>
						                    alert("Les informations renseignées sont incorrectes.\n Merci de bienvouloir recommencer l'opération");
						                </script>
						            <?php
								}
							}
							else     //mot de passe après hashage incorrect
				            {
				                ?>
				                    <script>
				                        alert("Votre mot de passe ne correspond avec celui de la dernière modification");
				                    </script>
				                <?php
				            }
			            }
			            else{  // L'étudiant ne s'est jamais connecté donc pwd non hashé : vérification traditionnelle
			            	if(isset($matricule)){
								if (isset($_POST['pwd']) && ($_POST['pwd'] == $passe)) {
					            	?>
									    <script>
										    window.location.href=('fichierHtml/pageEleveDelegue.php');
									    </script>
									<?php
					            }	
					            else{
					            	?>
								        <script>
								            alert('Le mot de passe renseigné ne correspond pas');
								        </script>
								    <?php
					            }
							}
							else{
								?>
									<script>
									    alert('Le matricule non exitant');
									</script>
								<?php
							}
			            }
					}
					else{
						?>
							<script type="text/javascript">alert("Une erreur est survenue lors de votre identification.\n Profil non repertorié. bienvouloir reprendre l'opération.");</script>
						<?php
					}
								
				}
				else if(strlen($_POST['matricule']) == 6){
					while ($ligneR = sqlsrv_fetch_array($res)) 
					{
					    $_SESSION['matriculeResponsable'] = $ligneR['matricule'];
					    $passeR = $ligneR['pwd'];
					    $dateR = $ligneR['date_connexion'];
					    $matriculeR = $ligneR['matricule'];
					    $profilR = $ligneR['profil'];
					}

					if ($profilR == "SIMPLE") {//Connexion des simples responsables
						if ((isset($_POST['pwd'])) && !(empty($dateR))){
							if(password_verify($_POST['pwd'], $passeR)){	
								if(isset($_SESSION['matriculeResponsable'])){
									if (strlen($_SESSION['matriculeResponsable']) > 0) //test si cette variable n'est pas vide
									{
									    //Rediriger automatiquement l'utilisateur vers la page d'accueil (index.php)
									    // echo "infos correct";
									    ?>
							                <script>
							                    window.location.href=('fichierHtml/pageResponsableChef.php');
							                </script>
							            <?php
									}
								}
								else
								{
									//Le login et le mot de passe saisies n'exitent pas dans la table UTILISATEUR.
									//afficher un message à l'utilisateur
									?>
						                <script>
						                    alert("Les informations renseignées sont incorrectes.\n Merci de bienvouloir recommencer l'opération");
						                </script>
						            <?php
								}
							}
							else     //mot de passe après hashage incorrect
				            {
				                ?>
				                    <script>
				                        alert("Votre mot de passe ne correspond avec celui de la dernière modification");
				                    </script>
				                <?php
				            }
			            }
			            else{  // Le Responsable ne s'est jamais connecté donc pwd non hashé : vérification traditionnelle
			            	if (isset($matriculeR)) {
			            		if (isset($_POST['pwd']) && ($_POST['pwd'] == $passeR)) {
				            		?>
								        <script>
								            window.location.href=('fichierHtml/pageResponsableChef.php');
								        </script>
								    <?php
				            	}
				            	else{
				            		?>
								        <script>
								            alert('Le mot de passe renseigné ne correspond pas');
								        </script>
								    <?php
				            	}
			            	}
			            	else{
			            		?>
									<script>
									    alert('Le matricule non exitant');
									</script>
								<?php
			            	}
			            }
					}
					else if($profilR == "CHEF"){ // Connexion des chefs de filières
						if ((isset($_POST['pwd'])) && !(empty($dateR))){
							if(password_verify($_POST['pwd'], $passeR)){	
								if(isset($_SESSION['matriculeResponsable'])){
									if (strlen($_SESSION['matriculeResponsable']) > 0) //test si cette variable n'est pas vide
									{
									    //Rediriger automatiquement l'utilisateur vers la page d'accueil (index.php)
									    // echo "infos correct";
									    ?>
							                <script>
							                    window.location.href=('fichierHtml/pagesuperAdmin.php');
							                </script>
							            <?php
									}
								}
								else
								{
									//Le login et le mot de passe saisies n'exitent pas dans la table UTILISATEUR.
									//afficher un message à l'utilisateur
									?>
						                <script>
						                    alert("Les informations renseignées sont incorrectes.\n Merci de bienvouloir recommencer l'opération");
						                </script>
						            <?php
								}
							}
							else     //mot de passe après hashage incorrect
				            {
				                ?>
				                    <script>
				                        alert("Votre mot de passe ne correspond avec celui de la dernière modification");
				                    </script>
				                <?php
				            }
			            }
			            else{  // Le Responsable ne s'est jamais connecté donc pwd non hashé : vérification traditionnelle
			            	if (isset($matriculeR)) {
			            		if (isset($_POST['pwd']) && ($_POST['pwd'] == $passeR)) {
				            		?>
								        <script>
								            window.location.href=('fichierHtml/pagesuperAdmin.php');
								        </script>
								    <?php
				            	}
				            	else{
				            		?>
								        <script>
								            alert('Le mot de passe renseigné ne correspond pas');
								        </script>
								    <?php
				            	}
			            	}
			            	else{
			            		?>
									<script>
									    alert('Le matricule non exitant');
									</script>
								<?php
			            	}
			            }
					}
					else{
						?>
							<script type="text/javascript">alert("Une erreur est survenue lors de votre identification.\n Profil non repertorié. bienvouloir reprendre l'opération.");</script>
						<?php
					}
					
				}
				else if (strlen($_POST['matricule']) == 7) {
					while ($ligneE = sqlsrv_fetch_array($res)) 
					{
					    $_SESSION['matriculeEnseignant'] = $ligneE['matricule'];
					    $passeE = $ligneE['pwd'];
					    $dateE = $ligneE['date_connexion'];
					    $matriculeE = $ligneE['matricule'];
					    $profilE = $ligneE['profil'];
					}
					if ((isset($_POST['pwd'])) && !(empty($dateE))){
						if(password_verify($_POST['pwd'], $passeE)){	
							if(isset($_SESSION['matriculeEnseignant'])){
								if (strlen($_SESSION['matriculeEnseignant']) > 0) //test si cette variable n'est pas vide
								{
								    ?>
							            <script>
							                window.location.href=('fichierHtml/pageEnseignant.php');
							            </script>
							        <?php
								}
							}
							else
							{
								//Le login et le mot de passe saisies n'exitent pas dans la table UTILISATEUR.
								//afficher un message à l'utilisateur
								?>
						            <script>
						                alert("Les informations renseignées sont incorrectes.\n Merci de bienvouloir recommencer l'opération");
						            </script>
						        <?php
							}
						}
						else     //mot de passe après hashage incorrect
				        {
				            ?>
				                <script>
				                    alert("Votre mot de passe ne correspond avec celui de la dernière modification");
				                </script>
				            <?php
				        }
			        }
			        else{  // L'enseignant ne s'est jamais connecté donc pwd non hashé : vérification traditionnelle
			          	if (isset($matriculeE)) {
			          		if (isset($_POST['pwd']) && ($_POST['pwd'] == $passeE)) {
				          		?>
							        <script>
							            window.location.href=('fichierHtml/pageEnseignant.php');
							        </script>
							    <?php
				           	}
				           	else{
				           		?>
							        <script>
							            alert('Le mot de passe renseigné ne correspond pas');
							        </script>
							    <?php
				           	}
			           	}
			           	else{
			           		?>
								<script>
								    alert('Le matricule non exitant');
								</script>
							<?php
			           	}
			        }
				}
			}
		}
	?>
</body>
</html>