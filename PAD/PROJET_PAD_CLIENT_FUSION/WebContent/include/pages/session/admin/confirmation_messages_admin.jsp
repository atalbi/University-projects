<%
		if (((Admin)session.getAttribute("admin")) != null) {
			int ok = ((Integer)session.getAttribute("okAd")).intValue();
			
			if (ok == 1){%>
				<div align="center" class="info_log_1">Le profil administrateur a été créé avec succès !</div>
	        <% session.removeAttribute("okAd");
			}
			else if (ok == 0){%>
				<div align="center" class="error_log_1">Veuillez indiqué un login et un mot de passe !</div>
			<% session.removeAttribute("okAd");
			}
			else if (ok == 2){%>
			   <div align="center" class="error_log_1">Le login indiqué existe déjà dans la base !</div>
	        <% 
			session.removeAttribute("okAd");
			}
			else if (ok == 3){%>
				<div align="center" class="error_log_1">Profil non trouvé !</div>
	        <% 
			session.removeAttribute("okAd");
			}
			else if (ok == 4){%>
				<div align="center" class="info_log_1">Compte supprimé avec succès !</div>
	       	<% 
			session.removeAttribute("okAd");
			}
			else if (ok == 5){%>
		      	<div align="center" class="error_log_1">Erreur : le compte n'a pu être suprimé !</div>
	        <% 
			session.removeAttribute("okAd");
			}
			else if (ok == 6){%>
	      	<div align="center" class="error_log_1">Erreur : Ce compte ne peut être supprimé car il s'agit d'un super administrateur !</div>
		    <% 
			session.removeAttribute("okAd");
			}
			else if (ok == 7){%>
	      	<div align="center" class="error_log_1">Erreur : Veuillez indiquer le libellé de la formation !</div>
		    <% 
			session.removeAttribute("okAd");
			}
			else if (ok == 8){%>
	      	<div align="center" class="error_log_1">Erreur: cette formation existe déjà dans la base !</div>
		    <% 
			session.removeAttribute("okAd");
			}
			else if (ok == 9){%>
	      	<div align="center" class="error_log_1">Erreur: le mot clé saisi a déjà été enregistré pour le candidat indiqué !</div>
		    <% 
			session.removeAttribute("okAd");
			}
			else if (ok == 10){%>
	      	<div align="center" class="error_log_1">Erreur: veuillez indiquer un mot clé et le candidat correspondant !</div>
		    <% 
			session.removeAttribute("okAd");
			}
		
			else { %>
				<%@include file="suite_confirmation_messages_admin.jsp" %>
			<%
			}
		}
		
		else {
			//session expirée
				response.sendRedirect(response.encodeRedirectURL("admin.jsp"));
		}
		%>