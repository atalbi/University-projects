<%
int idOffre = -1;
OffreManager offreManag = (OffreManager)context.lookup("OffreManager"); 
Offre offre = null;
	if (session.getAttribute("idOffre") != null) {
  idOffre = Integer.parseInt((String)session.getAttribute("idOffre"));
	offre = offreManag.rechercher(idOffre);
	}
	else if (request.getParameter("o") != null) {
		int o = -1;
		o = Integer.parseInt(request.getParameter("o"));
		offre = offreManag.rechercher(o);
	}
	
	if (offre != null) { 
	
%>

<table width="668" height="139" align="center">
						   
						    <tr><td></td></tr>
								<tr>
								<td>
								
                        		<table align="center">
                     		<tr align="center">
                                        <td class="txt_1" colspan="2"><br /><b>DETAIL OFFRE</b><br /><br /></td>
                                    </tr>
                        		<tr> 
	                        		<td width="92" class="txt_1"> Titre</td>
	                        		<td  class="txt_2"><%=offre.getTitreOffre() %></td>	
                        		</tr>
                        		
                        		<tr> 
	                        		<td class="txt_1"> Date</td>
	                        		<td class="txt_2"><%=offre.getDateOffre() %></td>	
                        		</tr>
                        		
                        		<tr> 
	                        		<td class="txt_1"> Société</td>
	                        		<td class="txt_2"><%=offre.getIdsociete().getRaisonSocial() %></td>	
                        		</tr>
                        		<tr> 
	                        		<td class="txt_1"> Formation</td>
	                        		<td class="txt_2"><%=offre.getIdformation().getLibelleFormation() %></td>	
                        		</tr>
                        		<tr> 
	                        		<td valign="top" class="txt_1"> Description</td>
                        		  <td class="txt_2"><%=offre.getOffDescription() %></td>	
                        		</tr>
                        		
                        		</table>
                        		</td>
                        		</tr>
                        		</table>
                        		<%
                        		session.removeAttribute("idOffre");
			}
           		else {
           			//cas ou l'idOffre a été changé manuellement dans l'url
           			//erreur redirection vers confirmation_message
           			session.setAttribute("ok", 6);
					response.sendRedirect(response.encodeRedirectURL("index.jsp?id=19#contenu"));
           		}%>