$(function(){
	$("#form_createProfilSoc").submit(function(){
		$("#sp_RS").html("");
		$("#sp_email").html("");
		$("#sp_pass").html("");
		
		if($("#raiSoc").val() == ""){
				$("#sp_RS").html("<img src=\"images/interdit.png\"> champ vide");
				valide = false;
				return false;
		}
			if($("#prenomCandid").val() == ""){
				$("#sp_prenom").html("<img src=\"images/interdit.png\"> champ vide");
				valide = false;
				return false;
			}
			if($("#emailSoc").val() == ""){
				$("#sp_email").html("<img src=\"images/interdit.png\"> champ vide");
				valide = false;
				return false;
			}
			
			if(isValidEmailAddress($("#emailSoc").val()) == false){
				$("#sp_email").html("<img src=\"images/interdit.png\"> email invalide");
				valide = false;
				return false;
			}
			if($("#passwordSoc").val() == ""){
				$("#sp_pass").html("<img src=\"images/interdit.png\"> champ vide");
				valide = false;
				return false;
			}
			
		var emails =  $("#emailSoc").val();
		$.get("include/pages/session/societe/controle_societe.jsp",{id:1,email:emails}, function(data){
			if(data.indexOf("true") > 0){
				$("#sp_email").html("<img src=\"images/interdit.png\"> email dèjà utilisé");
				valide = false;
				return false;
			}
		});
		var raiSoc =  $("#raiSoc").val();
		$.get("include/pages/session/societe/controle_societe.jsp",{id:2,RS:raiSoc}, function(data){
			if(data.indexOf("true") > 0){
				$("#sp_RS").html("<img src=\"images/interdit.png\"> Raison sociale existe dèjà");
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