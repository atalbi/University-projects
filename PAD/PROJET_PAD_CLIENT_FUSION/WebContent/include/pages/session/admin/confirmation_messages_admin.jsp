<%
		if (((Admin)session.getAttribute("admin")) != null) {
			int ok = ((Integer)session.getAttribute("okAd")).intValue();
			
			if (ok == 1){%>
				<div align="center" class="info_log_1">Le profil administrateur a �t� cr�� avec succ�s !</div>
	        <% session.removeAttribute("okAd");
			}
			else if (ok == 0){%>
				<div align="center" class="error_log_1">Veuillez indiqu� un login et un mot de passe !</div>
			<% session.removeAttribute("okAd");
			}
			else if (ok == 2){%>
			   <div align="center" class="error_log_1">Le login indiqu� existe d�j� dans la base !</div>
	        <% 
			session.removeAttribute("okAd");
			}
			else if (ok == 3){%>
				<div align="center" class="error_log_1">Profil non trouv� !</div>
	        <% 
			session.removeAttribute("okAd");
			}
			else if (ok == 4){%>
				<div align="center" class="info_log_1">Compte supprim� avec succ�s !</div>
	       	<% 
			session.removeAttribute("okAd");
			}
			else if (ok == 5){%>
		      	<div align="center" class="error_log_1">Erreur : le compte n'a pu �tre suprim� !</div>
	        <% 
			session.removeAttribute("okAd");
			}
			else if (ok == 6){%>
	      	<div align="center" class="error_log_1">Erreur : Ce compte ne peut �tre supprim� car il s'agit d'un super administrateur !</div>
		    <% 
			session.removeAttribute("okAd");
			}
			else if (ok == 7){%>
	      	<div align="center" class="error_log_1">Erreur : Veuillez indiquer le libell� de la formation !</div>
		    <% 
			session.removeAttribute("okAd");
			}
			else if (ok == 8){%>
	      	<div align="center" class="error_log_1">Erreur: cette formation existe d�j� dans la base !</div>
		    <% 
			session.removeAttribute("okAd");
			}
			else if (ok == 9){%>
	      	<div align="center" class="error_log_1">Erreur: le mot cl� saisi a d�j� �t� enregistr� pour le candidat indiqu� !</div>
		    <% 
			session.removeAttribute("okAd");
			}
			else if (ok == 10){%>
	      	<div align="center" class="error_log_1">Erreur: veuillez indiquer un mot cl� et le candidat correspondant !</div>
		    <% 
			session.removeAttribute("okAd");
			}
		
			else { %>
				<%@include file="suite_confirmation_messages_admin.jsp" %>
			<%
			}
		}
		
		else {
			//session expir�e
				response.sendRedirect(response.encodeRedirectURL("admin.jsp"));
		}
		%>