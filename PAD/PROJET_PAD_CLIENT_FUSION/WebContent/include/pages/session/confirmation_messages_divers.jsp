<%
HttpSession ses = request.getSession();
int ok = ((Integer)ses.getAttribute("ok")).intValue();
if (ok == 1) { 
	ses.removeAttribute("ok");%>

<div align="center" class="info_log_1">Votre profil a bien cr��e avec succ�s.Vous pouvez vous logger � pr�sent pour l'�diter !</div>

<% 
ses.removeAttribute("ok");
}
else if (ok == 0){%>
<div align="center" class="error_log_1">Erreur cr�ation profil:  assurez-vous que tous les champs sont bien remplis</div>
<% 
ses.removeAttribute("ok");
}

else if (ok == 2){%>
<div align="center" class="error_log_1">Erreur cr�ation profil:  l'email indiqu� existe d�j� !</div>
<% 
ses.removeAttribute("ok");
}

else if (ok == 3){%>
<div align="center" class="error_log_1">Erreur cr�ation profil:  ce candidat existe d�j� dans la base de donn�e !</div>
<% 
ses.removeAttribute("ok");
}

else if (ok == 4){%>
<div align="center" class="error_log_1">Erreur connexion: veuillez indiquer votre login et votre mot de passe !</div>
<% 
ses.removeAttribute("ok");
}

else if (ok == 5){%>
<div align="center" class="info_log_1">Votre compte a �t� bien supprim� !</div>
<% 
ses.removeAttribute("ok");
}
%>