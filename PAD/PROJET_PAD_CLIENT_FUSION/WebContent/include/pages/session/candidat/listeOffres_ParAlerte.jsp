<%@page import="ressources.ClassPagination"%>
<%@page import="java.util.Vector"  %>
<% 
	HttpSession sessionCand = request.getSession();
   	Candidat c = (Candidat)sessionCand.getAttribute("candidat");
 
   	if (c !=null) {
   		int idAlerte = Integer.parseInt(request.getParameter("idA"));
   		OffreManager offreManag = (OffreManager)context.lookup("OffreManager");
   		AlerteManager alerteManag = (AlerteManager)context.lookup("AlerteManager"); 
   		Alerte a = alerteManag.rechercherAlerte(idAlerte);
   		ArrayList<Offre> listeOffre = null; 
   		Vector<Vector<String>> V;
   		Vector<String> V2 = new Vector<String>();
   		int nbElementParPage = nbElementTableau;
   		
   		if (a != null) { 
   		sessionCand.setAttribute("alerte", a);
   	
%>
<table width="668" height="139" align="center">
	<%
                int PageEnCour = Integer.parseInt(request.getParameter("min"));
                listeOffre = offreManag.listeOffre_ParAlerte(a.getMotcle());
				if (listeOffre.size()>0) {
	%>
    <tr align="center">
        <td height="30"><center><div id="h3_page1">Liste offres</div></center></td>
    </tr>
    <tr>
        <td>
            <table width="592" align="center">
                <tr>
                    <td width="265" class="txt_1">Titre</td>
                    <td width="91" class="txt_1">Date de l'offre</td>
                    <td width="151" class="txt_1">Societe</td>
                    <td width="65"></td>
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
                    <td class="txt_1"><%= listeOffre.get(u).getTitreOffre() %></td>
                    <td class="txt_1"><%= listeOffre.get(u).getDateOffre() %></td>
                    <td class="txt_1"><%= listeOffre.get(u).getIdsociete().getRaisonSocial() %></td>
                    <td align="center">
                    <% String url = "index.jsp?id=17&o="+listeOffre.get(u).getIdoffre()+"#contenu"; %>
                    <a href ="<%=url %>" class="txt_2">postuler</a></td>
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
				String str = "<span class=\"txt_1\"><a href=\"index.jsp?id=22&min="+V2.elementAt(0)+"&idA="+idAlerte+"#contenu\">"+V2.elementAt(1)+"</a></span>";
                            pageContext.getOut().print(str);
			}
                    }
                    pageContext.getOut().print(" ");
		}
             }
                %></td><td></td>
                </tr></table>
               </td>
    </tr>
                <%}	else {
					%>
					<tr align="center">
				        <td height="30" ><div class="info_log_1">Aucune offre ne correspond actuellement à cette alerte !</div></td>
				    </tr>
					<%
					
				}
				%>
        
</table>
<%}
           		else {
           			//cas ou l'idAlerte a été changé manuellement dans l'url
           			//erreur redirection vers confirmation_message
           			session.setAttribute("ok", 5);
				response.sendRedirect(response.encodeRedirectURL("index.jsp?id=19#contenu"));
           		}
           	}
           	else {
           		//session expirée
           		session.setAttribute("ok", 11);
				response.sendRedirect(response.encodeRedirectURL("index.jsp?id=19#contenu"));
           		
           	} %>