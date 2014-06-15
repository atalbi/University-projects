
                <%HttpSession sessionCand = request.getSession();
           	Candidat c = (Candidat)sessionCand.getAttribute("candidat");
           	
           	if (c !=null) {
           	%>
							<br />
                         	<form  action="sEditProfil_Candidat" method="post" name="form_editProfilCand" class="form" enctype="multipart/form-data" >
                        		<table align="center">
                                <tr align="center">
                                        <td class="txt_1" colspan="2"><b>MODIFICATION PROFIL</b><br /><br /></td>
                                    </tr>
                        		<tr> 
                        			<td width="112" class="txt_1"> Nom</td>
                        			<td width="343"><input name="nomCandid" class="styleZoneTxt" type="text" align="right" value="<%=c.getNom()%>"/></td>
                        		
                        		</tr>
                        		<tr> 
                        			<td  class="txt_1"> Prénom</td>
                        			<td><input name="prenomCandid" type="text" class="styleZoneTxt" value="<%=c.getPrenom()%>"/></td>
                        		</tr>
                        		<tr>
                        			<td class="txt_1"> Tel</td>
                        			<td><input name="telCandid" type="text"  class="styleZoneTxt" value="<%if (c.getTel() != null) %><%=c.getTel()%>"/></td>
                        		</tr>
                        		
                        		<tr>
                        			<td class="txt_1"> Etudes</td>
                        			<td><input name="etudeCandid" type="text"  class="styleZoneTxt" value="<%if (c.getNiveauEtudes() != null) %><%=c.getNiveauEtudes()%>"/></td>
                        		</tr>
                        		
                        		<tr>
                        			<td  class="txt_1"> Email</td>
                        			<td><input name="emailCandid" type="text"  class="styleZoneTxt"  value="<%=c.getEmail()%>"/></td>
                        		</tr>
                        		
                        		<tr>
                        			<td class="txt_1"> Mot de passe</td>
                        			<td><input name="passwordCandid" type="password"  class="styleZoneTxt" value ="<%=c.getPassword()%>"/></td>
                        		</tr>
                        		
                        		<tr>
                        			<td  class="txt_1">CV</td>
                        			<td><input name="cvCandid" type="file" class="styleZoneTxt" accept="application/pdf,application/msword" readonly="readonly"/> </td>
                        		</tr>
                        		
                        		<tr>
                        			<td class="txt_1">Formation</td>
                        			<td>
                        				<select name="formationCandid" class="styleZoneTxt">
                        		<%
                                    FormationManager formManag3 = (FormationManager) context.lookup("FormationManager");
                              	   ArrayList<Formation> listForm3 = formManag3.listefFormation();
                              	   
                                    	
                                        for(Formation f: listForm3){
                                    %>
                        			<option value="<%=f.getIdformation()%>" <% if (f.getIdformation() == c.getIdformation().getIdformation()) {%>selected="selected"<%} %> ><%=f.getLibelleFormation() %></option>
                        			<%} %>
                        			</select>
                        			</td>
                        		</tr>
                        		<tr>
                                	<td class="txt_1">Observation</td>
                        			<td>
                        				<textarea rows="3" cols="41" name="observCandid"><%=c.getObservation() %></textarea>
                        			</td>
                        		</tr>
                        		<tr>
                        		<td colspan="2" align="center"><input type="submit" value="   Valider   " /></td>
                        		</tr>
                        		</table>
                        		<input name="srcEdit" type="hidden" value="1"/>
                          		</form>     
            <%}
           	else {session.setAttribute("ok", 11);
				response.sendRedirect(response.encodeRedirectURL("index.jsp?id=19#contenu"));} %>
            
 