<%@include file="../../fonctions/init_context.jsp" %>
<%@page import="ressources.ClassPagination"%>
<%@page import="java.util.Vector"  %>
<% 
	OffreManager offreManag = (OffreManager)context.lookup("OffreManager");
	ArrayList<Offre> listeOffre = null; 
	Vector<Vector<String>> V;
	Vector<String> V2 = new Vector<String>();
	int nbElementParPage = 2;
%>
<table width="668" height="139" align="center">
    <tr align="center">
        <td height="30"><h3>Resultat recherche</h3></td>
    </tr>
    <tr>
        <td>
            <table width="592" align="center">
                <tr>
                    <td width="200"><b>Titre</b></td><td width="100"><b>Date de l'offre</b></td><td width="179"><b>Societe</b></td><td width="97"></td>
                </tr>
                <%
                int PageEnCour = Integer.parseInt(request.getParameter("min"));
                System.out.println("nbElementParPage*(PageEnCour-1)="+nbElementParPage*(PageEnCour-1));
                listeOffre = offreManag.recherche_List_Offre(request.getParameter("titre"), Integer.parseInt(request.getParameter("societe")), 
                											Integer.parseInt(request.getParameter("formation")), request.getParameter("date_D"),
						  									request.getParameter("date_F"));
				

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
                			%> bgcolor="#CCCCCC" <% 
                		} cmp++;
                		
                		%>
                >
                	<% String url = "index.jsp?id=17&o="+listeOffre.get(u).getIdoffre(); 
                	   String url1 = "index.jsp?id=23&o="+listeOffre.get(u).getIdoffre();
                	%>
                    <td><a href="<%=url1 %>"><%= listeOffre.get(u).getTitreOffre() %></a></td>
                    <td><%= listeOffre.get(u).getDateOffre() %></td>
                    <td><%= listeOffre.get(u).getIdsociete().getRaisonSocial() %></td>
                    <td>
                    
                    <a href ="<%=url %>">postuler</a></td>
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
                            pageContext.getOut().print("<b>"+V2.elementAt(1)+"</b>");
			}else{
                            pageContext.getOut().print("<a href=\"index.jsp?id=14&min="+V2.elementAt(0)+
                                    "&titre="+request.getParameter("titre")+
                                    "&formation="+request.getParameter("formation")+
                                    "&date_D="+request.getParameter("date_D")+
                                    "&date_F="+request.getParameter("date_F")+
                                    "&societe="+request.getParameter("societe")+
                                    "\">"+V2.elementAt(1)+"</a>");
			}
                    }
                    pageContext.getOut().print(" ");
		}
             }
                %></td>
                </tr>
            </table>
                
        </td>
    </tr>
</table>