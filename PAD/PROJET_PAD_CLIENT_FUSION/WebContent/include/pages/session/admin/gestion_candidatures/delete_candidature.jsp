<%
            Admin adm = null;
            adm = ((Admin)session.getAttribute("admin"));
            
            if (adm != null) {
            
            	int idCand = Integer.parseInt(request.getParameter("idC"));
           		CandidatureManager candidatureManag = (CandidatureManager)context.lookup("CandidatureManager"); 
           		Candidature c = candidatureManag.rechercher(idCand);
           		
           		if (c != null) { 
           		session.setAttribute("candidature", c);
            %>
                <table width="668" height="139" align="center">
						   								<tr>
								<td>
								<form name="formSupression_Candidature" action="sDeleteCandidature" method="POST">
                        		<table width="378"  align="center">
                        		<tr><td width="153"></td><td width="173"></td>
                        		<tr>
                        			<td colspan="2" align="center" class="txt_1"><br />
                        			Etes-vous sûr de vouloir supprimer cette candidature ?<br />
                        			<br /></td>
                        		</tr>
                        		<tr>
		                        	
		                        	<td align="center"><input name="confirm" type="submit" value="OUI"/></td>
		                        	<td align="center">
		                        		<input name="confirm" type="submit" value="NON"/>
		                        		
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
           			//cas ou l'idCandidature a été changé manuellement dans l'url
           			//erreur redirection vers confirmation_message
           			session.setAttribute("okAd", 14);
					response.sendRedirect(response.encodeRedirectURL("admin.jsp?id=25#contenu"));
           		}
            }
           	else {
           		//session expirée
           		response.sendRedirect(response.encodeRedirectURL("admin.jsp"));
           		} %>