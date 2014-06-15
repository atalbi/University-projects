<%@page import="servlet.sDownload"%>
<%
	int idCandidature;
	Candidature candidature = null;

	if (session.getAttribute("societe") == null) {
		out
				.println("<br><center><div class=\"error_log_1\"><b>Veuillez vous identifiez !!!!!</b></center></div>");
	} else {

		if (request.getParameter("idcandidature") != null) {
			idCandidature = Integer.parseInt(""+ request.getParameter("idcandidature"));
			CandidatureManager ctureM = (CandidatureManager) context.lookup("CandidatureManager");
			candidature = ctureM.rechercher(idCandidature);
		}

		int idCandidat = Integer.parseInt(""+ request.getParameter("idcandidat"));
		CandidatManager cm = (CandidatManager) context.lookup("CandidatManager");
		Candidat candidat = cm.rechercherCandidat(idCandidat);
		
		if (candidat != null) {
%>

<br />
<table width="668" height="139"
	align="center">
	<tr align="center">
		<td class="txt_1"><b>		
		<%if (candidature != null) {%>
		DETAIL CANDIDATURE
		  <%} else {%>
		  FICHE CANDIDAT
		  <%} %>
		</b><br /><br />
		</td>
	</tr>

	<tr>
		<td>

		<table width="460" align="center">

			<tr>
				<td width="109" class="txt_1">Nom</td>
				<td width="457" class="txt_2"><%=candidat.getNom()%></td>
			</tr>

			<tr>
				<td height="23" class="txt_1">Pr&eacute;nom</td>
			  <td class="txt_2"><%=candidat.getPrenom()%></td>
			</tr>

			<tr>
				<td class="txt_1">Formation</td>
				<td class="txt_2"><%=candidat.getIdformation().getLibelleFormation()%></td>
			</tr>
			<tr>
				<td class="txt_1">Niveau d'etude</td>
				<td class="txt_2"><%=candidat.getNiveauEtudes()%></td>
			</tr>
			<tr>
				<td class="txt_1">Email</td>
				<td class="txt_2"><%=candidat.getEmail()%></td>
			</tr>
			<tr>
				<td class="txt_1">CV</td>
				<td class="txt_2">
				<form action="sDownload" method="post" name="form_CV" class="form">
				<table>
				<tr>
					<td><input type="submit" value="  Télécharger  " 
							<%if (candidat.getCv() == null || candidat.getCv().equals(null) || 
									candidat.getCv().equalsIgnoreCase("null") || candidat.getCv().equalsIgnoreCase("")) {%>disabled="disabled"<%} %>/></td>
					<td><input name="cv" type="hidden"  value="<%= candidat.getCv()%>"/></td>
					</tr>
					</table>					
					</form>
				</td>
			</tr>
			<tr>
				<td valign="top" class="txt_1">Observations</td>
			  <td class="txt_2"><%if (candidat.getObservation() != null) %><%=candidat.getObservation() %></td>
			</tr>
			<%
				if (candidature != null) {
			%>
			<tr>
				<td valign="top" class="txt_1">Motivations</td>
			  <td class="txt_2"><%=candidature.getObservation()%></td>
			</tr>
			<%
				}
			%>
		</table>
		</td>
	</tr>
</table>
<%
	request.removeAttribute("iscandidat");
		} else {
			//cas ou l'idcandidat a été changé manuellement dans l'url
			//erreur redirection vers confirmation_message
			session.setAttribute("ok", 6);
			response.sendRedirect(response.encodeRedirectURL("index.jsp?id=19"));
		}
%>


<%
	} // fin else
%>