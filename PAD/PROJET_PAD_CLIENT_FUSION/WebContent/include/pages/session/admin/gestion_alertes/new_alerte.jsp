<%
            Admin a = null;
            a = ((Admin)session.getAttribute("admin"));
            if (a != null) {%>
            
                	<table width="668" height="139" align="center">
						   
								<tr>
								<td>
								<form name="formCreation_Alerte" action="sCreateAlerte" method="POST">
                        		<table width="369" align="center">
                                <tr align="center">
                                        <td class="txt_1" colspan="2"><br /><b>CREATION NOUVELLE ALERTE</b><br /><br /></td>
                                    </tr>
                        		<tr>
	                        	  <td width="118" class="txt_1">Mot clé </td>
		                        	<td width="252"><input name="motCle" type="text" value="" class="styleZoneTxt"/></td>
	                        	</tr>
	                        	<tr>
                        		  <td class="txt_1">Candidat </td>
	                        		<td>
	                        			<select name="candidat" style="width: 160px">
	                        				<option value="-1" selected="selected"> </option>
	                        				<%
	                        				CandidatManager candManag = (CandidatManager) context.lookup("CandidatManager");
	                                   	   ArrayList<Candidat> listCand = candManag.listeCandidat();
	                                   	   
	                                         	
	                                             for(Candidat c: listCand){
	                                         %>
	                                               <option value="<%= c.getIdcandidat() %>"><%= c.getNom()%> <%=c.getPrenom() %></option>
	                                         <%
	                                             }
	                                             %>
	                        			</select>
	                        		</td>
	                        		
	                        	</tr>
                        		<tr>
			                        	<td colspan="2" align="center">
			                        		<input name="valider" type="submit" value="Ajouter"/>
			                        		<input name="srcCreate" type="hidden" value="2"/> 
			                        	</td>
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