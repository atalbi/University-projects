<script type="text/javascript" src="js/formulaireRecruteur.js"></script>
                    <table width="550" height="139" align="center">
					    <tr align="center">
                                        <td class="txt_1" colspan="2"><br /><b>CREATION NOUVEAU PROFIL</b><br /><br /></td>
                                    </tr>
					    <tr align="center">
	                         <td>
	                         
	                         <form action="sCreateSociete" method="post" name="form_createProfilSoc" id="form_createProfilSoc" class="form">
                   		    <table width="527">                        		<tr> 
                        			<td width="137" class="txt_1"> Raison sociale *</td>
                        			<td width="296"><input name="raiSoc" id="raiSoc" type="text" class="styleZoneTxt"  align="right" />&nbsp;&nbsp;&nbsp;<span id="sp_RS" class="error_log_1"></span></td>
                        		</tr>
                        		
                                <tr>
                        			<td class="txt_1">Email *</td>
                       			  <td><input name="emailSoc" id="emailSoc" type="text" class="styleZoneTxt"/>&nbsp;&nbsp;&nbsp;<span id="sp_email" class="error_log_1"></span></td>
                       		  </tr>
                        		
                        		<tr>
                       			  <td class="txt_1">Mot de passe *</td>
                        			<td><input name="passwordSoc" id="passwordSoc" type="password" class="styleZoneTxt" />&nbsp;&nbsp;&nbsp;<span id="sp_pass" class="error_log_1"></span></td>
                       		  </tr>
                                
                                <tr> 
                        			<td class="txt_1"> T&eacute;l&eacute;phone</td>
                        			<td><input name="TelSoc" type="text" class="styleZoneTxt" /></td>
                        		</tr>
                                
                        		<tr>
                        			<td valign="top" class="txt_1">Adresse</td>
                        			<td><textarea name="AdresSoc" rows="3" cols="30"></textarea></td>
                        		</tr>
                        		
                        		
                        		<tr>
                        			<td valign="top" class="txt_1">Description</td>
                        			<td>
                        			<TEXTAREA COLS="30" ROWS="3" name="description"	></TEXTAREA></td>
                        		</tr>
                        		
                        		<tr align="center">
                        			<td colspan="2"><input type="submit" value="Valider" /></td>
                        		</tr>
                        		
                       		   </table>
                       		   <input name="srcCreate" type="hidden" value="1" />
                       		   </form>
                      </td>  	
	                         
                         </tr>
                         </table>

                      