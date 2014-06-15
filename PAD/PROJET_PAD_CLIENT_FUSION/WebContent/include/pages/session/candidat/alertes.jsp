
                <%HttpSession sessionCand = request.getSession();
           	Candidat c = (Candidat)sessionCand.getAttribute("candidat");
           	if (c !=null) {
           	%>
            
                       	<% AlerteManager alerteManag = (AlerteManager)context.lookup("AlerteManager"); 
                       		ArrayList<Alerte> listeAlerte = alerteManag.listeAlertesParCandidat(c.getIdcandidat());
                       		%>
                       			<br/>
								<table width="668" height="139" align="center">
						    
						    
								<tr>
								<td>
								
                        		<table width="500" align="center">
                        		<tr>
                        		  <td class="txt_1"><b>MOTS CLES</b><br/></td><td></td><td></td><td></td></tr>
                                
                        		
                        		<% if (listeAlerte.size()>=1) {
                        			int cLigne = 0;
                        			sessionCand.setAttribute("listeAlertes", listeAlerte);
                        		for (Alerte a : listeAlerte) {%>
                        		
                        		
                        		<tr <% 
                        		 if ((cLigne % 2) == 0) {%>
                        			bgcolor="#5A5B5B"
                        		<%} cLigne++; %> > 
                        		
                        		<td width="279" class="txt_1"><%=a.getMotcle() %></td>
                        			 <% String url = "index.jsp?id=20&idA="+a.getIdalerte()+"#contenu"; 
                        			 String url1 = "index.jsp?id=21&idA="+a.getIdalerte()+"#contenu"; 
                        			 String url2 = "index.jsp?id=22&min=1&idA="+a.getIdalerte()+"#contenu"; 
                        			 %>
                        			<td width="43" align="center"><a href="<%=url %>" class="txt_2">Editer</a></td>
                       			  <td width="70" align="center"><a href="<%=url1 %>" class="txt_2">Supprimer</a></td>
                        			<td width="88" align="center"><a href="<%=url2 %>" class="txt_2">Voir les offres</a></td>
                        		</tr><%} 
                        		}%>
                        		<tr><td></td><td></td><td></td></tr>
                                <tr><td colspan="4" align="center"><a href="index.jsp?id=18#contenu" class="txt_2">Ajouter une nouvelle alerte</a></td></tr>
                        		</table>
                        		</td>
                        		</tr>
                        		</table>

            <%}
           	else {
           		//session expirée
				
           		session.setAttribute("ok", 11);
				response.sendRedirect(response.encodeRedirectURL("index.jsp?id=19#contenu"));
           		} %>
