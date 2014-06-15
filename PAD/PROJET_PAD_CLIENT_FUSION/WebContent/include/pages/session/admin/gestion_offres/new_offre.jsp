<%
          
            Admin adm = null;
            adm = ((Admin)session.getAttribute("admin"));
            if (adm != null) {%>
          
                <table width="668" height="139" align="center">
						   
								<tr>
								<td>
								<form name="formCreation_Offre" action="sCreateOffre" method="POST">
                        		<table width="500" align="center">
                                <tr align="center">
                                        <td class="txt_1" colspan="2"><br /><b>AJOUT NOUVELLE OFFRE</b><br /><br /></td>
                                    </tr>
                        		<tr><td></td><td></td></tr>
                                <tr><td></td><td></td></tr>
                                <tr><td></td><td></td></tr>
                        		<tr>
                        			<td class="txt_1">Titre </td>
                        			<td><input name="titreOffre" type="text" class="styleZoneTxt" value=""/></td>
                        		</tr>
                        		<tr>
                        			<td class="txt_1">Date </td>
                        			<td><input name="dateOffre" type="text" class="styleZoneTxt" value=""/></td>
                        		</tr>
                        		<tr>
                        			<td class="txt_1">Société </td>
                        			<td>
                        				<select name="societeOffre" style="width: 160px">
                        					<option value="-1" selected="selected"> </option>
	                        				<%
	                        				SocieteManager societeManag = (SocieteManager) context.lookup("SocieteManager");
	                                   	   ArrayList<Societe> listSociete = societeManag.listeSociete();
	                                   	   
	                                         	
	                                             for(Societe s: listSociete){
	                                         %>
	                                               <option value="<%= s.getIdsociete() %>"><%= s.getRaisonSocial()%></option>
	                                         <%
	                                             }
	                                             %>
                        				</select>
                        			</td>
                        		</tr>
                        		
                        		<tr>
                        			<td class="txt_1">Domaine de compétence </td>
                        			<td>
                        				<select name="formationOffre" style="width: 160px">
                        					<option value="-1" selected="selected"> </option>
	                        				<%
	                        				FormationManager formationManag = (FormationManager) context.lookup("FormationManager");
	                                   	   ArrayList<Formation> listFormation = formationManag.listefFormation();
	                                   	   
	                                         	
	                                             for(Formation f: listFormation){
	                                         %>
	                                               <option value="<%= f.getIdformation() %>"><%=f.getLibelleFormation()%></option>
	                                         <%
	                                             }
	                                             %>
                        				</select>
                        			</td>
                        		</tr>
                        		
                        		<tr>
                        			<td class="txt_1">Description </td>
                        			<td><textarea name="descriptionOffre" cols="40" rows="5"></textarea> </td>
                        		</tr>
                        		<tr>
									<td class="txt_1">Publié</td>
									<td>
					                	<select name="valide">
					                    	<option value="1" selected="selected">Oui</option>
					                    	<option value="0">Non</option>                        
					                    </select>
					                </td>
								</tr>
                        		<tr>
                        			<td colspan="2" align="center"><input name="valider" type="submit" value="Valider"/> </td>
                        		</tr>
                        		
                				</table>
                				<input name="srcCreate" type="hidden" value="2"/>
                				</form>
                				</td>
                				</tr>
                				</table>
            <%
            	
            }
           	else {
           		//session expirée
           		response.sendRedirect(response.encodeRedirectURL("admin.jsp"));
           		} %>