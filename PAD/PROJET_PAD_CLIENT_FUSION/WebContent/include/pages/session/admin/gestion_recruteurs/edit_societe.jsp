
            <%
            Admin adm = null;
            adm = ((Admin)session.getAttribute("admin"));
            
            if (adm != null) {
            
            	int idS = Integer.parseInt(request.getParameter("idS"));
           		SocieteManager societeManag = (SocieteManager)context.lookup("SocieteManager"); 
           		Societe s = societeManag.rechercherSociete(idS);
           		
           		if (s != null) { 
            %>
            
                <table width="668" height="139" align="center">
						   					    
								<tr>
								<td>
								<form name="formEdit_Societe" action="sEditSociete" method="POST">
                        		<table  align="center">
                        		<tr align="center">
                                        <td class="txt_1" colspan="2"><br /><b>MODIFICATION PROFIL RECRUTEUR</b><br /><br /></td>
                                    </tr>
                           		<tr> 
                                	<td class="txt_1">Raison sociale</td>
		                        	<td>
		                        		<input name="nomSociete" type="text" value="<%=s.getRaisonSocial() %>" class="styleZoneTxt"/>
		                        	</td>
	                        	</tr>
	                        	<tr>
	                        		<td class="txt_1">Login</td>
		                        	<td>
		                        		<input name="loginSociete" type="text" value="<%=s.getLogin() %>" class="styleZoneTxt"/>
		                        	</td>
	                        	</tr>
	                        	<tr>
	                        		<td class="txt_1">Mot de passe</td>
		                        	<td>
		                        		<input name="passwordSociete" type="password" value="<%=s.getPassword() %>" class="styleZoneTxt"/>
		                        	</td>
	                        	</tr>
	                        	<tr>
	                        		<td class="txt_1">Télephone</td>
		                        	<td>
		                        		<input name="telSociete" class="styleZoneTxt" type="text" value="<% if (s.getTel() != null){%><%=s.getTel() %> <%} else {%> <% }%>"/>
		                        	</td>
	                        	</tr>
	                        	<tr>
	                        		<td class="txt_1">Valide</td>
		                        	<td>
		                        		<input name="valideSociete" type="text" value="<%=s.getValide() %>" class="styleZoneTxt"/>
		                        	</td>
	                        	</tr>
	                        	<tr>
	                        		<td class="txt_1">Adresse : </td>
		                        	<td>
		                        		<textarea cols="40" rows="2" name="adresseSociete"><% if (s.getAdresse() != null){%><%=s.getAdresse() %> <%} else {%><% }%></textarea>
		                        	</td>
	                        	</tr>
	                        	<tr>
	                        		<td class="txt_1">Description</td>
		                        	<td>
		                        		<textarea cols="40" rows="3" name="descriptionSociete"><% if (s.getDescription() != null){%> <%=s.getDescription() %><% } else {%><% }%></textarea>
		                        		
		                        	</td>
	                        	</tr>
	                        	
                        		<tr>
		                        	<td colspan="2" align="center">
		                        		<input name="valider" type="submit" value="Valider"/>
		                        		
		                        	</td>
	                        	</tr>
                        		<input name="idSociete" type="hidden" value="<%=s.getIdsociete() %>"/>
                        		<input name="srcEdit" value="2" type="hidden"/>
                        		</table>
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
					response.sendRedirect(response.encodeRedirectURL("admin.jsp?id=25"));
           		}
            }
           	else {
           		//session expirée
           		response.sendRedirect(response.encodeRedirectURL("admin.jsp?"));
           		} %>