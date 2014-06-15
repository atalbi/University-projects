
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
            	
            %>
                <table width="668" height="139" align="center">
                     		
                        		
                        		<tr> 
	                        		<td>
	                        		<% 
	                        		CandidatureManager candManag = (CandidatureManager)context.lookup("CandidatureManager"); 
	                           		ArrayList<Candidature> listeCandidatures = new ArrayList<Candidature>();
	                        		String ordre = request.getParameter("ord"); 
	                        		String tri = request.getParameter("tri");
	                        		
	                           		if ((ordre.equals("DESC") || ordre.equals("ASC")) && !tri.equals(""))     {                        		
	                           		
	                           			listeCandidatures = candManag.listeCandidatures(tri, ordre);
	                           		
	                           		}
	                           		
	                        		if (listeCandidatures!= null && listeCandidatures.size()>0 ) {
	                        			%>
	                                		<table width="658" align="center">
                                            <tr align="center">
                                        <td class="txt_1" colspan="5"><br /><b>LISTE DES CANDIDATURES</b><br /><br /></td>
                                    </tr>
	                                		<tr> 
				                        		<td width="177">
				                        			<%
				                    		String url11 =""; 
				                    		if (ordre.equals("DESC")) {
				                    			url11 = "admin.jsp?id=44&tri=tO&min="+min+"&ord=ASC#contenu";
				                    			%>
				                    			<a href="<%=url11%>" class="txt_6"><b>Titres</b></a>
				                    			<%
				                    		}
				                    		else if (ordre.equals("ASC")) {
				                    			url11 = "admin.jsp?id=44&min="+min+"&tri=tO&ord=DESC#contenu";
				                    			%>
				                    			<a href="<%=url11%>" class="txt_6"><b>Titres</b></a>
				                    			<%
				                    		}
				                    	%>
				                        		</td>
				                        		<td width="75">
												<%
				                    		String url22 =""; 
				                    		if (ordre.equals("DESC")) {
				                    			url22 = "admin.jsp?id=44&tri=dtC&min="+min+"&ord=ASC#contenu";
				                    			%>
				                    			<a href="<%=url22%>" class="txt_6"><b>Date</b></a>
				                    			<%
				                    		}
				                    		else if (ordre.equals("ASC")) {
				                    			url22 = "admin.jsp?id=44&min="+min+"&tri=dtC&ord=DESC#contenu";
				                    			%>
				                    			<a href="<%=url22%>" class="txt_6"><b>Date</b></a>
				                    			<%
				                    		}
				                    	%>
												</td>
				                        		<td width="169">
												<%
				                    		String url33 =""; 
				                    		if (ordre.equals("DESC")) {
				                    			url33 = "admin.jsp?id=44&tri=cC&min="+min+"&ord=ASC#contenu";
				                    			%>
				                    			<a href="<%=url33%>" class="txt_6"><b>Noms candidats</b></a>
				                    			<%
				                    		}
				                    		else if (ordre.equals("ASC")) {
				                    			url33 = "admin.jsp?id=44&min="+min+"&tri=cC&ord=DESC#contenu";
				                    			%>
				                    			<a href="<%=url33%>" class="txt_6"><b>Noms candidats</b></a>
				                    			<%
				                    		}
				                    	%>
												</td>
				                        		<td width="153">
				                        		<%
				                    		String url44 =""; 
				                    		if (ordre.equals("DESC")) {
				                    			url44 = "admin.jsp?id=44&tri=dcC&min="+min+"&ord=ASC#contenu";
				                    			%>
				                    			<a href="<%=url44%>" class="txt_6"><b>D&eacute;cisions</b></a>
				                    			<%
				                    		}
				                    		else if (ordre.equals("ASC")) {
				                    			url44 = "admin.jsp?id=44&min="+min+"&tri=dcC&ord=DESC#contenu";
				                    			%>
				                    			<a href="<%=url44%>" class="txt_6"><b>D&eacute;cisions</b></a>
				                    			<%
				                    		}
				                    	%>
				                    	</td>
			                        		</tr>
			                        		<%
					ClassPagination ClPag = new ClassPagination();
                    String Page1;
                    int nbResult = listeCandidatures.size();
                    ClPag.Parametre(nbElementParPage, (PageEnCour-1), nbResult);

                    int cmp = 0;
                    int u = nbElementParPage*(PageEnCour-1);
                    while (u<listeCandidatures.size() && u<(nbElementParPage*(PageEnCour-1)+nbElementParPage)){
                %>
			                        		
			                        			                                		
	                                		<tr <% if((cmp % 2 ) == 0){
						                			%> bgcolor="#5A5B5B" <% 
						                		}
	                                			cmp++;
						                		String url = "admin.jsp?id=46&idC="+listeCandidatures.get(u).getIdcandidature()+"#contenu";
						                		String url1 = "admin.jsp?id=47&idC="+listeCandidatures.get(u).getIdcandidature()+"#contenu";
						                		%>
	                                		>
	                                		<td ><a href="<%=url %>" class="txt_2"><b><%=listeCandidatures.get(u).getIdoffre().getTitreOffre() %></b></a></td>
	                                		<td class="txt_2"><%=listeCandidatures.get(u).getDate() %></td>
	                                			 <td class="txt_2"><%=listeCandidatures.get(u).getIdcandidat().getNom() %> <%=listeCandidatures.get(u).getIdcandidat().getPrenom() %></td>
	                                			<td class="txt_2"><%=listeCandidatures.get(u).getDecision() %></td>
	                                			<td width="60"><a href="<%=url1 %>" class="txt_2">supprimer</a></td>
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
											String str = "<span class=\"txt_1\"><a href=\"admin.jsp?id=44&ord="+ordre+"&min="+V2.elementAt(0)+"&tri="+tri+"#contenu\">"+V2.elementAt(1)+"</a></span>";
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