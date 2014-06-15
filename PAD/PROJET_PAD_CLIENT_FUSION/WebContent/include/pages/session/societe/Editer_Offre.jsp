          <%@page import="servlet.sEditOffre"%>
          <%
           	Societe s = (Societe)session.getAttribute("societe");
           	
           	if (s !=null) {
				OffreManager om = (OffreManager) context.lookup("OffreManager");
           	Offre o = om.rechercher(Integer.parseInt(request.getParameter("idOffre")));
				session.setAttribute("offre", o);
           	%>
                <br />
                         	<form name="formEdit_Offre" action="sEditOffre" method="POST">
		<table width="500" align="center">
        <tr align="center">
                                        <td class="txt_1" colspan="2"><b>MODIFICATION OFFRE</b><br /><br /></td>
                                    </tr>
			<tr>
				<td class="txt_1">Titre</td>
				<td><input name="titreOffre" type="text" class="styleZoneTxt" value="<%=o.getTitreOffre()%>" /></td>
			</tr>
			<tr>
				<td class="txt_1">Date</td>
				<td><input name="dateOffre" type="text" class="styleZoneTxt" value="<%=sEditOffre.dateToString(o.getDateOffre())%>" /></td>
			</tr>
			<tr>
				<td class="txt_1">Soci&eacute;t&eacute;</td>
				<td><select name="societeOffre" style="width: 160px">
					<option value="-1" selected="selected"></option>
					<%
	                        				SocieteManager societeManag1 = (SocieteManager) context.lookup("SocieteManager");
	                                   	   ArrayList<Societe> listSociete1 = societeManag1.listeSociete();
	                                   	   
	                                         	
	                                             for(Societe s1: listSociete1){
	                                         %>
					<option value="<%= s1.getIdsociete() %>"
						<%if (s1.getIdsociete() == o.getIdsociete().getIdsociete()) {
	                                            	   %>
						selected="selected"
						<%
	                                               } %>>
					<%= s1.getRaisonSocial()%></option>
					<%
	                                             }
	                                             %>
				</select></td>
			</tr>

			<tr>
				<td class="txt_1">Domaine de comp&eacute;tence</td>
				<td><select name="formationOffre" style="width: 160px">
					<option value="-1" selected="selected"></option>
					<%
	                        				FormationManager formationManag1 = (FormationManager) context.lookup("FormationManager");
	                                   	   ArrayList<Formation> listFormation1 = formationManag1.listefFormation();
	                                   	   
	                                         	
	                                             for(Formation f1: listFormation1){
	                                         %>
					<option value="<%= f1.getIdformation() %>"
						<%if (o.getIdformation().getIdformation() == f1.getIdformation()){
	                                            	   %>
						selected="selected"
						<%
	                                               } %>>
					<%=f1.getLibelleFormation()%></option>
					<%
	                                             }
	                                             %>
				</select></td>
			</tr>
			<tr>
				<td class="txt_1">Publié</td>
				<td>
                	<select name="valide">
                    	<option value="1" <%if (o.getValide() == 1) {%>selected="selected"<%} %>>Oui</option>
                    	<option value="0" <%if (o.getValide() == 0) {%>selected="selected"<%} %>>Non</option>                        
                    </select>
                </td>
			</tr>
			<tr>
				<td valign="top" class="txt_1">Description</td>
				<td><textarea name="descriptionOffre" cols="40" rows="4"><%=o.getOffDescription()%></textarea>
				</td>
			</tr>
			
			
			
			<tr>
				<td colspan="2" align="center"><input name="valider" type="submit" value="Valider" /></td>
			</tr>

		</table>
        <input name="srcEdit" value="1" type="hidden"/>
		</form>
                        
            <%}
           	else {
				response.sendRedirect(response.encodeRedirectURL("Recruteur.jsp"));
				} %>
            
 