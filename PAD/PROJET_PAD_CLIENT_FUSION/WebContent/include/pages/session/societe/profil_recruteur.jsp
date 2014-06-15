<%@page import="java.util.ArrayList"%>
<%

	Societe s = (Societe) session.getAttribute("societe");
	if (s !=null) {
%>

<br />
<table width="352" align="center">
  <tr>
  		<td width="106" class="txt_1">Raison sociale</td>
    	<td class="txt_2"><b><%=s.getRaisonSocial()%></b></td>
    </tr>
    <tr>
  		<td width="106" class="txt_1">Login</td>
    	<td class="txt_2"><%=s.getLogin()%></td>
    </tr>
<tr>
    	<td width="106" class="txt_1">T&eacute;l&eacute;phone</td><td width="234" class="txt_2"><%	if (!(""+s.getTel()).equals("null")){ out.print(s.getTel());} %></td>
    </tr>
    <tr>
    	<td class="txt_1">Adresse</td><td class="txt_2"><%	if (!(""+s.getAdresse()).equals("null")){ out.print(s.getAdresse());} %></td>
    </tr>
    <tr>
    	<td valign="top" class="txt_1">Description</td><td class="txt_2"><%	if (!(""+s.getDescription()).equals("null")){ out.print(s.getDescription());} %></td>
    </tr>
    <tr>
    	<td colspan="2" align="center"><br /><a href="Recruteur.jsp?id=4#contenu" class="txt_2">Editer</a></td>
   	</tr>
</table>
<br/><br/>

<%
	OffreManager OM = (OffreManager) context.lookup("OffreManager");
	CandidatureManager CM = (CandidatureManager) context.lookup("CandidatureManager");
%>

<table width="352" align="center">
<tr>
                                  <td>STATISTIQUES</td><td></td></tr>
                                  <tr><td></td><td></td></tr>
                        		<tr> 
	<tr>		
		<td width="282" class="txt_1">Nombre total offres publi&eacute;es</td>
		<td width="58" class="txt_2"><%=OM.recherche_List_Offre_nb("", s.getIdsociete(), -1, "",
							"")%></td>

	</tr>
	<tr>
		<td class="txt_1">Nombre total de candidatures re&ccedil;ues</td>
		<%
			ArrayList<Offre> listOffre = OM.recherche_List_Offre("", s
					.getIdsociete(), -1, "", "");
			int res = 0;
			for (Offre offre : listOffre) {
				res += CM.listeCandidaturesParOffre(offre.getIdoffre()).size();
			}
		%>
		<td class="txt_2"><%=res%></td>
	</tr>
</table>
   <%} else {
		//session expirée
		response.sendRedirect(response.encodeRedirectURL("Recruteur.jsp"));
	} %>