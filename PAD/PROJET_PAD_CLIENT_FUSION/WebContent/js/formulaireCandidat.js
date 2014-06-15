$(function(){
	$("#form_createProfilCand").submit(function(){
		$("#sp_nom").html("");
		$("#sp_prenom").html("");
		$("#sp_email").html("");
		$("#sp_pass").html("");
		if($("#nomCandid").val() == ""){
				$("#sp_nom").html("<img src=\"images/interdit.png\"> champ vide");
				valide = false;
				return false;
			}
			if($("#prenomCandid").val() == ""){
				$("#sp_prenom").html("<img src=\"images/interdit.png\"> champ vide");
				valide = false;
				return false;
			}
			if($("#emailCandid").val() == ""){
				$("#sp_email").html("<img src=\"images/interdit.png\"> champ vide");
				valide = false;
				return false;
			}
			
			if(isValidEmailAddress($("#emailCandid").val()) == false){
				$("#sp_email").html("<img src=\"images/interdit.png\"> email invalide");
				valide = false;
				return false;
			}
			if($("#passwordCandid").val() == ""){
				$("#sp_pass").html("<img src=\"images/interdit.png\"> champ vide");
				valide = false;
				return false;
			}
			
		var emails =  $("#emailCandid").val();
		$.get("include/pages/session/candidat/controle_candidat.jsp",{email:emails}, function(data){
			if(data.indexOf("true") > 0){
				$("#sp_email").html("<img src=\"images/interdit.png\"> email existe dèjà");
				valide = false;
				return false;
			}
		});
		return valide;
	});
	
	function isValidEmailAddress(emailAddress) {
         var pattern = new RegExp(/^(("[\w-\s]+")|([\w-]+(?:\.[\w-]+)*)|("[\w-\s]+")([\w-]+(?:\.[\w-]+)*))(@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$)|(@\[?((25[0-5]\.|2[0-4][0-9]\.|1[0-9]{2}\.|[0-9]{1,2}\.))((25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\.){2}(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\]?$)/i);
         return pattern.test(emailAddress);
    }
});