<%
            
            Admin adm = null;
            adm = ((Admin)session.getAttribute("admin"));
            
            if (adm != null) {
            
            	int idOffre = Integer.parseInt(request.getParameter("idO"));
           		OffreManager offreManag = (OffreManager)context.lookup("OffreManager"); 
           		Offre o = offreManag.rechercher(idOffre);
           		
           		if (o != null) { 
            %>
            
                <table width="668" height="139" align="center">
						    
							<tr>
								<td>
									<table width="668" height="139" align="center">
                                    <tr align="center">
                                        <td class="txt_1" colspan="2"><br /><b>DETAIL OFFRE</b><br /><br /></td>
                                    </tr>
						    	<tr>
								<td>
								
                        		<table width="500" align="center">
                     		
                        		<tr> 
	                        		<td class="txt_1">Titre </td>
	                        		<td class="txt_3"><%=o.getTitreOffre() %></td>	
                        		</tr>
                        		
                        		<tr> 
	                        		<td class="txt_1">Date </td>
	                        		<td class="txt_3"><%=o.getDateOffre() %></td>	
                        		</tr>
                        		
                        		<tr> 
	                        		<td class="txt_1">Société </td>
	                        		<td class="txt_3"><%=o.getIdsociete().getRaisonSocial() %></td>	
                        		</tr>
                        		<tr> 
	                        		<td class="txt_1">Domaine de compétance </td>
	                        		<td class="txt_3"><%=o.getIdformation().getLibelleFormation() %></td>	
                        		</tr>
                        		<tr> 
	                        		<td class="txt_1">Description</td>
	                        		<td class="txt_3"><%=o.getOffDescription() %></td>	
                        		</tr>
                        		
                        		</table>
                        		</td>
                        		</tr>
                        		</table>
								</td>
							</tr>
							<tr><td></td></tr>
							<tr><td></td></tr>
							<tr><td></td></tr>
							
							<tr>
								
								<td>
								
                        		<table width="600" align="center">
                     			<tr align="center">
                                        <td class="txt_1"><br /><b>LISTE DES CANDIDATURES</b><br /><br /></td>
                                    </tr>
                        		<tr> 
	                        		<td>
	                        		<% 
	                        		CandidatureManager candManag = (CandidatureManager)context.lookup("CandidatureManager"); 
	                           		ArrayList<Candidature> listeCandidatures = candManag.listeCandidaturesParOffre(o.getIdoffre());
	                        		
	                        		if (listeCandidatures.size()>0 ) {
	                        			%>
	                                		<table width="500" align="center">
	                                		
	                                		<% 
	                                			int cLigne = 0;
	                                		for (Candidature c : listeCandidatures) {%>
	                                		
	                                		<tr <% 
	                                		 if ((cLigne % 2) == 0) {%>
	                                			bgcolor="#5A5B5B"
	                                		<%} cLigne++; %> 
	                                		> 
	                                		
	                                		<td class="txt_2"><%=c.getDate() %></td>
	                                			 <td class="txt_2"><%=c.getIdcandidat().getNom() %> <%=c.getIdcandidat().getPrenom() %></td>
	                                			<td class="txt_2"><%=c.getDecision() %></td>
	                                		</tr><%} 
	                                		%>
	                                		
	                                		</table>
	                        			
	                        			<%
	                        			
	                        		} 
	                        		else {
	                        			%>
	                        			<center>
						          <div class="info_log_1">Aucun candidat n'a postul&eacute; pour l'instant &agrave; cette offre !</div></center>
	                        			<%
	                        		}
	                        		%>
	                        		
	                        		</td>	
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