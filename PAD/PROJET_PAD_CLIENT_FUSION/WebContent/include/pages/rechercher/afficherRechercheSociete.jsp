<%@page import="ressources.ClassPagination"%>
<%@page import="java.util.Vector"  %>
<% 
	
	CandidatManager CanMan = (CandidatManager) context.lookup("CandidatManager");
	ArrayList<Candidat> listeCand = null; 
	Vector<Vector<String>> V;
	Vector<String> V2 = new Vector<String>();
	int nbElementParPage = nbElementTableau;
	
	listeCand = CanMan.recherche_List_Candidat(request.getParameter("nomCand"),
			request.getParameter("prCand"), 
			Integer.parseInt(request.getParameter("formation")),
			request.getParameter("nvEtudes"), 
			request.getParameter("email"), 
			request.getParameter("keyWord"));
%>
<table width="668" height="139" align="center">
    <tr align="center">
        <td height="30"><div>R&eacute;sultat recherche Candidat</div><br /></td>
    </tr>
     <% if (listeCand.size() > 0) {%>
    <tr>
        <td>
            <table width="590" align="center">
                 <tr>
                    <td width="170"><span class="txt_0">Nom</span></td>
                    <td width="130"><span class="txt_0">Pr&eacute;nom</span></td>
                    <td width="187"><span class="txt_0">Formation</span></td><td width="83"></td>
                </tr>
                <%
                int PageEnCour = Integer.parseInt(request.getParameter("min"));
                	ClassPagination ClPag = new ClassPagination();
                    String Page1;
                    int nbResult = listeCand.size();
                    ClPag.Parametre(nbElementParPage, (PageEnCour-1), nbResult);

                    int cmp = 0;
                    int u = nbElementParPage*(PageEnCour-1);
                    while (u<listeCand.size() && u<(nbElementParPage*(PageEnCour-1)+nbElementParPage)){
                %>
                <tr <% if((cmp % 2 ) == 0){
                			%> bgcolor="#5A5B5B" <% 
                		} cmp++;
                		
                		%>
                >
                	<% String url = "Recruteur.jsp?id=2&idcandidat="+listeCand.get(u).getIdcandidat()+"#contenu";
	                    
                    
                	%>
                    <td><span class="txt_2"><%=listeCand.get(u).getNom()%></span></td>
                    <td><span class="txt_2"><%=listeCand.get(u).getPrenom()%></span></td>
                    <td><span class="txt_2"><%=listeCand.get(u).getIdformation().getLibelleFormation()%></span></td>
                    
                    <td align="center"><a href ="<%=url %>" class="txt_2">D&eacute;tail</a></td>
                </tr>
                <%
                u++;
                    }
                %>
                <tr>
                    <td colspan="4">&nbsp;</td>
                </tr>
                <tr align="center">
                	<td colspan="4" align="center"><%
                    
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
							//nomCand=&prCand=&formation=-1&nvEtudes=&keyWord=&email=&id=1
										pageContext.getOut().print("<span class=\"txt_1\"><a href=\"Recruteur.jsp?id=1&min="+V2.elementAt(0)+
												"&nomCand="+request.getParameter("nomCand")+
												"&prCand="+request.getParameter("prCand")+
												"&formation="+request.getParameter("formation")+
												"&nvEtudes="+request.getParameter("nvEtudes")+
												"&nvEtudes="+request.getParameter("nvEtudes")+
												"&keyWord="+request.getParameter("keyWord")+
												"&email="+request.getParameter("email")+
												"#contenu\">"+V2.elementAt(1)+"</a></span>");
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
    <%}
    else {%>
    	
    	<tr align="center">
        <td><div class="info_log_1">Aucun candidat trouvé ! </div></td>
    </tr>
    <%}
    			%>
</table>