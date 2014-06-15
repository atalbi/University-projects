
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
	                        		<td></td>
                        		</tr>
                        		
                        		<tr> 
	                        		<td>
	                        		<% 
	                        		SocieteManager societeManag = (SocieteManager)context.lookup("SocieteManager"); 
	                           		ArrayList<Societe> listeSocietes = societeManag.listeSociete(tri,ordre);
	                        		
	                        		if (listeSocietes.size()>0 ) {
	                        			%>
	                                		<table width="523" align="center">
                                            <tr align="center">
                                        <td class="txt_1" colspan="5"><br /><b>LISTE DES SOCIETES RECRUTEUR</b><br /><br /></td>
                                    </tr>
	                                		<tr> 
				                        		<td width="243">
				                        		
				                        			<%
							                    		String url2 =""; 
							                    		if (ordre.equals("DESC")) {
							                    			url2 = "admin.jsp?id=45&tri=rs&min="+min+"&ord=ASC#contenu";
							                    			%>
							                    			<a href="<%=url2%>" class="txt_6"><b>Raison sociale</b></a>
							                    			<%
							                    		}
							                    		else if (ordre.equals("ASC")) {
							                    			url2 = "admin.jsp?id=45&tri=rs&min="+min+"&ord=DESC#contenu";
							                    			%>
							                    			<a href="<%=url2%>" class="txt_6"><b>Raison sociale</b></a>
							                    			<%
							                    		}
							                    	%>
				                        		</td>
				                        		<td width="93" class="txt_1"><b>Teléphone</b></td>
				                        		<td width="52" class="txt_1"><b>Validité</b></td>
			                        		</tr>
			                        		
			                        		<%
					ClassPagination ClPag = new ClassPagination();
                    String Page1;
                    int nbResult = listeSocietes.size();
                    ClPag.Parametre(nbElementParPage, (PageEnCour-1), nbResult);

                    int cmp = 0;
                    int u = nbElementParPage*(PageEnCour-1);
                    while (u<listeSocietes.size() && u<(nbElementParPage*(PageEnCour-1)+nbElementParPage)){
                %>
			                        		
			                        			                                		
	                                		<tr <% if((cmp % 2 ) == 0){
						                			%> bgcolor="#5A5B5B" <% 
						                		}
	                                			cmp++;
						                		String url = "admin.jsp?id=48&idS="+listeSocietes.get(u).getIdsociete()+"#contenu";
						                		String url1 = "admin.jsp?id=49&idS="+listeSocietes.get(u).getIdsociete()+"#contenu";
						                		%>
	                                		> 
	                                		<td class="txt_2"><%=listeSocietes.get(u).getRaisonSocial() %></td>
	                                		<td class="txt_2" align="center"><%if (listeSocietes.get(u).getTel()!=null) {%><%=listeSocietes.get(u).getTel() %><%}%></td>
	                                			 <td class="txt_2" align="center"><% if (listeSocietes.get(u).getValide()==0) {%>Non<%} else { %> Oui <%} %></td>
	                                			<td width="44" align="center"><a href="<%=url1%>" class="txt_2">Editer</a></td>
	                                			<td width="67" align="center"><a href="<%=url%>" class="txt_2">Supprimer</a></td>
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
											String str = "<span class=\"txt_1\"><a href=\"admin.jsp?id=45&ord="+ordre+"&min="+V2.elementAt(0)+"&tri="+tri+"#contenu\">"+V2.elementAt(1)+"</a></span>";
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