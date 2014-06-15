<%
           
            Admin a = null;
            a = ((Admin)session.getAttribute("admin"));
            if (a != null) {%>
            
                	<table width="668" height="139" align="center">
						    <tr>
								<td>
								<form name="formCreation_Formation" action="sCreateFormation" method="POST">
                        		<table width="373" align="center">
                                <tr align="center">
                                        <td class="txt_1" colspan="2"><br /><b>AJOUT NOUVELLE FORMATION</b><br /><br /></td>
                                    </tr>
                                                            
                        		<tr>
		                        	<td width="153" class="txt_1">Libell&eacute; de la formation</td>
		                        	<td width="208"><input name="libelleFormation" type="text" class="styleZoneTxt" value=""/></td>
	                        	</tr>
                                <tr><td></td><td></td></tr>
                        		<tr align="center">
                                	<td colspan="2"><input name="valider" type="submit" value="Ajouter"/></td>
                                </tr>
                        		</table>
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