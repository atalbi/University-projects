<%
            Admin adm = null;
            adm = ((Admin)session.getAttribute("admin"));
            if (adm != null) {
            
            int idFormation = Integer.parseInt(request.getParameter("idF"));
            	FormationManager formationManag = (FormationManager)context.lookup("FormationManager"); 
            	Formation f = formationManag.rechercherFormation(idFormation);
           		
           		if (f != null) { 
           		session.setAttribute("formation", f);
           	%>
           <table width="668" height="139" align="center">
						   
								<tr>
								<td>
								<form name="formSupression_Formation" action="sDeleteFormation" method="POST">
                        		<table width="348"  align="center">
                        		<tr>
                        			<td colspan="2" align="center" class="txt_1"><br />
                        			Etes-vous s&ucirc;r de vouloir supprimer cette formation ?<br /><br /></td>
                        		</tr>
                        		<tr>
		                        	
		                        	<td width="163" align="center"><input name="confirm" type="submit" value="OUI"/></td>
		                        	<td width="173" align="center">
		                        		<input name="confirm" type="submit" value="NON"/>
	                        	  </td>
	                        	</tr>
                        		
                        		</table>
                        		</form>
                        		</td>
                        		</tr>
                        		</table>
            <%}
           		else {
           			//cas ou l'idFormaion a été changé manuellement dans l'url
           			//erreur redirection vers confirmation_message
           			session.setAttribute("okAd", 19);
					response.sendRedirect(response.encodeRedirectURL("admin.jsp?id=25#contenu"));
           		}
            }
           	else {
           		//session expirée
           		response.sendRedirect(response.encodeRedirectURL("admin.jsp"));
           		} %>