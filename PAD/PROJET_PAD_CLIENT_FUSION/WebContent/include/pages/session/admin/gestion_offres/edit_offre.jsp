<%@page import="servlet.sEditOffre"%>
<%
            Admin adm = null;
            adm = ((Admin)session.getAttribute("admin"));
            
            if (adm != null) {
            
            	int idOffre = Integer.parseInt(request.getParameter("idO"));
           		OffreManager offreManag = (OffreManager)context.lookup("OffreManager"); 
           		Offre o = offreManag.rechercher(idOffre);
           		
           		if (o != null) { 
           		session.setAttribute("offre", o);
            %>

<table width="668" height="139" align="center">
		<tr>
		<td>
		<form name="formEdit_Offre" action="sEditOffre" method="POST">
		<table width="500" align="center">
        <tr align="center">
                                        <td class="txt_1" colspan="2"><br /><b>MODIFICATION OFFRE</b><br /><br /></td>
                                    </tr>
        <tr><td></td><td></td></tr>
                                <tr><td></td><td></td></tr>
                                <tr><td></td><td></td></tr>
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
	                        				SocieteManager societeManag = (SocieteManager) context.lookup("SocieteManager");
	                                   	   ArrayList<Societe> listSociete = societeManag.listeSociete();
	                                   	   
	                                         	
	                                             for(Societe s: listSociete){
	                                         %>
					<option value="<%= s.getIdsociete() %>"
						<%if (s.getIdsociete() == o.getIdsociete().getIdsociete()) {
	                                            	   %>
						selected="selected"
						<%
	                                               } %>>
					<%= s.getRaisonSocial()%></option>
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
	                        				FormationManager formationManag = (FormationManager) context.lookup("FormationManager");
	                                   	   ArrayList<Formation> listFormation = formationManag.listefFormation();
	                                   	   
	                                         	
	                                             for(Formation f: listFormation){
	                                         %>
					<option value="<%= f.getIdformation() %>"
						<%if (o.getIdformation().getIdformation() == f.getIdformation()){
	                                            	   %>
						selected="selected"
						<%
	                                               } %>>
					<%=f.getLibelleFormation()%></option>
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
				<td><textarea name="descriptionOffre" cols="40" rows="5"><%=o.getOffDescription()%></textarea>
				</td>
			</tr>
			
			
			
			<tr>
				<td colspan="2" align="center"><input name="valider" type="submit" value="Valider" /></td>
			</tr>

		</table>
        <input name="srcEdit" value="2" type="hidden"/>
		</form>
		</td>
	</tr>
</table>
<%
           		}
           		else {
           			//cas ou l'idOffre a été changé manuellement dans l'url
           			//erreur redirection vers confirmation_message
           			session.setAttribute("okAd", 13);
					response.sendRedirect(response.encodeRedirectURL("admin.jsp?id=25#contenu"));
           		}
            }
           	else {
           		//session expirée
           		response.sendRedirect(response.encodeRedirectURL("admin.jsp"));
           		} %>