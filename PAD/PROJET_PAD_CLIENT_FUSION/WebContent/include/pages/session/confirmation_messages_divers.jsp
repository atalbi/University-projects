<%
HttpSession ses = request.getSession();
int ok = ((Integer)ses.getAttribute("ok")).intValue();
if (ok == 1) { 
	ses.removeAttribute("ok");%>

<div align="center" class="info_log_1">Votre profil a bien créée avec succès.Vous pouvez vous logger à présent pour l'éditer !</div>

<% 
ses.removeAttribute("ok");
}
else if (ok == 0){%>
<div align="center" class="error_log_1">Erreur création profil:  assurez-vous que tous les champs sont bien remplis</div>
<% 
ses.removeAttribute("ok");
}

else if (ok == 2){%>
<div align="center" class="error_log_1">Erreur création profil:  l'email indiqué existe déjà !</div>
<% 
ses.removeAttribute("ok");
}

else if (ok == 3){%>
<div align="center" class="error_log_1">Erreur création profil:  ce candidat existe déjà dans la base de donnée !</div>
<% 
ses.removeAttribute("ok");
}

else if (ok == 4){%>
<div align="center" class="error_log_1">Erreur connexion: veuillez indiquer votre login et votre mot de passe !</div>
<% 
ses.removeAttribute("ok");
}

else if (ok == 5){%>
<div align="center" class="info_log_1">Votre compte a été bien supprimé !</div>
<% 
ses.removeAttribute("ok");
}
%>