                <%
           	Societe s = (Societe)session.getAttribute("societe");
           
           	int idOffre = Integer.parseInt(request.getParameter("idOffre"));
           	
           	           	
           	if (s !=null) {
           		OffreManager offreManag = (OffreManager)context.lookup("OffreManager"); 
           		Offre o = offreManag.rechercher(idOffre);
           		
           		if (o != null) { 
           		session.setAttribute("offre", o);
           	%>
                		<table width="668" height="139" align="center">
						   
								<tr>
								<td>
								<form name="formSupression_Alerte" action="sDeleteOffre" method="POST">
                        		<table width="532"  align="center">
                        		<tr>
                        			<td colspan="2" align="center" class="txt_1"> <br />Cette action entrainera la suppression de toutes les candidatures correspondantes<br/><br />
                       			    Etes-vous s&ucirc;r de vouloir supprimer cette offre ?<br /><br /></td>
                        		</tr>
                        		<tr>
		                        	
		                        	<td width="256" align="center" valign="middle"><input name="confirm" type="submit" value="OUI"/></td>
	                        	  <td width="264" align="center" valign="middle"><input name="confirm" type="submit" value="NON"/></td>
	                        	</tr>
                        		
                        		</table>
                        		<input name="srcDelete" value="1" type="hidden"/>
                        		</form>
                        		</td>
                        		</tr>
                        		</table>
	                        <table>
	                        </table> 
            <%}
           		else {
           			
           			session.setAttribute("ok", 11);
    				response.sendRedirect(response.encodeRedirectURL("Recruteur.jsp?id=15#contenu"));
           		}
           	}
        	else {
           		//session expirée
           		response.sendRedirect(response.encodeRedirectURL("Recruteur.jsp"));
           		} %>
 