
			<%
			HttpSession sessionCand = request.getSession();
           	Candidat c = (Candidat)sessionCand.getAttribute("candidat");
           	
           	if (c !=null) {
           	%><br/>
                <table width="486" align="center">
                	
                	<tr>
                	  <td width="120" class="txt_1">Pr&eacute;nom</td>	<td colspan="2" class="txt_2"><%=c.getPrenom()%></td></tr>
                    <tr><td class="txt_1">Nom</td>		<td colspan="2" class="txt_2"><%=c.getNom()%></td>
                    </tr>
                    <tr>
                      <td class="txt_1">T&eacute;lephone</td>		<td colspan="2" class="txt_2"><%if (c.getTel() != null) %><%=c.getTel()%></td>
                    </tr>
                    <tr><td class="txt_1">Email</td>	<td colspan="2" class="txt_2"><%=c.getEmail()%></td>
                    </tr>
                    <tr><td class="txt_1">Formation</td><td colspan="2" class="txt_2"><%=c.getIdformation().getLibelleFormation()%></td>
                    </tr>
                    <tr><td class="txt_1">Etudes</td>		<td colspan="2" class="txt_2"><%if (c.getNiveauEtudes() != null) %><%=c.getNiveauEtudes()%></td>
                    </tr>
                    <% if (c.getCv() != null && !c.getCv().equals("") && !c.getCv().equalsIgnoreCase("null")) {%>
                    	
                    	<tr>
                        	<td class="txt_1">Cv</td>
                    		<td width="212" align="left">
	                    		<form action="sDownload" method="post" name="form_CV" class="form">
	                    		<input name="cv" type="hidden"  value="<%=c.getCv()%>"/>
	                    		<input name="cv" type="hidden"  value="<%=c.getCv()%>"/><input type="submit" value="Telecharger"/>
	                    		 </form>
                    		</td>
                        	<td width="198" align="right"><a href="index.jsp?id=8#contenu" class="txt_2">Editer</a></td>
                        </tr>
                       
                    <%}
					  else {
					%>
                    <tr><td colspan="3" align="right"><a href="index.jsp?id=8#contenu" class="txt_2">Editer</a></td></tr>
                    <%}%>
                    <tr><td></td><td></td></tr>
                    <tr><td></td><td></td></tr>
                    <tr><td></td><td></td></tr>
                    <tr><td></td><td></td></tr>
                    <tr>
                      <td colspan="2" align="left">A PROPOS DE MOI<td></td></tr>
                    <tr><td></td><td></td></tr>
                    <tr><td></td><td></td></tr>
                    <tr><td colspan="3" class="txt_2" align="justify"><%if (c.getObservation() != null) {%> <%=c.getObservation()%> <%} %></td></tr>
                    
				</table>
                              
                              <br>
<% AlerteManager alerteManag = (AlerteManager)context.lookup("AlerteManager"); 
                       		CandidatureManager candidatureManag = (CandidatureManager)context.lookup("CandidatureManager");
                       	%>
                       			
                        		<table width="486" align="center">
                                <tr>
                                  <td>MES STATISTIQUES</td><td></td></tr>
                                  <tr><td></td><td></td></tr>
                        		<tr> 
                        			<td width="255" class="txt_1"> Nombre total d'alertes </td>
                        			<td width="219" class="txt_2"><%=alerteManag.nbAlertesParCandidat(c.getIdcandidat()) %></td>
                        		
                        		</tr>
                        		<tr> 
                        			<td class="txt_1"> Nombre total de candidatures</td>
                        			<td class="txt_2"><%=candidatureManag.nbCandidaturesParCandidat(c.getIdcandidat()) %></td>
                        		</tr>
                        		</table>
	
            <%}
        	else {
           		//session expirée
           		response.sendRedirect(response.encodeRedirectURL("index.jsp?id=2&r=1"));
           		} %>
 