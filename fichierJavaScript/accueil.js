

// jQuery for page scrolling feature - requires jQuery Easing plugin
$(function() {
    $('a.page-scroll').bind('click', function(event) {
        var $anchor = $(this);
        $('html, body').stop().animate({
            scrollTop: $($anchor.attr('href')).offset().top
        }, 1500, 'easeInOutExpo');
        event.preventDefault();
    });
});

// Highlight the top nav as scrolling occurs
$('body').scrollspy({
    target: '.navbar-fixed-top'
})

// Closes the Responsive Menu on Menu Item Click
$('.navbar-collapse ul li a').click(function() {
    $('.navbar-toggle:visible').click();
});

function valideConnexion(){
	var nom = document.getElementById("nom").value;
	var prenom = document.getElementById("prenom").value;
	var profil = document.getElementById("profil").value;
	var erreur = "";

	if (nom == "") {
		erreur = "Merci de bienvouloir saisir votre nom";
	}
	if (prenom == "") {
		erreur = "Merci de bienvouloir saisir votre prenom";
	}

	if (profil == "-----Choisissez votre profil-----") {
		erreur = "Merci de bienvouloir choisir votre profil";
		
	}
	
	if (erreur != "") {
		window.alert(erreur);		
	}

}

function consultation(myRadio){
	if (myRadio.value == 1) {
		document.getElementById('hosp').style.display='block';	
		document.getElementById('hosp1').style.display='block';
		document.getElementById('hosp2').style.display='block';	
	}
	if (myRadio.value == 2) {
		document.getElementById('hosp').style.display='none';	
		document.getElementById('hosp1').style.display='none';
		document.getElementById('hosp2').style.display='none';	
	}
}

function hospitalise(myRadio){
	if (myRadio.value == 1) {
		document.getElementById('durreH').style.display='block';
	}
	if (myRadio.value == 2) {
		document.getElementById('durreH').style.display='none';
	}
}

