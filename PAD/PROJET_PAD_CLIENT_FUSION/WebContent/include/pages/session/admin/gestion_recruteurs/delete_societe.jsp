 <%
            Admin adm = null;
            adm = ((Admin)session.getAttribute("admin"));
            
            if (adm != null) {
            
            	int idS = Integer.parseInt(request.getParameter("idS"));
           		SocieteManager societeManag = (SocieteManager)context.lookup("SocieteManager"); 
           		Societe s = societeManag.rechercherSociete(idS);
           		
           		if (s != null) { 
           		session.setAttribute("societe", s);
            %>
            
                <table width="668" height="139" align="center">
						    
								<tr>
								<td>
								<form name="formSupression_Societe" action="sDeleteSociete" method="POST">
                        		<table width="333"  align="center">
                        		<tr><td></td><td></td>
                                <tr><td></td><td></td>
                        		<tr>
                        			<td colspan="2" class="txt_1" align="center"><br />Etes-vous sûr de vouloir supprimer ce recruteur ?<br /><br /></td>
                        		</tr>
                        		<tr>
		                        	
		                        	<td width="149" align="center"><input name="confirm" type="submit" value="OUI"/></td>
		                        	<td width="144" align="center">
		                        		<input name="confirm" type="submit" value="NON"/>
		                        		
	                        	  </td>
	                        	</tr>
                        		
                        		</table>
                                <input name="srcDelete" type="hidden" value="2"/>
                        		</form>
                        		</td>
                        		</tr>
                				</table>

            <%
           		}
           		else {
           			//cas ou l'idSociete a été changé manuellement dans l'url
           			//erreur redirection vers confirmation_message
           			session.setAttribute("okAd", 15);
					response.sendRedirect(response.encodeRedirectURL("admin.jsp?id=25#contenu"));
           		}
            }
           	else {
           		//session expirée
           		response.sendRedirect(response.encodeRedirectURL("admin.jsp"));
           		} %>