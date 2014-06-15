                <%HttpSession sessionCand = request.getSession();
           	Candidat c = (Candidat)sessionCand.getAttribute("candidat");
           	if (c !=null) {
           	%>
                       <div >
                       	<% CandidatureManager candidatureManag = (CandidatureManager)context.lookup("CandidatureManager"); 
                       	ArrayList<Candidature> listeCandidature = candidatureManag.listeCandidaturesParCandidat(c.getIdcandidat());
                       		%>
                       		<table width="668" height="139" align="center">
						    
								<tr>
								<td>
                        		<table width="592" align="center">
                                <tr align="center">
						        <td class="txt_1" colspan="4" align="left"><b>MES CANDIDATURES</b><br/></td>
						    </tr>
                        		<% if (listeCandidature.size()>=1) {
                        			int cLigne = 0;
                        		for (Candidature a : listeCandidature) {%>
                        		
                        		
                        		<tr <% 
                        		 if ((cLigne % 2) == 0) {%>
                        			bgcolor="#5A5B5B"
                        		<%} cLigne++; %> 
                        		
                        		> 
                        			<td class="txt_1"><%=a.getIdoffre().getTitreOffre() %></td>
                        			<td class="txt_1"><%=a.getDate() %></td>
                        			<td class="txt_1"><%=a.getIdoffre().getIdsociete().getRaisonSocial() %></td>
                        			<td class="txt_1"><%=a.getDecision() %></td>
                        		</tr><%} 
                        		}%>
                        		
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
