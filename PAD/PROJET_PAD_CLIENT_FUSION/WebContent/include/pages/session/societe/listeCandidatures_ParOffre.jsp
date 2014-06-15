<%@page import="java.util.Vector"%>
<%
	Societe s = (Societe) session.getAttribute("societe");

	if (s != null) {
		int[] derouler = (int[]) session.getAttribute("derouler");
		Vector<String> src = new Vector<String>();
		OffreManager om = (OffreManager) context.lookup("OffreManager");
		CandidatureManager cm = (CandidatureManager) context.lookup("CandidatureManager");
		CandidatManager c = (CandidatManager) context.lookup("CandidatManager");

		ArrayList<Offre> listeOffre = null;
		listeOffre = om.recherche_List_Offre("", s.getIdsociete(), -1,"", "");
		
		if (listeOffre.size() > 0) {
			
		if (derouler == null) {
			derouler = new int[listeOffre.size()];
			for (int i = 0; i < listeOffre.size(); i++)
				derouler[i] = 0;
		}

		if (request.getParameter("indice") != null) {
			int temp = Integer.parseInt(request.getParameter("indice"));
			derouler[temp] = Math.abs(derouler[temp] - 1);
		}
		int cmp = 0;
		int cmp1 = 0;
		
%>
<table width="688" align="center">
<tr align="center">
                                        <td class="txt_1" colspan="4"><br /><b>LISTE DES OFFRES AVEC DETAIL DES CANDIDATURES</b><br /><br /></td>
                                    </tr>
	<tr>
		<td align="left" width="250" class="txt_1">Offres</td>
		<td align="left" width="114" class="txt_1">Date</td>
		<td align="center" width="164" class="txt_1">D&eacute;cision</td>
	</tr>
	<%
		int u = 0;
			while (u < listeOffre.size()) {
				String lienImage;
				if (derouler[u] == 0)
					lienImage = "images/pct_plus_up.gif";
				else
					lienImage = "images/pct_moins.gif";
	%>
	<tr <%if ((cmp % 2) == 0) {%> bgcolor="#5A5B5B" <%}
					cmp++;%>>
		<td colspan="4" ><b><a href="Recruteur.jsp?id=5&indice=<%=u%>#contenu" class="txt_1"> <img
			height="9" width="9" alt="plus" src="<%=lienImage%>" /> <%=listeOffre.get(u).getTitreOffre()%> </a></b>
		</td>
	</tr>
	<%
		if (derouler[u] == 1) {
					ArrayList<Candidature> listeCandidature = null;
					listeCandidature = cm.listeCandidaturesParOffre(listeOffre.get(u).getIdoffre());
					int v = 0;
					while (v < listeCandidature.size()) {
						Candidature cdture = listeCandidature.get(v);
						Candidat cdt = c.rechercherCandidat(cdture.getIdcandidat().getIdcandidat());
						String libelle = "Candidature " + cdt.getNom()+ " " + cdt.getPrenom();
	%>
	<tr <%if ((cmp1 % 2) == 0) {%> <%}
							cmp++;%>>
		<% 	//Recruteur.jsp?id=2
			String url1 = "Recruteur.jsp?id=2&idcandidat="
									+ cdt.getIdcandidat() + "&idcandidature="
									+ cdture.getIdcandidature()+"#contenu";
		%>
		<td>&nbsp;&nbsp;&nbsp;&nbsp;<a href="<%=url1%>" class="txt_2"><%=libelle%></a></td>
		<td class="txt_2"><%=cdture.getDate()%></td>
		<%
		
			if (!cdture.getDecision().equalsIgnoreCase("Accepted") && !cdture.getDecision().equalsIgnoreCase("Refused")) {
		%>
		<td width="140" align="center"><a href="Recruteur.jsp?id=6&idcandidat=<%=cdt.getIdcandidat()%>&idcandidature=<%=cdture.getIdcandidature()%>#contenu" class="txt_2">REPONDRE</a></td>

		<%
			} else {
		%>
		<td width="140" align="center" class="txt_2"><%=cdture.getDecision()%></td>
		<%
			}
		%>
	</tr>
	<%
		v++;
					}
				}
				u++;
			}
			session.setAttribute("derouler", derouler);
	%>
</table>
<%
	}
	else {%>
		<center>
		  <div class="info_log_1">Aucune candidature enregistr&eacute;e pour l'instant</div></center>
	<%}
	%>
    
    <%
	} else {
		//session expirée
		response.sendRedirect(response
				.encodeRedirectURL("Recruteur.jsp"));
	}
%>
