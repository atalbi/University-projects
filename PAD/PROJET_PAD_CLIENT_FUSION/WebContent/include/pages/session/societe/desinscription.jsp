
                <%
           	Societe s= (Societe)session.getAttribute("societe");
           	           	
           	if (s !=null) {
           		
           	%>
                
                		<table width="668" height="139" align="center">
						    <tr align="center">
						        <td height="30"><center><div class="txt_1"><br /><br /><b>CONFIRMATION DE DESINSCRIPTION</b><br /></div></center></td>
						    </tr>
						    
								<tr>
								<td>
								<form name="formDesinscript" action="sDesinscriptionSoc" method="POST">
                        		<table  align="center">
                        		<tr>
                       			  <td colspan="2" class="txt_1">Etes-vous sûr de vouloir supprimer votre compte ?<br /><br /></td>
                        		</tr>
                        		<tr>
		                        	
		                        	<td align="center" valign="middle"><input name="confirm" type="submit" value="OUI"/></td>
	                        	  <td align="center" valign="middle"><input name="confirm" type="submit" value="NON"/></td>
	                        	</tr>
                        		
                        		</table>
                        		</form>
                        		</td>
                        		</tr>
                        		</table>
	                        <table>
	                        </table> 
            <%
           	}
        	else {
           		//session expirée
           		response.sendRedirect(response.encodeRedirectURL("Recruteur.jsp?id=-1#contenu"));
           		} %>
 