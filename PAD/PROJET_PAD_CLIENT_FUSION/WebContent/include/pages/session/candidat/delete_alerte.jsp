
                <%HttpSession sessionCand = request.getSession();
           	Candidat c = (Candidat)sessionCand.getAttribute("candidat");
           
           	int idAlerte = Integer.parseInt(request.getParameter("idA"));
           	
           	           	
           	if (c !=null) {
           		AlerteManager alerteManag = (AlerteManager)context.lookup("AlerteManager"); 
           		Alerte a = alerteManag.rechercherAlerte(idAlerte);
           		
           		if (a != null) { 
           		sessionCand.setAttribute("alerte", a);
           	%>			<br/>
                		<table width="668" height="139" align="center">
						   
						    
								<tr>
								<td>
								<form name="formSupression_Alerte" action="sDeleteAlerte_Candidat" method="POST">
                        		<table  align="center">
                        		<tr>
                        			<td colspan="2" class="txt_1">Etes-vous sûr de vouloir supprimer cette alerte ?<br/>
                        			  <br/></td>
                        		</tr>
                        		<tr>
		                        	
		                        	<td align="center"><input name="confirm" type="submit" value="OUI"/></td>
	                        	  <td align="center"><input name="confirm" type="submit" value="NON"/><input name="srcDelete" type="hidden" value="1"/></td>
	                        	</tr>
                        		
                        		</table>
                        		</form>
                        		</td>
                        		</tr>
                        		</table>
                
                        
	                        <table>
	                        
	                        
	                        
	                        </table> 
                      
            <%}
           		else {
           			//cas ou l'idAlerte a été changé manuellement dans l'url
           			//erreur redirection vers confirmation_message
           			session.setAttribute("ok", 5);
					response.sendRedirect(response.encodeRedirectURL("index.jsp?id=19#contenu"));
           		}
           	}
        	else {
           		//session expirée
           		session.setAttribute("ok", 11);
				response.sendRedirect(response.encodeRedirectURL("index.jsp?id=19#contenu"));
           		} %>
 