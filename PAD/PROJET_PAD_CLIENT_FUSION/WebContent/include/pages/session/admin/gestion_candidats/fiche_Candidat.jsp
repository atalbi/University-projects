<%
           
            Admin adm = null;
            adm = ((Admin)session.getAttribute("admin"));
            
            if (adm != null) {
            
            	int idCandidat = Integer.parseInt(request.getParameter("idCd"));
            	CandidatManager candManag = (CandidatManager)context.lookup("CandidatManager"); 
            	Candidat c = candManag.rechercherCandidat(idCandidat);
           		
           		if (c != null) { 
            %>
           
                <table width="668" height="139" align="center">
						   
							<tr>
								<td align="center">
									<table width="668" height="139" align="center">
						    	<tr>
								<td>
								
                        		<table width="491" align="center">
                                <tr align="center">
                                        <td class="txt_1" colspan="2"><br /><b>FICHE CANDIDAT</b><br /><br /></td>
                                    </tr>
                     			<tr><td width="125"></td><td width="352"></td>
                        		<tr> 
	                        		<td class="txt_1">Noms </td>
	                        		<td class="txt_3"><%=c.getNom()%> <%=c.getPrenom()%></td>	
                        		</tr>
                        		
                        		<tr> 
	                        		<td class="txt_1">Formation</td>
	                        		<td class="txt_3"><%=c.getIdformation().getLibelleFormation()%></td>	
                        		</tr>
                        		
                        		<tr> 
	                        		<td class="txt_1">Niveau d'études</td>
	                        		<td class="txt_3"><%if (c.getNiveauEtudes() != null) %><%=c.getNiveauEtudes()%></td>	
                        		</tr>
                        		
                        		<tr> 
                        			<td class="txt_1">Teléphone</td>
                        			<td class="txt_3"><%if (c.getTel() != null) %><%=c.getTel()%></td>
                        		
                        		</tr>
                        		<tr> 
                        			<td class="txt_1">Email</td>
                        			<td class="txt_3"><%=c.getEmail() %></td>
                        		
                        		</tr>
                                <tr> 
                        			<td class="txt_1">Valide</td>
                        			<td class="txt_3"><%if (c.getValide() == 1) {%>oui<%} else { %>non<% }%></td>
                        		
                        		</tr>
                        		<% if (c.getCv() != null && !c.getCv().equals("") && !c.getCv().equalsIgnoreCase("null")) {%>
                    	
                    	<tr>
                    		
                            	<td class="txt_1">Cv</td>
                                <td align="left" >
	                    		<form action="sDownload" method="post" name="form_CV" class="form">
	                    		<input name="cv" type="hidden"  value="<%=c.getCv()%>"/>
	                    		<input name="cv" type="hidden"  value="<%=c.getCv()%>"/><input type="submit" value="Telecharger"/>
	                    		 </form>
                    		</td>
                        	
                        </tr>
                       
                    <%}%>
                        		<tr> 
                        			<td valign="top" class="txt_1">Observations</td>
                       			  <td class="txt_3"><%if (c.getObservation() != null) %><%=c.getObservation() %></td>
                        		</tr>
                        		
                        		</table>
                        		</td>
                        		</tr>
                        		</table>
								</td>
							</tr>
							
                			</table>
            <%
           		}
           		else {
           			//cas ou l'idCandidat a été changé manuellement dans l'url
           			//erreur redirection vers confirmation_message
           			session.setAttribute("okAd", 20);
					response.sendRedirect(response.encodeRedirectURL("admin.jsp?id=25#contenu"));
           		}
            }
           	else {
           		//session expirée
           		response.sendRedirect(response.encodeRedirectURL("admin.jsp"));
           		} %>