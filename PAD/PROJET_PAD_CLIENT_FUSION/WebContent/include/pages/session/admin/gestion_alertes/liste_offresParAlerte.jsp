
<%@page import="ressources.ClassPagination"%>
<%@page import="java.util.Vector"  %>
            <%
            Admin adm = null;
            adm = ((Admin)session.getAttribute("admin"));
            if (adm != null) {
            	int idAlerte = Integer.parseInt(request.getParameter("idA"));
           		OffreManager offreManag = (OffreManager)context.lookup("OffreManager");
           		AlerteManager alerteManag = (AlerteManager)context.lookup("AlerteManager"); 
           		Alerte a = alerteManag.rechercherAlerte(idAlerte);
           		ArrayList<Offre> listeOffre = null; 
           		Vector<Vector<String>> V;
           		Vector<String> V2 = new Vector<String>();
           		int nbElementParPage = nbElementTableau;
            
           	%>
           
                <%
                if (a != null) { 
               		session.setAttribute("alerte", a);
                %>
                <table width="668" height="139" align="center">

	<%
                int PageEnCour = Integer.parseInt(request.getParameter("min"));
                listeOffre = offreManag.listeOffre_ParAlerte(a.getMotcle());
				if (listeOffre.size()>0) {
	%>
    
    <tr>
        <td>
          <table width="592" align="center">
          <tr align="center">
                                        <td class="txt_1" colspan="3"><br /><b>LISTE DES OFFRE</b><br />Mot clé : <%=a.getMotcle() %><br /><br /></td>
                                    </tr>
            
                <tr>
                    <td width="240" class="txt_1"><b>Titre</b></td>
                    <td width="86" class="txt_1"><b>Date</b></td>
                    <td width="250" class="txt_1"><b>Soci&eacute;t&eacute;</b></td>
                </tr>
                
                <%
					ClassPagination ClPag = new ClassPagination();
                    String Page1;
                    int nbResult = offreManag.listeOffre_ParAlerte_nb(a.getMotcle());
                    ClPag.Parametre(nbElementParPage, (PageEnCour-1), nbResult);

                    int cmp = 0;
                    int u = nbElementParPage*(PageEnCour-1);
                    while (u<listeOffre.size() && u<(nbElementParPage*(PageEnCour-1)+nbElementParPage)){
                %>
                <tr <% if((cmp % 2 ) == 0){
                			%> bgcolor="#5A5B5B" <% 
                		} cmp++;
                		
                		%>
                >
                    <td class="txt_2"><%= listeOffre.get(u).getTitreOffre() %></td>
                    <td class="txt_2"><%= listeOffre.get(u).getDateOffre() %></td>
                    <td class="txt_2"><%= listeOffre.get(u).getIdsociete().getRaisonSocial() %></td>
                    
                </tr>
                <%
                u++;
                    }
                %>
                <tr align="center">
                	<td colspan="3"><%
                    
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
				String str = "<a href=\"admin.jsp?id=38&min="+V2.elementAt(0)+"&idA="+idAlerte+"#contenu\" class=\"txt_2\">"+V2.elementAt(1)+"</a>";
                            pageContext.getOut().print(str);
			}
                    }
                    pageContext.getOut().print(" ");
		}
             }
                %></td>
                </tr>
                 </table>
                <%}
				else {
					%>
					<center>
				          <div class="info_log_1"><br /><br /> Aucune offre ne correspond actuellement &agrave; cette alerte !</div></center>
					<%
					
				}
				
                }
           		else {
           			//cas ou l'idAlerte a été changé manuellement dans l'url
           			//erreur redirection vers confirmation_message
           			session.setAttribute("okAd", 11);
					response.sendRedirect(response.encodeRedirectURL("admin.jsp?id=25#contenu"));
           		}
                %>
      </td>
    </tr>
</table>
            <%
            }
           	else {
           		//session expirée
           		response.sendRedirect(response.encodeRedirectURL("admin.jsp"));
           		} %>