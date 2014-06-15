<%
           
            Admin adm = null;
            adm = ((Admin)session.getAttribute("admin"));
            if (adm != null) {
            
            int idAlerte = Integer.parseInt(request.getParameter("idA"));
           		AlerteManager alerteManag = (AlerteManager)context.lookup("AlerteManager"); 
           		Alerte a = alerteManag.rechercherAlerte(idAlerte);
           		
           		if (a != null) { 
           		session.setAttribute("alerte", a);
           	%>
           <table width="668" height="139" align="center">
						    
								<tr>
								<td>
								<form name="formSupression_Alerte" action="sDeleteAlerte_Candidat" method="POST">
                        		<table width="319"  align="center">
                                <tr><td width="148"></td><td width="152"></td>
                                <tr><td></td><td></td>
                        		<tr>
                        			<td colspan="2" align="center" class="txt_1"><br />
                        			Etes-vous s&ucirc;r de vouloir supprimer cette alerte ?<br /><br /></td>
                        		</tr>
                        		<tr>
		                        	
		                        	<td align="center"><input name="confirm" type="submit" value="OUI"/></td>
		                        	<td align="center">
	                        		  <input name="confirm" type="submit" value="NON"/>
		                        		<input name="srcDelete" type="hidden" value="2"/>
		                        	</td>
	                        	</tr>
                        		
                        		</table>
                        		</form>
                        		</td>
                        		</tr>
                        		</table>
            <%}
           		else {
           			//cas ou l'idAlerte a été changé manuellement dans l'url
           			//erreur redirection vers confirmation_message
           			session.setAttribute("okAd", 11);
					response.sendRedirect(response.encodeRedirectURL("admin.jsp?id=25#contenu"));
           		}
            }
           	else {
           		//session expirée
           		response.sendRedirect(response.encodeRedirectURL("admin.jsp"));
           		} %>