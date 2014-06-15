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
								<form name="formEdition_Alerte" action="sEditAlerte_Candidat" method="POST">
                        		<table width="412" align="center">
                                <tr align="center">
                                        <td class="txt_1" colspan="2"><br /><b>MODIFICATION ALERTE</b><br /><br /></td>
                                    </tr>
                        		<tr>
		                        	<td class="txt_1">Mot clé </td>
		                        	<td><input name="motCle" class="styleZoneTxt" type="text" value="<%=a.getMotcle() %>"/></td>
	                        	</tr>
	                        	
	                        	<tr>
		                        	<td class="txt_1">Candidat </td>
		                        	<td>
										<select name="candidat" style="width: 160px">
											<%
                                    CandidatManager candManag = (CandidatManager) context.lookup("CandidatManager");
                              	   ArrayList<Candidat> listCand = candManag.listeCandidat();
                              	   
                                    	
                                    for(Candidat c: listCand){
                                    %>
                        			<option value="<%=c.getIdcandidat() %>" <% if (c.getIdcandidat() == a.getIdcandidat().getIdcandidat()) {%>selected="selected"<%} %> >
                        				<%=c.getNom() %> <%=c.getPrenom() %>
                        			</option>
                        			<%} %>
										</select>
									</td>
	                        	</tr>
	                        	
	                        	<tr align="center">
	                        		<td colspan="2">
		                        		<input name="valider" type="submit" value="Modifier"/>
		                        		<input name="srcEdit" type="hidden" value="2"/>
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