var validation = document.getElementById("valideAjout");
var nomEtd = document.getElementById("nomEtudiant");
var nomManquant = document.getElementById("nom_manquant");
var nom_v = /^[a-zA-ZéèiìÈÊ][a-zéèiì]+([-'/s][a-zA-ZéèiìÈ][a-zéèiì])?/;

var prenomEtd = document.getElementById("prenomEtudiant");
var prenom_manquant = document.getElementById("prenom_manquant");

var dateNaiss = document.getElementById("DateNaissanceEtudiant");
var DateNaiss_manquant = document.getElementById("DateNaiss_manquant");
regex = /^([0-2][0-9]|(3)[0-1])(\/)(((0)[0-9])|((1)[0-2]))(\/)\d{4}$/

var matriculeEtd = document.getElementById("matriculeEtudiant");
var nationalite_manquant = document.getElementById("");

var classeEtd = document.getElementById("classeEtudiant");
var classe_manquant = document.getElementById("classe_manquant");

var erreurAjout = "";

validation.addEventListener('click', fun_valide)
function fun_valide(e){ //l'argument va permettre d'utiliser prevent defaut pour emp^cher l'envoie en cas d'erruer
	if(nomEtd.validity.valueMissing){
		e.preventDefault();	
		nom_manquant.textContent = 'Nom manquant';
		nom_manquant.style.color = 'red';
	}else if(nom_v.test(prenom.value) == false)	{
		even.preventDefault;
		nom_manquant.textContent = 'Format Incorrect';
		nom_manquant.style.color = 'orange';
	}

	if(regex.test(dateNaiss)){

	}
	else{
		alert("Le Format de date de la date de naissance non correcte : dd/mm/yyyy");
	}
	if (lenght(matriculeEtd)!=5) {
		alert("Le matricule de l'étudiant est sur 5 caractère :\n année d'entrée 2 position filière 1 position numéro sur la liste 2 position");
	}
}