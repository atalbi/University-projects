<%
HttpSession ses = request.getSession();
int ok = ((Integer)ses.getAttribute("ok")).intValue();
if (ok == 11){%>
		<div align="center" class="error_log_1">Session expir�e  !</div>
		<% ses.removeAttribute("ok");
} else if (((Candidat)ses.getAttribute("candidat")) != null) {
		
		if (ok == 2){%>
          	<div align="center" class="info_log_1">Votre candidature a �t� transmis avec succ�s au recruteur !</div>
			<% ses.removeAttribute("ok");
		} else if (ok == 3){%>
            <div align="center" class="error_log_1">Erreur lors de l'ajout de l'alerte, assurez-vous qu'un mot cl� a bien �t� indiqu� !</div>
			<% ses.removeAttribute("ok");
		} else if (ok == 4){%>
           <div align="center" class="error_log_1">Erreur de modification de l'alerte, assurez-vous que le mot cl�  indiqu� est valide et n'existe pas encore</div>
			<% ses.removeAttribute("ok");
		} else if (ok == 5){%>
			<div align="center" class="error_log_1">Alerte non trouv�e !</div>
            <% ses.removeAttribute("ok");
		} else if (ok == 6){%>
            <div align="center" class="error_log_1">Offre non trouv�e !</div>
            <% ses.removeAttribute("ok");
		} else if (ok == 7){%>
			<div align="center" class="error_log_1">Vous avez d�j� postul� � cette offre !</div>
			<% ses.removeAttribute("ok");
		} else if (ok == 8){%>
			<div align="center" class="error_log_1">Erreur: le mot cl� indiqu� a d�j� �t� enregistr� pour ce candidat !</div>
			<% ses.removeAttribute("ok");
		} else if (ok == 9){%>
			<div align="center" class="error_log_1">ERREUR : assurez-vous que les champs nom, pr�nom, email, mot de passe du candidat, sont bien renseign�s !</div>
			<% ses.removeAttribute("ok");
		} else if (ok == 10){%>
			<div align="center" class="error_log_1">ERREUR : l'adresse email saisie existe d�j� dans la base !</div>
			<% ses.removeAttribute("ok");
		}
}
%>