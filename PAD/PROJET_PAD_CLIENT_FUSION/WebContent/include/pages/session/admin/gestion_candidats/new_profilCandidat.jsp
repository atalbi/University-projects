<%
            Admin adm = null;
            adm = ((Admin)session.getAttribute("admin"));
            
            if (adm != null) {
            
            	CandidatManager candidatManag = (CandidatManager)context.lookup("CandidatManager"); 
           		 
            %>

                <table width="668" height="139" align="center">
						    
								<tr>
								<td>
								<form name="formCreate_Candidat" action="sCreateProfil_Candidat" method="POST" enctype="multipart/form-data">
                        		<table  align="center">
                                    <tr align="center">
                                        <td class="txt_1" colspan="2"><br /><b>CREATION NOUVEAU PROFIL</b><br /><br /></td>
                                    </tr>
                        		<tr>
                        			<td class="txt_1">Nom </td>
                        			<td><input name="nomCandid" type="text" class="styleZoneTxt"  align="right"/></td>
                        		
                        		</tr>
                        		<tr> 
                        			<td class="txt_1">Prénom</td>
                        			<td><input name="prenomCandid" type="text" class="styleZoneTxt" /></td>
                        		</tr>
                        		<tr>
                        			<td class="txt_1">Téléphone</td>
                        			<td><input name="telCandid" type="text" class="styleZoneTxt"/></td>
                        		</tr>
                        		
                        		<tr>
                        			<td class="txt_1">Etudes</td>
                        			<td><input name="etudeCandid" type="text" class="styleZoneTxt"/></td>
                        		</tr>
                        		
                        		<tr>
                        			<td class="txt_1">Email </td>
                        			<td><input name="emailCandid" type="text" class="styleZoneTxt" /></td>
                        		</tr>
                        		
                        		<tr>
                        			<td class="txt_1">Mot de passe </td>
                        			<td><input name="passwordCandid" type="password" class="styleZoneTxt"/></td>
                        		</tr>
                        		
                        		<tr>
                        			<td class="txt_1">CV </td>
                        			<td><input name="cvCandid" type="file" class="styleZoneTxt" accept="application/pdf,application/msword" readonly="readonly"/></td>
                        		</tr>
                        		
                        		<tr>
                        			<td class="txt_1">Formation </td>
                        			<td>
                        				<select name="formationCandid" style="width:160px">
                        		<%
                                    FormationManager formManag = (FormationManager) context.lookup("FormationManager");
                              	   ArrayList<Formation> listForm = formManag.listefFormation();
                              	   %>
                              	 <option value="-1" selected="selected"> </option>
                                     
                                     <%   for(Formation f: listForm){
                                    %>
                        			<option value="<%=f.getIdformation()%>" ><%=f.getLibelleFormation() %></option>
                        			<%} %>
                        			</select>
                        			</td>
                        		</tr>
                        		
                        		<tr>
                        			<td class="txt_1">Observation </td>
                        			<td><textarea name="observCandid" cols="40" rows="4"/></textarea></td>
                        		</tr>
                        		
                        		<tr>
                        		<td colspan="2" align="center"><input name="btn" type="submit" value="Valider" /></td>
                        		</tr>
                        		
                        		</table>
                        		
                        		<input name="srcCreate" type="hidden" value="2" />
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