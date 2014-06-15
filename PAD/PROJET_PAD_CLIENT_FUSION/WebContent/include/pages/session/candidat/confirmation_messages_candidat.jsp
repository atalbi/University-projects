<%
HttpSession ses = request.getSession();
int ok = ((Integer)ses.getAttribute("ok")).intValue();
if (ok == 11){%>
		<div align="center" class="error_log_1">Session expirée  !</div>
		<% ses.removeAttribute("ok");
} else if (((Candidat)ses.getAttribute("candidat")) != null) {
		
		if (ok == 2){%>
          	<div align="center" class="info_log_1">Votre candidature a été transmis avec succès au recruteur !</div>
			<% ses.removeAttribute("ok");
		} else if (ok == 3){%>
            <div align="center" class="error_log_1">Erreur lors de l'ajout de l'alerte, assurez-vous qu'un mot clé a bien été indiqué !</div>
			<% ses.removeAttribute("ok");
		} else if (ok == 4){%>
           <div align="center" class="error_log_1">Erreur de modification de l'alerte, assurez-vous que le mot clé  indiqué est valide et n'existe pas encore</div>
			<% ses.removeAttribute("ok");
		} else if (ok == 5){%>
			<div align="center" class="error_log_1">Alerte non trouvée !</div>
            <% ses.removeAttribute("ok");
		} else if (ok == 6){%>
            <div align="center" class="error_log_1">Offre non trouvée !</div>
            <% ses.removeAttribute("ok");
		} else if (ok == 7){%>
			<div align="center" class="error_log_1">Vous avez déjà postulé à cette offre !</div>
			<% ses.removeAttribute("ok");
		} else if (ok == 8){%>
			<div align="center" class="error_log_1">Erreur: le mot clé indiqué a déjà été enregistré pour ce candidat !</div>
			<% ses.removeAttribute("ok");
		} else if (ok == 9){%>
			<div align="center" class="error_log_1">ERREUR : assurez-vous que les champs nom, prénom, email, mot de passe du candidat, sont bien renseignés !</div>
			<% ses.removeAttribute("ok");
		} else if (ok == 10){%>
			<div align="center" class="error_log_1">ERREUR : l'adresse email saisie existe déjà dans la base !</div>
			<% ses.removeAttribute("ok");
		}
}
%>