<%@page import="ressources.ClassPagination"%>
<%@page import="java.util.Vector"  %>
<% 
	OffreManager offreManag = (OffreManager)context.lookup("OffreManager");
	ArrayList<Offre> listeOffre = null; 
	Vector<Vector<String>> V;
	Vector<String> V2 = new Vector<String>();
	int nbElementParPage = nbElementTableau;
	
	listeOffre = offreManag.recherche_List_Offre(request.getParameter("titre"), Integer.parseInt(request.getParameter("societe")), 
			Integer.parseInt(request.getParameter("formation")), request.getParameter("date_D"),
				request.getParameter("date_F"));
%>
<table width="668" height="139" align="center">
    <tr align="center">
        <td height="30"><div id="h3_page1">Résultat recherche offre</div><br /><br /></td>
    </tr>
    <% if (listeOffre.size() > 0) {%>
    <tr>
        <td>
            <table width="592" align="center">
                 <tr>
                    <td width="200"><span class="txt_0">Titre</span></td><td width="100"><span class="txt_0">Date de l'offre</span></td><td width="179"><span class="txt_0">Societe</span></td><td width="97"></td>
                </tr>
                <%
                int PageEnCour = Integer.parseInt(request.getParameter("min"));
                	ClassPagination ClPag = new ClassPagination();
                    String Page1;
                    int nbResult = offreManag.recherche_List_Offre_nb(request.getParameter("titre"), Integer.parseInt(request.getParameter("societe")), 
							Integer.parseInt(request.getParameter("formation")), request.getParameter("date_D"),
							request.getParameter("date_F"));
                    ClPag.Parametre(nbElementParPage, (PageEnCour-1), nbResult);

                    int cmp = 0;
                    int u = nbElementParPage*(PageEnCour-1);
                    while (u<listeOffre.size() && u<(nbElementParPage*(PageEnCour-1)+nbElementParPage)){
                %>
                <tr <% if((cmp % 2 ) == 0){
                			%> bgcolor="#5a5b5b" <% 
                		} cmp++;
                		
                		%>
                >
                	<% String url = "index.jsp?id=17&o="+listeOffre.get(u).getIdoffre()+"#contenu"; 
	                    //typeIdent indique que c'est une connexion candidat
	                    //o indique l'idenifiant de l'offre
	                   
                    
                	   String url1 = "index.jsp?id=23&o="+listeOffre.get(u).getIdoffre()+"#contenu"; //o indique l'idenifiant de l'offre
                	%>
                    <td><a href="<%=url1 %>" class="txt_2"><%= listeOffre.get(u).getTitreOffre() %></a></td>
                    <td><span class="txt_1"><%= listeOffre.get(u).getDateOffre() %></span></td>
                    <td><span class="txt_1"><%= listeOffre.get(u).getIdsociete().getRaisonSocial() %></span></td>
                    
                    <td><a href ="<%=url %>" class="txt_2">postuler</a></td>
                </tr>
                <%
                u++;
                    }
                %>
                <tr>
                    <td colspan="4">&nbsp;</td>
                </tr>
                <tr align="center">
                	<td colspan="3" align="right"><%
                    
                	V = ClPag.Pages();
                    
            if( V.size() !=  1){
                for(int i = 0 ; i < V.size(); i++){
                    
                    V2 = (Vector<String>) V.elementAt(i);
                    Page1 = (String) V2.elementAt(1);
                    if(V2.elementAt(0).equals("")){ // si le pointeur ds les 3 point
						pageContext.getOut().print("<span class=\"txt_1\">"+V2.elementAt(1)+"</span>");
                    }else{
						if(Page1.equals(""+PageEnCour)){// si le pointeur ds la page courante
										pageContext.getOut().print("<span class=\"txt_1\">"+"<b>"+V2.elementAt(1)+"</b></span>");
						}else{
										pageContext.getOut().print("<span class=\"txt_1\"><a href=\"index.jsp?id=1&min="+V2.elementAt(0)+
												"&titre="+request.getParameter("titre")+
												"&formation="+request.getParameter("formation")+
												"&date_D="+request.getParameter("date_D")+
												"&date_F="+request.getParameter("date_F")+
												"&societe="+request.getParameter("societe")+
												"#contenu\">"+V2.elementAt(1)+"</a></span>");
						}
                    }
                    pageContext.getOut().print(" ");
		}
             }
                %></td><td></td>
                </tr>
                </table>
                
        </td>
    </tr>
                <%}
    else {%>
    	
    	<tr align="center">
        <td><div class="info_log_1">Aucune offre trouvée ! </div></td>
    </tr>
    <%}
    			%>
            
</table>