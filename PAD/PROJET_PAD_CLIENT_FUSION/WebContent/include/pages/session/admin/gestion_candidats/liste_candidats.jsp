
<%@page import="ressources.ClassPagination"%>
<%@page import="java.util.Vector"  %>             
            <%
            Admin adm = null;
            adm = ((Admin)session.getAttribute("admin"));
            
            if (adm != null) {
            	Vector<Vector<String>> V;
           		Vector<String> V2 = new Vector<String>();
           		int nbElementParPage = nbElementTableau;
           		
           		String min = request.getParameter("min");
                int PageEnCour = Integer.parseInt(min);
                String tri = request.getParameter("tri");
                String ordre = request.getParameter("ord");
            %>
           
                <table width="668" height="139" align="center">
                     		
                        		<tr> 
	                        		<td>
	                        		<% 
	                        		CandidatManager candidatManag = (CandidatManager)context.lookup("CandidatManager"); 
	                           		ArrayList<Candidat> listeCandidats = candidatManag.listeCandidat(tri,ordre);
	                        		
	                        		if (listeCandidats.size()>0 ) {
	                        			%>
	                                		<table width="614" align="center">
                                            <tr align="center">
                                        <td class="txt_1" colspan="6"><br /><b>LISTE DES CANDIDATS</b><br /><br /></td>
                                    </tr>
	                                		<tr> 
				                        		<td width="147" >
				                        		
				                        			<%
							                    		String url =""; 
							                    		if (ordre.equals("DESC")) {
							                    			url = "admin.jsp?id=53&tri=np&min="+min+"&ord=ASC#contenu";
							                    			%>
							                    			<a href="<%=url%>" class="txt_6"><b>Noms</b></a>
							                    			<%
							                    		}
							                    		else if (ordre.equals("ASC")) {
							                    			url = "admin.jsp?id=53&tri=np&min="+min+"&ord=DESC#contenu";
							                    			%>
							                    			<a href="<%=url%>" class="txt_6"><b>Noms</b></a>
							                    			<%
							                    		}
							                    	%>
				                        		</td>
				                        		<td width="138">
				                        		
				                        			<%
							                    		String url1 =""; 
							                    		if (ordre.equals("DESC")) {
							                    			url1 = "admin.jsp?id=53&tri=ft&min="+min+"&ord=ASC#contenu";
							                    			%>
							                    			<a href="<%=url1%>" class="txt_6"><b>Formations</b></a>
							                    			<%
							                    		}
							                    		else if (ordre.equals("ASC")) {
							                    			url1 = "admin.jsp?id=53&tri=ft&min="+min+"&ord=DESC#contenu";
							                    			%>
							                    			<a href="<%=url1%>" class="txt_6"><b>Formations</b></a>
							                    			<%
							                    		}
							                    	%>
				                        		</td>
				                        		<td width="125" class="txt_1"><b>Niveaux d'étude</b></td>
				                        		<td width="66" class="txt_1"><b>Validité</b></td>
			                        		</tr>
			                        		
			                        		<%
					ClassPagination ClPag = new ClassPagination();
                    String Page1;
                    int nbResult = listeCandidats.size();
                    ClPag.Parametre(nbElementParPage, (PageEnCour-1), nbResult);

                    int cmp = 0;
                    int u = nbElementParPage*(PageEnCour-1);
                    while (u<listeCandidats.size() && u<(nbElementParPage*(PageEnCour-1)+nbElementParPage)){
                %>
			                        		
			                        			                                		
	                                		<tr <% if((cmp % 2 ) == 0){
						                			%> bgcolor="#5A5B5B" <% 
						                		}
	                                			cmp++;
						                		String url2 = "admin.jsp?id=52&idCd="+listeCandidats.get(u).getIdcandidat()+"#contenu";
						                		String url3 = "admin.jsp?id=51&idCd="+listeCandidats.get(u).getIdcandidat()+"#contenu";
						                		String url4 = "admin.jsp?id=55&idCd="+listeCandidats.get(u).getIdcandidat()+"#contenu";
						                		%>
	                                		> 
	                                		<td ><a href="<%=url4%>" class="txt_2"><b><%=listeCandidats.get(u).getNom() %> <%=listeCandidats.get(u).getPrenom() %></b></a></td>
	                                		<td class="txt_2"><%=listeCandidats.get(u).getIdformation().getLibelleFormation() %></td>
	                                		<td class="txt_2"><%if (listeCandidats.get(u).getNiveauEtudes()!=null) {%><%=listeCandidats.get(u).getNiveauEtudes() %><%}%></td>
	                                		
	                                			 <td align="center" class="txt_2"><%if (listeCandidats.get(u).getValide()==1) {%>oui<%} else {%>non<%}%></td>
                                			  <td width="42" align="center"><a href="<%=url2%>" class="txt_2">Editer</a></td>
	                                			<td width="68" align="center"><a href="<%=url3%>" class="txt_2">Supprimer</a></td>
	                                		</tr>
	                                		<%
							                u++;
							                    }
							                %>
							                 <tr align="center">
							                	<td colspan="6"><%
							                    
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
						String str = "<span><a href=\"admin.jsp?id=53&ord="+ordre+"&min="+V2.elementAt(0)+"&tri="+tri+"#contenu\" class=\"txt_2\">"+V2.elementAt(1)+"</a></span>";
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