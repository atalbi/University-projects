
                <%HttpSession sessionCand = request.getSession();
           	Candidat c = (Candidat)sessionCand.getAttribute("candidat");
           	
           	if (c !=null) {
           	%>
           
                		<table width="668" height="139" align="center">
						   
						    
								<tr>
								<td>
								<form name="formCreation_Alerte" action="sCreateAlerte" method="POST">
                        		<table width="500" align="center">
                                <tr align="center">
                                        <td class="txt_1" colspan="3"><b>CREATION NOUVELLE ALERTE</b><br /><br /></td>
                                    </tr>
                        		<tr>
		                        	<td class="txt_1">Mot clé</td>
		                        	<td><input name="motCle" type="text" class="styleZoneTxt" value=""/></td>
		                        	<td><input name="valider" type="submit" value="  Ajouter  "/><input type="hidden" value="1" name="srcCreate" /></td>
	                        	</tr>
                        		
                        		</table>
                        		</form>
                        		</td>
                        		</tr>
                        		</table>
	                        <table>	                        
	                        </table> 

            <%}
           	else {%>
			<div>ERREUR</div>
			<%} %>
 