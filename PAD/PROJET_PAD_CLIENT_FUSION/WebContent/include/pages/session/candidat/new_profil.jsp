<script type="text/javascript" src="js/formulaireCandidat.js"></script>
                         <table width="550" height="139" align="center">
					   
					    <tr align="center">
	                         <td>
	                         
	                         <form id="form_createProfilCand" action="sCreateProfil_Candidat" method="post" name="form_createProfilCand" class="form" enctype="multipart/form-data">			<br />
                        		<table width="447">
								  <tr align="center">
                                        <td class="txt_1" colspan="2"><b>CREATION NOUVEAU PROFIL</b><br /><br /></td>
                                    </tr>
                        		<tr> 
                        			<td width="132" class="txt_1"> Nom *</td>
                        			<td width="303"><input name="nomCandid" id="nomCandid" type="text" class="styleZoneTxt" />&nbsp;&nbsp;&nbsp;<span id="sp_nom" class="error_log_1"></span></td>
                        		
                        		</tr>
                        		<tr> 
                        			<td class="txt_1"> Prénom *</td>
                        			<td><input name="prenomCandid" id="prenomCandid" type="text" class="styleZoneTxt" />&nbsp;&nbsp;&nbsp;<span id="sp_prenom" class="error_log_1"></span></td>
                        		</tr>
                        		<tr>
                        			<td class="txt_1"> Tel</td>
                        			<td><input name="telCandid" type="text" class="styleZoneTxt" /></td>
                        		</tr>
                        		
                        		<tr>
                        			<td class="txt_1"> Etudes </td>
                        			<td><input name="etudeCandid" type="text" class="styleZoneTxt" /></td>
                        		</tr>
                        		
                        		<tr>
                        			<td class="txt_1"> Email *</td>
                        			<td><input name="emailCandid" id="emailCandid" type="text" class="styleZoneTxt" />&nbsp;&nbsp;&nbsp;<span id="sp_email" class="error_log_1"></span></td>
                        		</tr>
                        		
                        		<tr>
                        			<td class="txt_1"> Mot de passe * </td>
                        			<td><input name="passwordCandid" id="passwordCandid" type="password" class="styleZoneTxt"/>&nbsp;&nbsp;&nbsp;<span id="sp_pass" class="error_log_1"></span></td>
                        		</tr>
                        		
                        		<tr>
                        			<td class="txt_1"> CV </td>
                        			<td><input name="cvCandid" type="file" class="styleZoneTxt" accept="application/pdf,application/msword" readonly="readonly"/></td>
                        		</tr>
                        		
                        		<tr>
                        			<td class="txt_1"> Formation</td>
                        			<td>
                        				<select name="formationCandid" style="width:160px">
                        				<option value="-1" selected="selected" ></option>
                        		<%
                                    FormationManager formManag1 = (FormationManager) context.lookup("FormationManager");
                              	   ArrayList<Formation> listForm1 = formManag1.listefFormation();
                              	   
                                    	
                                        for(Formation f: listForm1){
                                    %>
                        			<option value="<%=f.getIdformation()%>" ><%=f.getLibelleFormation() %></option>
                        			<%} %>
                        			</select>
                        			</td>
                        		</tr>
                        		
                        		<tr><td></td><td></td></tr>
                                <tr><td></td><td></td></tr>
                                <tr><td></td><td></td></tr>
                                <tr><td></td><td></td></tr>
                                <tr>
                                	<td valign="top" class="txt_1"> A propos de moi</td>
                                    <td><textarea name="observCandid" cols="40" rows="5"></textarea></td>
                                </tr>
                                <tr><td></td><td><input name="srcCreate" type="hidden" value="1"/></td></tr>
                                
                                <tr>
                        		<td colspan="2" align="center"><input type="submit" id="envoyer" value="Valider" /></td>
                        		</tr>
                        		<tr>
                   		      </table>
                        		
                          		</form>
	                         
	                         </td>
                         </tr>
                         </table>
