<%
            Admin adm = null;
            adm = ((Admin)session.getAttribute("admin"));
            
            if (adm != null) {
            
            	int idCandidature = Integer.parseInt(request.getParameter("idC"));
            	CandidatureManager candManag = (CandidatureManager)context.lookup("CandidatureManager"); 
            	Candidature c = candManag.rechercher(idCandidature);
           		
           		if (c != null) { 
            %>
            
                <table width="668" height="139" align="center">
						    
							<tr>
								<td>
									<table height="139" align="center">
                                    
						    	<tr align="center">
                                        <td class="txt_1" colspan="2"><br /><b>DETAIL CANDIDATURE</b><br /><br /></td>
                                    </tr>
                        		<tr> 
	                        		<td width="171" class="txt_1">Titre de l'offre</td>
	                        		<td width="317" align="left" class="txt_2"><%=c.getIdoffre().getTitreOffre() %></td>	
                        		</tr>
                        		
                        		<tr> 
	                        		<td class="txt_1">Soci&eacute;t&eacute;</td>
	                        		<td align="left" class="txt_2"><%=c.getIdoffre().getIdsociete().getRaisonSocial() %></td>	
                        		</tr>
                        		
                        		<tr> 
	                        		<td class="txt_1">Domaine de comp&eacute;tance</td>
	                        		<td align="left" class="txt_2"><%=c.getIdoffre().getIdformation().getLibelleFormation() %><br /></td>	
                        		</tr>
                        		
                        		<tr> 
	                        		<td class="txt_1">Date de candidature</td>
	                        		<td align="left" class="txt_2"><%=c.getDate() %></td>	
                        		</tr>
                        		
                        		<tr> 
	                        		<td class="txt_1">Nom du candidat</td>
	                        		<td align="left" class="txt_2"><%=c.getIdcandidat().getNom() %> <%=c.getIdcandidat().getPrenom() %><br /></td>	
                        		</tr>
                        		
                        		<tr> 
	                        		<td valign="top" class="txt_1">Observations</td>
	                        		<td align="left" class="txt_2"><%=c.getObservation() %><br /></td>	
                        		</tr>
                        		<tr> 
	                        		<td class="txt_1">D&eacute;cision</td>
	                        		<td align="left" class="txt_2"><%=c.getDecision() %></td>	
                        		</tr>
                        		
                        		</table>
                        		
							  </td>
							</tr>
							
                			</table>
            <%
           		}
           		else {
           			//cas ou l'idOffre a été changé manuellement dans l'url
           			//erreur redirection vers confirmation_message
           			session.setAttribute("okAd", 13);
					response.sendRedirect(response.encodeRedirectURL("admin.jsp?id=25#contenu"));
           		}
            }
           	else {
           		//session expirée
           		response.sendRedirect(response.encodeRedirectURL("admin.jsp"));
           		} %>