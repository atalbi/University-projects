<%@include file="../../../fonctions/init_context.jsp"%>
<%@page import="ressources.ClassPagination"%>
<%@page import="java.util.Vector"%>
<%
	HttpSession sessionSocI = request.getSession();

	ArrayList<Candidat> listeCand = (ArrayList<Candidat>) sessionSocI
			.getAttribute("listeCand");
	Vector<Vector<String>> V;
	Vector<String> V2 = new Vector<String>();
	int nbElementParPage = 2;
%>
<table width="668" height="139" align="center">
	<tr align="center">
		<td height="30">
		<h3>Resultat recherche Candidat</h3>
		</td>
	</tr>
	<tr>
		<td>
		<table width="592" align="center">
			<tr>
				<td width="200"><b>Nom</b></td>
				<td width="100"><b>Prenom</b></td>
				<td width="179"><b>Formation</b></td>
			</tr>
			<%
				int PageEnCour = Integer.parseInt(request.getParameter("min"));
				System.out.println("nbElementParPage*(PageEnCour-1)="
						+ nbElementParPage * (PageEnCour - 1));

				ClassPagination ClPag = new ClassPagination();
				String Page1;
				int nbResult = listeCand.size();
				ClPag.Parametre(nbElementParPage, (PageEnCour - 1), nbResult);

				int cmp = 0;
				int u = nbElementParPage * (PageEnCour - 1);
				while (u < listeCand.size()
						&& u < (nbElementParPage * (PageEnCour - 1) + nbElementParPage)) {
			%>
			<tr <%if ((cmp % 2) == 0) {%> bgcolor="#CCCCCC" <%}
				cmp++;%>>
				<%
					String url = "index.jsp?id=60&c="
								+ listeCand.get(u).getIdcandidat() +"&re=-1";
				%>
				<td><%=listeCand.get(u).getNom()%></td>
				<td><%=listeCand.get(u).getPrenom()%></td>
				<td><%=listeCand.get(u).getIdformation()
								.getLibelleFormation()%></td>
				<td><a href="<%=url%>">Voir fiche Candidat</a></td>
			</tr>
			<%
				u++;
				}
			%>
			<tr align="center">
				<td colspan="3">
				<%
					V = ClPag.Pages();

					if (V.size() != 1) {
						for (int i = 0; i < V.size(); i++) {

							V2 = (Vector<String>) V.elementAt(i);
							Page1 = (String) V2.elementAt(1);
							if (V2.elementAt(0).equals("")) { // si le pointeur ds les 3 point
								pageContext.getOut().print(V2.elementAt(1));
							} else {
								if (Page1.equals("" + PageEnCour)) {// si le pointeur ds la page courante
									pageContext.getOut().print(
											"<b>" + V2.elementAt(1) + "</b>");
								} else {
									pageContext.getOut().print(
											"<a href=\"index.jsp?id=66&min="
													+ V2.elementAt(0) + "\">"
													+ V2.elementAt(1) + "</a>");
								}
							}
							pageContext.getOut().print(" ");
						}
					}
				%>
				</td>
			</tr>
		</table>

		</td>
	</tr>
</table>