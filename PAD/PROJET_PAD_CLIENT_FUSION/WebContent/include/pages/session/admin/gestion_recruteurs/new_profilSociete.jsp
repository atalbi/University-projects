<%
            Admin adm = null;
            adm = ((Admin)session.getAttribute("admin"));
            
            if (adm != null) {

            %>
      
                <table width="668" height="139" align="center">
						  
								<tr>
								<td>
								<form name="formCreate_Societe" action="sCreateSociete" method="POST">
                        		<table  align="center">
                        		<tr align="center">
                                        <td class="txt_1" colspan="2"><br /><b>CREATION NOUVEAU PROFIL</b><br /><br /></td>
                                    </tr>
                        		<tr>
                        			<td class="txt_1">Raison sociale</td>
		                        	<td>
		                        		<input name="nomSociete" type="text" value="" class="styleZoneTxt"/>
		                        	</td>
	                        	</tr>
	                        	<tr>
	                        		<td class="txt_1">Login</td>
		                        	<td>
		                        		<input name="loginSociete" type="text" value="" class="styleZoneTxt"/>
		                        	</td>
	                        	</tr>
	                        	<tr>
	                        		<td class="txt_1">Mot de passe</td>
		                        	<td>
		                        		<input name="passwordSociete" type="password" value="" class="styleZoneTxt"/>
		                        	</td>
	                        	</tr>
	                        	<tr>
	                        		<td class="txt_1">Télephone</td>
		                        	<td>
		                        		<input name="telSociete" type="text" value="" class="styleZoneTxt"/>
		                        	</td>
	                        	</tr>
	                        	<tr>
	                        		<td class="txt_1">Valide</td>
		                        	<td>
		                        		<input name="valide" type="text" value="1" class="styleZoneTxt"/>
		                        	</td>
	                        	</tr>
	                        	<tr>
	                        		<td class="txt_1">Adresse</td>
		                        	<td>
		                        		<textarea cols="40" rows="2" name="adresseSociete"></textarea>
		                        	</td>
	                        	</tr>
	                        	<tr>
	                        		<td class="txt_1">Description</td>
		                        	<td>
		                        		<textarea cols="40" rows="3" name="descriptionSociete"></textarea>
		                        		
		                        	</td>
	                        	</tr>
	                        	
                        		<tr>
		                        	<td colspan="2" align="center">
		                        		<input name="valider" type="submit" value="Valider"/>
		                        		
		                        	</td>
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