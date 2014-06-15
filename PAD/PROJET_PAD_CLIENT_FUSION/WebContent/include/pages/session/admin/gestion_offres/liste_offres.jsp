
  <%@page import="ressources.ClassPagination"%>
<%@page import="java.util.Vector"  %>          
            <%
            Admin adm = null;
            adm = ((Admin)session.getAttribute("admin"));
            if (adm != null) {
            
            	OffreManager offreManag = (OffreManager)context.lookup("OffreManager");
           		ArrayList<Offre> listeOffre = null; 
           		Vector<Vector<String>> V;
           		Vector<String> V2 = new Vector<String>();
           		int nbElementParPage = nbElementTableau;
            
            %>
              <table width="668" height="139" align="center">
                <%
                String min = request.getParameter("min");
                int PageEnCour = Integer.parseInt(min);
                String tri = request.getParameter("tri");
                String ordre = request.getParameter("ord");
                listeOffre = offreManag.listeOffres(tri,ordre);
				if (listeOffre.size()>0) {
	%>
                
    <tr>
        <td>
            <table width="632" align="center">
            <tr align="center">
                                        <td class="txt_1" colspan="6"><br /><b>LISTE DES OFFRES</b><br /><br /></td>
                                    </tr>
                <tr>
                    <td width="199">
                    	<%
                    		String url1 =""; 
                    		if (ordre.equals("DESC")) {
                    			url1 = "admin.jsp?id=40&tri=tt&min="+min+"&ord=ASC#contenu";
                    			%>
                    			<a href="<%=url1%>" class="txt_6"><b>Titre</b></a>
                    			<%
                    		}
                    		else if (ordre.equals("ASC")) {
                    			url1 = "admin.jsp?id=40&min="+min+"&tri=tt&ord=DESC#contenu";
                    			%>
                    			<a href="<%=url1%>" class="txt_6"><b>Titre</b></a>
                    			<%
                    		}
                    	%>
                    	
                    		
                    </td>
                    
                    <td width="75">
                    	<%
                    		String url2 = "";
                    		if (ordre.equals("DESC")) {
                    			url2 = "admin.jsp?id=40&tri=dt&ord=ASC&min="+min+"#contenu";
                    			%>
                    			<a href="<%=url2%>" class="txt_6"><b>Date</b></a>
                    			<%
                    		}
                    		else if (ordre.equals("ASC")) {
                    			url2 = "admin.jsp?id=40&tri=dt&ord=DESC&min="+min+"#contenu";
                    			%>
                    			<a href="<%=url2%>" class="txt_6"><b>Date</b></a>
                    			<%
                    		}
                    	%>
                    		
                    </td>
                    
                    <td width="181">
                    	<%
                    		String url3 = "";
                    		if (ordre.equals("DESC")) {
                    			url3 = "admin.jsp?id=40&tri=st&ord=ASC&min="+min+"#contenu";
                    			%>
                    			<a href="<%=url3%>" class="txt_6"><b>Soci&eacute;t&eacute;</b></a>
                    			<%
                    		}
                    		else if (ordre.equals("ASC")) {
                    			url3 = "admin.jsp?id=40&tri=st&ord=DESC&min="+min+"#contenu";
                    			%>
                    			<a href="<%=url3%>" class="txt_6"><b>Soci&eacute;t&eacute;</b></a>
                    			<%
                    		}
                    	%>
                    		
                    </td>
                    <td width="44" class="txt_1">Visible</td>
                </tr>
                
                <%
					ClassPagination ClPag = new ClassPagination();
                    String Page1;
                    int nbResult = listeOffre.size();
                    ClPag.Parametre(nbElementParPage, (PageEnCour-1), nbResult);

                    int cmp = 0;
                    int u = nbElementParPage*(PageEnCour-1);
                    while (u<listeOffre.size() && u<(nbElementParPage*(PageEnCour-1)+nbElementParPage)){
                %>
                <tr <% if((cmp % 2 ) == 0){
                			%> bgcolor="#5A5B5B" <% 
                		}
                		cmp++;
                		String url33 = "admin.jsp?id=43&min=1&idO="+listeOffre.get(u).getIdoffre()+"#contenu";
                		%>
                >
                    <td> <a href="<%=url33 %>" class="txt_2"><b><%= listeOffre.get(u).getTitreOffre() %></b></a></td>
                    <td class="txt_2"><%= listeOffre.get(u).getDateOffre() %></td>
                    <td align="left" class="txt_2"><%= listeOffre.get(u).getIdsociete().getRaisonSocial() %></td>
                    <td align="center" class="txt_2"><% if (listeOffre.get(u).getValide()==1) {%>Oui<%} else {%>Non<%}%></td>
                    
<%  String url11 = "admin.jsp?id=41&idO="+listeOffre.get(u).getIdoffre()+"#contenu"; 
                        			 String url22 = "admin.jsp?id=42&idO="+listeOffre.get(u).getIdoffre()+"#contenu"; 
                        			 
                        			 %>
                        			<td width="42" align="center"><a href="<%=url11%>" class="txt_2">Editer</a></td>
                        			<td width="63" align="center"><a href="<%=url22%>" class="txt_2">Supprimer</a></td>                   
                    
                </tr>
                <%
                u++;
                    }
                %>
                <tr align="center">
                	<td colspan="5"><%
                    
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
				String str = "<a href=\"admin.jsp?id=40&ord="+ordre+"&min="+V2.elementAt(0)+"&tri="+tri+"#contenu\" class=\"txt_2\">"+V2.elementAt(1)+"</a>";
                            pageContext.getOut().print(str);
			}
                    }
                    pageContext.getOut().print(" ");
		}
             }
                %></td>
				
                </tr>
                <% }
				else {
					%>
					<tr align="center">
				        <td colspan="5" align="center"><center><div id="h2_page1">Aucune offre ne correspond actuellement à cette alerte !</div></center></td>
					</tr>
					<%
					
				}
				%>
            </table>
                
        </td>
    </tr>
                </table>
                   
            <%
            	
            }
           	else {
           		//session expirée
           		response.sendRedirect(response.encodeRedirectURL("admin.jsp"));
           		} %>