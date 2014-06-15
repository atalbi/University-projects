<%
		HttpSession sessionCand = request.getSession();
        Candidat c = (Candidat)sessionCand.getAttribute("candidat");
           	
        if (c != null) {
           	
				   CandidatureManager candidatureManag = (CandidatureManager)context.lookup("CandidatureManager");
				   int idOffre = Integer.parseInt(request.getParameter("o"));
				   
				   if (candidatureManag.verifCandidature(c.getIdcandidat(), idOffre) == true) {
				   
				   OffreManager offreManag = (OffreManager)context.lookup("OffreManager");
				   Offre offr = offreManag.rechercher(idOffre);
				   if (offr != null && offr.getValide()==1) {%>
					   <form action="sCandidater" name="formCandidater" method="POST">
					   
					   <table width="668" height="139" align="center">
						<tr align="center">
							<td height="30"><center><div id="h3_page1"><p><b>Candidature</b><br /></p></div></center></td>
						</tr>
						<tr><td></td></tr>
					   <tr>
					   <td>
					   <table width="500" align="center">
							<tr>
								<td width="220" class="txt_1">Offre</td>
								<td width="268" class="txt_3"><%=offr.getTitreOffre() %></td>
							</tr>
							<tr>
								<td class="txt_1">Societé</td>
								<td class="txt_3"><%=offr.getIdsociete().getRaisonSocial() %></td>
							</tr>
							<tr><td> </td><td> </td></tr>
							<tr><td> </td><td> </td></tr>
							<tr><td colspan="2" class="txt_1">Observation</td></tr>
							<tr>
								<td colspan="2"><textarea name="observCandidature" cols="40" rows="5"></textarea></td>
							</tr>
							<tr>
								<td> <input type="hidden" name="idOffre" value="<%=idOffre %>" />
								</td>
								<td><input type="submit" value="   Envoyer   "/></td>
							</tr>
					   </table>
					   </td>
					   </tr>
					   </table>
					   </form>
                       <%}
                       }
                       else {
                    	   //cas où le candidat a déja postulé pour cette offre
                    	   //session.setAttribute("ok", 7);
       						//response.sendRedirect(response.encodeRedirectURL("index.jsp?id=19"));
							%>
                            <center><div class="error_log_1"><b>Vous avez déjà postulé à cette offre !</b></div></center>
                    	<%   
                       }
                       %>
            <%}
           	else {%>				
					<center><div class="error_log_1"><b>Veuillez vous connecter pour postuler à cette offre !</b></div></center>
			<%} %>