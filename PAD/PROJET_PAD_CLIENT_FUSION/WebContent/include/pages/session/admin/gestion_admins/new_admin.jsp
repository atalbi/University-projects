            <%
            if (((Admin)session.getAttribute("admin")) != null) {
            %>
            
            <table width="550" height="139" align="center">
				
				<tr align="center">
	                <td>
	                    <form action="sCreateProfil_Admin" method="post" name="form_createProfilAdmin" class="form">
                        <table>
                        	<tr align="center">
                                        <td class="txt_1" colspan="2"><br /><b>CREATION PROFIL ADMINISTRATEUR</b><br /><br /></td>
                                    </tr>
                      		<tr> 
                        		<td class="txt_1">Login du nouvel admin </td>
                        		<td ><input name="loginAdmin" type="text" class="styleZoneTxt"  align="right" /></td>
                        	</tr>     		
                        	<tr>
                        		<td class="txt_1">Mot de passe du nouvel admin </td>
                        		<td ><input name="passwordAdmin" type="password" class="styleZoneTxt"/></td>
                        	</tr>
                        	<tr>
                        		<td colspan="2" align="center"><input type="submit" value="Valider" /></td>
                       	  </tr>
                        		
                        </table>
                        </form>
	                         
	                 </td>
                  </tr>
            </table>
            <%}
           	else {
           		//session expirée
           		response.sendRedirect(response.encodeRedirectURL("admin.jsp"));
           		} %>
 