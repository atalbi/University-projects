<%
            Admin adm = null;
            adm = ((Admin)session.getAttribute("admin"));
            
            if (adm != null) {
            
            	int idOffre = Integer.parseInt(request.getParameter("idO"));
           		OffreManager offreManag = (OffreManager)context.lookup("OffreManager"); 
           		Offre o = offreManag.rechercher(idOffre);
           		
           		if (o != null) { 
           		session.setAttribute("offre", o);
            %>

                <table width="668" height="139" align="center">
						  						    
								<tr>
								<td>
								<form name="formSupression_Offre" action="sDeleteOffre" method="POST">
                        		<table  align="center">
                        		<tr align="center">
                        			<td colspan="2" class="txt_1"><br />Cette op&eacute;ration entrainera la suppression de toutes les candidatures correspondant &agrave; cette offre<br /></td>
                        		</tr>
                        		<tr align="center">
                        			<td colspan="2" class="txt_1">Etes-vous s&ucirc;r de vouloir supprimer cette offre ?<br /><br /></td>
                        		</tr>
                        		<tr>
		                        	
		                        	<td width="268" align="center"><input name="confirm" type="submit" value="OUI"/></td>
		                        	<td width="300" align="center">
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
           			//cas ou l'idOffre a été changé manuellement dans l'url
           			//erreur redirection vers confirmation_message
           			session.setAttribute("okAd", 13);
					response.sendRedirect(response.encodeRedirectURL("admin.jsp?id=25#contenu"));
           		}
            }
           	else {
           		//session expirée
           		response.sendRedirect(response.encodeRedirectURL("admin.jsp"));
           		} %>