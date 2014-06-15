<%
          
            Admin adm = null;
            adm = ((Admin)session.getAttribute("admin"));
            
            if (adm != null) {
            
            	int idCd = Integer.parseInt(request.getParameter("idCd"));
           		CandidatManager candidatManag = (CandidatManager)context.lookup("CandidatManager"); 
           		Candidat c = candidatManag.rechercherCandidat(idCd);
           		
           		if (c != null) { 
           		session.setAttribute("candidat", c);
            %>
                <table width="668" height="139" align="center">
						    
								<tr>
								<td>
								<form name="formSupression_Candidat" action="sDeleteCandidat" method="POST">
                        		<table width="342"  align="center">
                        		<tr><td width="140"></td><td width="147"></td>
                                <tr><td></td><td></td>
                        		<tr>
                        			<td colspan="2" align="center" class="txt_1"><br />Etes-vous sûr de vouloir supprimer ce candidat ?<br /></td>
                        		</tr>
                        		<tr>
		                        	
		                        	<td align="center"><input name="confirm" type="submit" value="OUI"/></td>
		                        	<td align="center">
	                        		  <input name="confirm" type="submit" value="NON"/>
		                        		<input name="srcDelete" type="hidden" value="2"/>
		                        	</td>
	                        	</tr>
                        		
                        		</table>
                        		</form>
                        		</td>
                        		</tr>
                				</table>
            <%
           		}
           		else {
           			//cas ou l'idCandidat a été changé manuellement dans l'url
           			//erreur redirection vers confirmation_message
           			session.setAttribute("okAd", 20);
					response.sendRedirect(response.encodeRedirectURL("admin.jsp?id=25#contenu"));
           		}
            }
           	else {
           		//session expirée
           		response.sendRedirect(response.encodeRedirectURL("admin.jsp"));
           		} %>