<%

            if (((Admin)session.getAttribute("admin")) != null) {
            	Admin a = ((Admin)session.getAttribute("admin"));
            %>
           
                       	<% AdminManager adminManag = (AdminManager)context.lookup("AdminManager"); 
                       		ArrayList<Admin> listeAdmin = adminManag.liste_profils_Admin();
                       		
                       		%>
                       			
								<table width="668" height="139" align="center">
							<tr>
								<td>
								
                        		<table width="500" align="center">
                        		
                        		<tr align="center">
                                        <td class="txt_1" colspan="5"><br /><b>LISTE DES COMPTES ADMINISTRATEURS</b><br /><br /></td>
                                    </tr>
                        		<% if (listeAdmin.size()>=1) {
                        			int cLigne = 0;
                        		for (Admin adm : listeAdmin) {%>
                        		<tr <% 
                        		 if ((cLigne % 2) == 0) {%>
                        			bgcolor="#5A5B5B"
                        		<%} cLigne++; %> 
                        		
                        		> 
                        		
                        		<td width="340" align="left" class="txt_1"><%=adm.getLogin() %></td>
                        			 <% String url = "admin.jsp?id=27&idAd="+adm.getIdadmin()+"#contenu"; 
                        			 String url1 = "admin.jsp?id=29&idAd="+adm.getIdadmin()+"#contenu"; 
                        			 %>
                        			<%if (a.getSuperAdmin() == 1) { %>
	                        			<td width="20" align="center"><a href="<%=url %>" class="txt_2">Editer</a></td>
	                        			<td width="20" align="center"><a href="<%=url1 %>" class="txt_2">Supprimer</a></td>
                        			<%}
                        			else {
                        				%>
                        				<td></td><td></td>	
                        			<%}
                        			%>
                        		</tr><%} 
                        		}%>
                        		
                        		</table>
                        		</td>
                        		</tr>
                        		</table>
							
            <%}
           	else {
           		//session expirée
           		response.sendRedirect(response.encodeRedirectURL("admin.jsp"));
           		} %>
 