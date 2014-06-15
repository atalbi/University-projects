<%@page import="ressources.ClassPagination"%>
<%@page import="java.util.Vector"  %>            
            <%
            Admin adm = null;
            adm = ((Admin)session.getAttribute("admin"));
            if (adm != null) {
            
            	
           		Vector<Vector<String>> V;
           		Vector<String> V2 = new Vector<String>();
           		int nbElementParPage = nbElementTableau;
            %>
            <% AlerteManager alerteManag = (AlerteManager)context.lookup("AlerteManager"); 
                       	
                       	String min = request.getParameter("min");
                        int PageEnCour = Integer.parseInt(min);
                        String tri = request.getParameter("tri");
                       		ArrayList<Alerte> listeAlerte = null;
                       		String ordre = request.getParameter("ord");
                       		
                       		if (tri.equals("df")) {
                       			listeAlerte = alerteManag.listeAlertes(null, ordre);
                       		}
                       		else if (tri.equals("cd")) {
                       			listeAlerte = alerteManag.listeAlertes(new String("idcandidat"), ordre);
                       		}
                       		else if (tri.equals("mc")) {
                       			listeAlerte = alerteManag.listeAlertes(new String("motcle"), ordre);
                       		}
                       		%>
                       			
								<table width="668" height="139" align="center">
						   
								<tr>
								<td>
								
                        		<table width="537" align="center">
                        		<tr align="center">
                                        <td class="txt_1" colspan="5"><br /><b>LISTE DES ALERTES</b><br /><br /></td>
                                    </tr>
                        		<% if (listeAlerte.size()>=1) {
                        			int cLigne = 0;
                        		%>
                        		<tr>
                        			<td width="152">
                        				<%
				                    		String url11 =""; 
				                    		if (ordre.equals("DESC")) {
				                    			url11 = "admin.jsp?id=35&tri=mc&min="+min+"&ord=ASC#contenu";
				                    			%>
				                    			<a href="<%=url11%>" class="txt_6"><b>Mots clés</b></a>
				                    			<%
				                    		}
				                    		else if (ordre.equals("ASC")) {
				                    			url11 = "admin.jsp?id=35&min="+min+"&tri=mc&ord=DESC#contenu";
				                    			%>
				                    			<a href="<%=url11%>" class="txt_6"><b>Mots clés</b></a>
				                    			<%
				                    		}
				                    	%>
                        			
                        				
                        			</td>
                        			
                        			<td width="162">
                        			
                        				<%
				                    		String url22 =""; 
				                    		if (ordre.equals("DESC")) {
				                    			url22 = "admin.jsp?id=35&tri=cd&min="+min+"&ord=ASC#contenu";
				                    			%>
				                    			<a href="<%=url22%>" class="txt_6"><b>Candidats</b></a>
				                    			<%
				                    		}
				                    		else if (ordre.equals("ASC")) {
				                    			url22 = "admin.jsp?id=35&min="+min+"&tri=cd&ord=DESC#contenu";
				                    			%>
				                    			<a href="<%=url22%>" class="txt_6"><b>Candidats</b></a>
				                    			<%
				                    		}
				                    	%>
                        				
                        			</td>
                        		</tr>
                        		
                        		<%
					ClassPagination ClPag = new ClassPagination();
                    String Page1;
                    int nbResult = listeAlerte.size();
                    ClPag.Parametre(nbElementParPage, (PageEnCour-1), nbResult);

                    int cmp = 0;
                    int u = nbElementParPage*(PageEnCour-1);
                    while (u<listeAlerte.size() && u<(nbElementParPage*(PageEnCour-1)+nbElementParPage)){
                %>
                <tr <% if((cmp % 2 ) == 0){
                			%> bgcolor="#5A5B5B" <% 
                		} cmp++;
                		
                		%>
                >
                    <td class="txt_2"><%= listeAlerte.get(u).getMotcle() %></td>
                    <td class="txt_2"><%= listeAlerte.get(u).getIdcandidat().getNom() %> <%=listeAlerte.get(u).getIdcandidat().getPrenom()%></td>
                    
                    <% String url = "admin.jsp?id=36&idA="+listeAlerte.get(u).getIdalerte()+"#contenu"; 
                        			 String url1 = "admin.jsp?id=37&idA="+listeAlerte.get(u).getIdalerte()+"#contenu"; 
                        			 String url2 = "admin.jsp?id=38&min=1&idA="+listeAlerte.get(u).getIdalerte()+"#contenu";
                        			 %>
                        			<td width="38" align="center"><a href="<%=url %>" class="txt_2">Editer</a></td>
                        			<td width="63" align="center"><a href="<%=url1 %>" class="txt_2">Supprimer</a></td>
                        			<td width="98" align="center"><a href="<%=url2 %>" class="txt_2">Voir les offres</a></td>
                    
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
				String str = "<a href=\"admin.jsp?id=35&ord="+ordre+"&min="+V2.elementAt(0)+"&tri="+tri+"#contenu\" class=\"txt_2\">"+V2.elementAt(1)+"</a>";
                            pageContext.getOut().print(str);
			}
                    }
                    pageContext.getOut().print(" ");
		}
             }
                %></td>
                </tr>
                <%}
                       
                        		else {
                        			%><tr>
                        				<td colspan="5" align="center"><center>
						          <div class="info_log_1">Aucun alerte n'a encore cr&eacute;&eacute;e !</div></center></td>
                        			
                        			</tr><% 
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