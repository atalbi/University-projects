
            <%HttpSession sessionCand = request.getSession();
           	Candidat c = (Candidat)sessionCand.getAttribute("candidat");

           	if (c !=null) {
           		int idAlerte = Integer.parseInt(request.getParameter("idA"));
           		AlerteManager alerteManag = (AlerteManager)context.lookup("AlerteManager"); 
           		Alerte a = alerteManag.rechercherAlerte(idAlerte);
           		
           		if (a != null) { 
           		sessionCand.setAttribute("alerte", a);
           	%>
                
                		<table width="668" height="139" align="center">
								<tr>
								<td>
								<form name="formEdition_Alerte" action="sEditAlerte_Candidat" method="POST">
                        		<table width="500" align="center">
                                <tr align="center">
                                        <td class="txt_1" colspan="3"><b>MODIFICATION ALERTE</b><br /><br /></td>
                                    </tr>
                        		<tr>
		                        	<td width="107" class="txt_1">Mot clé</td>
		                        	<td width="248"><input name="motCle" type="text" class="styleZoneTxt" value="<%=a.getMotcle() %>"/></td>
		                        	<td width="129"><input name="valider" type="submit" value="Modifier"/><input name="srcEdit" type="hidden" value="1"/></td>
	                        	</tr>
                        		
                        		</table>
                        		</form>
                        		</td>
                        		</tr>
                        		</table>
                        
                </div>
                  
            </div>
            <%}
           		else {
           			//cas ou l'idAlerte a été changé manuellement dans l'url
           			//erreur redirection vers confirmation_message
           			session.setAttribute("ok", 5);
					response.sendRedirect(response.encodeRedirectURL("index.jsp?id=19"));
           		}
           	}
           	else {
           		//session expirée
           		response.sendRedirect(response.encodeRedirectURL("index.jsp?id=2&r=1"));
           		
           	} %>
 