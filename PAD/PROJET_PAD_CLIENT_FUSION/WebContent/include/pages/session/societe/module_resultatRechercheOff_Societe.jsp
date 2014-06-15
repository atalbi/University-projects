<%@page import="ressources.ClassPagination"%>
<%@page import="java.util.Vector"%>
<%
	OffreManager offreManag = (OffreManager) context.lookup("OffreManager");
	ArrayList<Offre> listeOffre = null;
	Vector<Vector<String>> V;
	Vector<String> V2 = new Vector<String>();
	int nbElementParPage = nbElementTableau;
	String min = request.getParameter("min");
	int PageEnCour = Integer.parseInt(min);
				
	if(request.getParameter("tt") != null){
		out.println("<center><div class=\"error_log_1\">En attente de la validation de l'administrateur</div></center>");
	}
	
	Societe soci = (Societe) session.getAttribute("societe");
	
	if (soci != null) {
%>
<table width="668" height="139" align="center">

<% 
listeOffre = offreManag.recherche_List_Offre_valide_or_not("",soci.getIdsociete(), -1, "", "");
if (listeOffre.size() > 0) {
	
	
	
	%>
	
	<tr>
		<td>
		<table width="565" align="center">
        <tr align="center">
                                        <td class="txt_1" colspan="6"><br /><b>LISTE DES OFFRES PUBLIEES</b><br /><br /></td>
                                    </tr>
			<tr>
				<td width="216" class="txt_0">Titre</td>
				<td width="79" class="txt_0">Date</td>
				<td width="86" class="txt_0">Candidatures</td>
                <td width="49"  class="txt_0">Visible</td>
			</tr>
			<%
				
				ClassPagination ClPag = new ClassPagination();
				String Page1;
				int nbResult = listeOffre.size();
				ClPag.Parametre(nbElementParPage, (PageEnCour - 1), nbResult);

				int cmp = 0;
				int u = nbElementParPage * (PageEnCour - 1);
				while (u < listeOffre.size() && u < (nbElementParPage * (PageEnCour - 1) + nbElementParPage)) {
			%>
			<tr <%if ((cmp % 2) == 0) {%> bgcolor="#5A5B5B" <%}
				cmp++;%>>
			  <%
					String url1 = "Recruteur.jsp?id=8&o="+ listeOffre.get(u).getIdoffre()+"#contenu";
				%>
				<td><a href="<%=url1%>" class="txt_2"><%=listeOffre.get(u).getTitreOffre()%></a></td>
				<td class="txt_2"><%=listeOffre.get(u).getDateOffre()%></td>
			  <%
				CandidatureManager cdtureManager=(CandidatureManager)context.lookup("CandidatureManager");
				int taille =cdtureManager.listeCandidaturesParOffre(listeOffre.get(u).getIdoffre()).size();
				%>
				<td align="center" class="txt_2"><%=taille%></td>
                <td align="center" class="txt_2"><% if (listeOffre.get(u).getValide()==1) {%>Oui<%} else {%>Non<%}%></td>
				<td width="42" align="center"><a href="Recruteur.jsp?id=10&idOffre=<%=listeOffre.get(u).getIdoffre()%>#contenu" class="txt_2">Editer</a></td>
				<td width="65" align="center"><a href="Recruteur.jsp?id=11&idOffre=<%=listeOffre.get(u).getIdoffre()%>#contenu" class="txt_2">Supprimer</a></td>
			</tr>
			<%
				u++;
				}
			%>
			<tr align="center">
				<td colspan="6">
				<%
							                    
							                	V = ClPag.Pages();
							                    
							            if( V.size() !=  1){
							                for(int i = 0 ; i < V.size(); i++){
							                    
							                    V2 = (Vector<String>) V.elementAt(i);
							                    Page1 = (String) V2.elementAt(1);
							                    if(V2.elementAt(0).equals("")){ // si le pointeur ds les 3 point
										pageContext.getOut().print(V2.elementAt(1));
							                    }else{
										if(Page1.equals(""+PageEnCour)){// si le pointeur ds la page courante
							                            pageContext.getOut().print("<span class=\"txt_1\"><b>"+V2.elementAt(1)+"</b></span>");
										}else{
											String str = "<span><a href=\"Recruteur.jsp?id=7&min="+V2.elementAt(0)+"#contenu\" class=\"txt_2\">"+V2.elementAt(1)+"</a></span>";
							                            pageContext.getOut().print(str);
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
            <% }
			else { %>
				<tr> 
	                        		<td height="30" align="center"><center>
	                        		  <div class="info_log_1">Aucune offre publi&eacute;e pour l'instant</div></center></td>
   		  </tr>
			<%}

%>
		
</table>

<% }

else {
	response.sendRedirect(response.encodeRedirectURL("Recruteur.jsp"));
	}
%>