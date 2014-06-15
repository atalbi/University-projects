
            <%
            Admin a = null;
            a = ((Admin)session.getAttribute("admin"));
            if (a != null) {
            
            OffreManager offreManag = (OffreManager)context.lookup("OffreManager");
           	AlerteManager alerteManag = (AlerteManager)context.lookup("AlerteManager"); 
           	CandidatManager candidatManag = (CandidatManager)context.lookup("CandidatManager");
           	CandidatureManager candidatureManag = (CandidatureManager)context.lookup("CandidatureManager");
           	SocieteManager societeManag1 = (SocieteManager)context.lookup("SocieteManager"); 	%>

                         	
                    		
                        		<table width="500" height="139" align="center">
						   	 	<tr align="center">
						       		<td height="30" colspan="2"><center><div id="h3_page1">Statistiques globales</div></center></td>
						    	</tr>
						    	<tr><td></td><td></td></tr>
                        		<tr> 
                        			<td class="txt_1"> Nombre total de candidats inscrits </td>
                        			<td align="center" class="txt_2"><%=candidatManag.nbCandidat()  %></td>
                        		
                        		</tr>
                        		<tr> 
                        			<td class="txt_1"> Nombre total de societes enregistrées </td>
                        			<td align="center" class="txt_2"><%=societeManag1.nbSociete() %></td>
                        		</tr>
                        		<tr> 
                        			<td class="txt_1"> Nombre total d'offres publiées </td>
                        			<td align="center" class="txt_2"><%=offreManag.nbOffres() %></td>
                        		
                        		</tr>
                        		<tr> 
                        			<td class="txt_1"> Nombre total de candidatures </td>
                        			<td align="center" class="txt_2"><%=candidatureManag.nbCandidatures() %></td>
                        		</tr>
                        		<tr> 
                        			<td class="txt_1"> Nombre total d'alertes candidat </td>
                        			<td align="center" class="txt_2"><%=alerteManag.nbAlerte() %></td>
                        		
                        		</tr>
                        		<tr> 
                        			<td class="txt_1"> Offres à supprimer </td>
                        			<td align="center" class="txt_2"><%=offreManag.nbOffresAsupprimer() %></td>
                        		</tr>
                        		<tr> 
                        			<td class="txt_1"> Candidat à supprimer </td>
                        			<td align="center" class="txt_2"><%=candidatManag.nbCandidatAsupprimer() %></td>
                        		
                        		</tr>
                        		<tr> 
                        			<td class="txt_1"> Societe à supprimer </td>
                        			<td align="center" class="txt_2"><%=societeManag1.nbSocieteAsupprimer() %></td>
                        		</tr>
                        		</table>
 <%
   	
            }
           	else {
           		session.setAttribute("okAd", 0);
				response.sendRedirect(response.encodeRedirectURL("index.jsp?id=25#contenu"));
           		} %>