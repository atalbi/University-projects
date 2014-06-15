<%
            Admin a = null;
            a = ((Admin)session.getAttribute("admin"));
            if (a != null) {%>
           
                       	<% FormationManager formationManag = (FormationManager)context.lookup("FormationManager"); 
                       		ArrayList<Formation> listeFormation = formationManag.listefFormation();
                       		%>
                       			
								<table width="668" height="139" align="center">
						    					    
								<tr>
								<td>
								
                        		<table width="472" align="center">
                                <tr align="center">
                                        <td class="txt_1" colspan="3"><br /><b>LISTE DES FORMATIONS</b><br /><br /></td>
                                    </tr>
                        		<tr> 
	                        		<td width="385"></td>
                        		</tr>
                        		<% if (listeFormation.size()>=1) {
                        			int cLigne = 0;
                        			
                        		for (Formation f : listeFormation) {%>
                        		
                        		<tr <% 
                        		 if ((cLigne % 2) == 0) {%>
                        			bgcolor="#5A5B5B"
                        		<%} cLigne++; %> 
                        		
                        		> 
                        		
                        		<td class="txt_2"><%=f.getLibelleFormation()%></td>
                        			 <% String url = "admin.jsp?id=31&idF="+f.getIdformation()+"#contenu"; 
                        			 String url1 = "admin.jsp?id=33&idF="+f.getIdformation()+"#contenu";
                        			 %>
                        			<td width="36" align="center"><a href="<%=url %>" class="txt_2">Editer</a></td>
                        			<td width="59" align="center"><a href="<%=url1 %>" class="txt_2">Supprimer</a></td>
                        			
                        		</tr><%} 
                        		}%>
                        		
                        		</table>
                        		</td>
                        		</tr>
                        		</table>
            <%
            	
            }
           	else {
           		//session expirée
           		response.sendRedirect(response.encodeRedirectURL("admin.jsp"));
           		} %>