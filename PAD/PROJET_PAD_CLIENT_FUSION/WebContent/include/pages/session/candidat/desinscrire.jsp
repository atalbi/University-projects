                <%HttpSession sessionCand = request.getSession();
           	Candidat c = (Candidat)sessionCand.getAttribute("candidat");
           	           	
           	if (c !=null) {
           		
           	%>	<br/><br/>
                		<table width="668" height="139" align="center">
						    <tr align="center">
						        <td height="30"><center><div class="txt_1"><b>CONFIRMATION DE DESINSCRIPTION</b></div></center></td>
						    </tr>
						    
								<tr>
								<td>
								<form name="formDesinscription" action="sDesinscription" method="POST">
                        		<table  align="center">
                        		<tr>
                        			<td colspan="2" class="txt_1">Etes-vous sûr de vouloir supprimer votre compte ?<br/><br/></td>
                        		</tr>
                        		<tr>
		                        	
		                        	<td align="center"><input name="confirm" type="submit" value="OUI"/></td>
	                        	  <td align="center"><input name="confirm" type="submit" value="NON"/></td>
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
           		session.setAttribute("ok", 11);
				response.sendRedirect(response.encodeRedirectURL("index.jsp?id=19#contenu"));
           		} %>
 