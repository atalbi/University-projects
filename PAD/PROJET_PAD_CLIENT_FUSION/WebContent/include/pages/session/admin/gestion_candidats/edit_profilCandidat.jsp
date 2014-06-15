<%
            Admin adm = null;
            adm = ((Admin)session.getAttribute("admin"));
            
            if (adm != null) {
            
            	int idCd = Integer.parseInt(request.getParameter("idCd"));
           		CandidatManager candidatManag = (CandidatManager)context.lookup("CandidatManager"); 
           		Candidat c = candidatManag.rechercherCandidat(idCd);
           		
           		if (c != null) { 
            %>
                <table width="668" height="139" align="center">
						    
								<tr>
								<td>
								<form name="formEdit_Candidat" action="sEditProfil_Candidat" method="POST" enctype="multipart/form-data">
                        		<table  align="center">
                                    <tr align="center">
                                        <td class="txt_1" colspan="2"><br /><b>MODIFICATION PROFIL CANDIDAT</b><br /><br /></td>
                                    </tr>
                        		<tr>
                        			<td class="txt_1">Nom </td>
                        			<td><input name="nomCandid" type="text" class="styleZoneTxt"  align="right" value="<%=c.getNom()%>"/></td>
                        		
                        		</tr>
                        		<tr> 
                        			<td class="txt_1">Prénom</td>
                        			<td><input name="prenomCandid" type="text" class="styleZoneTxt" value="<%=c.getPrenom()%>"/></td>
                        		</tr>
                        		<tr>
                        			<td class="txt_1">Téléphone</td>
                        			<td><input name="telCandid" type="text" class="styleZoneTxt" value="<%if (c.getTel() != null) %><%=c.getTel()%>"/></td>
                        		</tr>
                        		
                        		<tr>
                        			<td class="txt_1">Etudes </td>
                        			<td><input name="etudeCandid" type="text" class="styleZoneTxt" value="<%if (c.getNiveauEtudes() != null) %><%=c.getNiveauEtudes()%>"/></td>
                        		</tr>
                        		
                        		<tr>
                        			<td class="txt_1">Email</td>
                        			<td><input name="emailCandid" type="text" class="styleZoneTxt" value="<%=c.getEmail()%>"/></td>
                        		</tr>
                        		
                        		<tr>
                        			<td class="txt_1">Mot de passe </td>
                        			<td><input name="passwordCandid" class="styleZoneTxt" type="password" value ="<%=c.getPassword()%>"/></td>
                        		</tr>
                        		<tr>
                        			<td class="txt_1">Valide </td>
                        			<td><input name="validCandid" class="styleZoneTxt" type="text" value ="<%=c.getValide()%>"/></td>
                        		</tr>
                        		<tr>
                        			<td class="txt_1">CV </td>
                        			<td><input name="cvCandid" type="file" class="styleZoneTxt" accept="application/pdf,application/msword" readonly="readonly"/></td>
                        		</tr>
                        		
                        		<tr>
                        			<td class="txt_1">Formation</td>
                        			<td>
                        				<select name="formationCandid" style="width:160px">
                        		<%
                                    FormationManager formManag = (FormationManager) context.lookup("FormationManager");
                              	   ArrayList<Formation> listForm = formManag.listefFormation();
                              	   
                                    	
                                        for(Formation f: listForm){
                                    %>
                        			<option value="<%=f.getIdformation()%>" <% if (f.getIdformation() == c.getIdformation().getIdformation()) {%>selected="selected"<%} %> ><%=f.getLibelleFormation() %></option>
                        			<%} %>
                        			</select>
                        			</td>
                        		</tr>
                        		
                        		<tr>
                        			<td class="txt_1">Observation</td>
                        			<td><textarea name="observCandid" cols="40" rows="4"/> <%=c.getObservation() %></textarea></td>
                        		</tr>
                        		
                        		<tr>
                        		<td colspan="2" align="center"><input name="btn" type="submit" value="Valider" /></td>
                        		</tr>
                        		
                        		</table>
                        		<input name="idCandidat" type="hidden" value="<%=c.getIdcandidat() %>" />
                        		<input name="srcEdit" type="hidden" value="2" />
                        		</form>
                        		</td>
                        		</tr>
                				</table>

            <%
           		}
           		else {
           			//cas ou l'idCandidat a été changé manuellement dans l'url
           			//erreur redirection vers confirmation_message
           			session.setAttribute("okAd", 20);
					response.sendRedirect(response.encodeRedirectURL("admin.jsp?id=25#contenu"));
           		}
            }
           	else {
           		//session expirée
           		response.sendRedirect(response.encodeRedirectURL("admin.jsp"));
           		} %>