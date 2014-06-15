<%
           
            Admin a = null;
            a = ((Admin)session.getAttribute("admin"));
            if (a != null) {
            
            FormationManager formationManag  = (FormationManager)context.lookup("FormationManager");
            
            	int idF = Integer.parseInt(request.getParameter("idF"));
            	
            	if (!request.getParameter("idF").equals("")  && 
            			formationManag.rechercherFormation(idF) != null ) { //verfie si la formation existe
            			
            		Formation formation_a_modifier = formationManag.rechercherFormation(idF);
            		session.setAttribute("formation_a_modifier",formation_a_modifier);
            %>
            <table width="668" height="139" align="center">
						    
								<tr>
								<td>
								<form name="formEdition_Formation" action="sEditFormation" method="POST">
                        		<table width="435" align="center">
                                <tr align="center">
                                        <td class="txt_1" colspan="2"><br /><b>MODIFICATION FORMATION</b><br /><br /></td>
                                    </tr>
                                <tr><td width="235"></td><td width="205"></td></tr>
                            <tr><td></td><td></td></tr>
                            <tr><td></td><td></td></tr>
                        		<tr>
		                        	<td class="txt_1">Libell&eacute; de la formation</td>
		                        	<td><input name="libelleFormation" type="text" class="styleZoneTxt" value="<%=formation_a_modifier.getLibelleFormation() %>"/></td>
                                    </tr>					    								
                                    <tr><td></td><td></td></tr>
                        		<tr align="center">
                                	<td colspan="2"><input name="valider" type="submit" value="Valider"/></td>
                                </tr>
                        		</table>
                        		</form>
                        		</td>
                        		</tr>
                        		</table>
            <%}
           		else {
           			//cas ou l'idFormation a été changé manuellement dans l'url
           			//erreur redirection vers confirmation_message
           			session.setAttribute("okAd", 19);
					response.sendRedirect(response.encodeRedirectURL("admin.jsp?id=25#contenu"));
           		}
           	}
           	else {
           		//session expirée
           		response.sendRedirect(response.encodeRedirectURL("admin.jsp"));
           		} %>
 