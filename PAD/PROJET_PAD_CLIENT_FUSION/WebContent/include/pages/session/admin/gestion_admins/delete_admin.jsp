<%

            if (((Admin)session.getAttribute("admin")) != null) {
            	
           		AdminManager adminManag  = (AdminManager)context.lookup("AdminManager");
            	Admin a = ((Admin)session.getAttribute("admin"));
            	int idAd = Integer.parseInt(request.getParameter("idAd"));
            	
            	if (!request.getParameter("idAd").equals("")  && 
            			adminManag.rechercherAdmin(idAd) != null ) { //verfie si l'admin existe
            			
            		Admin profil_a_supprimer = adminManag.rechercherAdmin(idAd);
            		session.setAttribute("profil_a_supprimer",profil_a_supprimer);
            %>
           
                	       <table width="668" height="139" align="center">
						    
								<tr>
								<td>
								<form name="formSupression_Admin" action="sDelete_compteAdmin" method="POST">
                        		<table width="313"  align="center">
                                    <tr><td></td><td></td></tr>
                                    <tr><td></td><td></td></tr>
                                    <tr><td></td><td></td></tr>
                        		<tr>
                        			<td colspan="2" class="txt_1"><br />
                        			Etes-vous sûr de vouloir supprimer ce compte ?<br /><br /></td>
                        		</tr>
                        		<tr>
		                        	
		                        	<td align="center"><input name="confirm" type="submit" value="OUI"/></td>
	                        	  <td align="center"><input name="confirm" type="submit" value="NON"/></td>
	                        	</tr>
                        		
                        		</table>
                        		</form>
                        		</td>
                        		</tr>
                        		</table>
               
            <%
            	}else {
            		
               			//impossible de trouver le profil admin a modifier
               			//erreur ==>redirection vers confirmation_message
               			session.setAttribute("okAd", 3);
    					response.sendRedirect(response.encodeRedirectURL("admin.jsp?id=25"));
            	}
            }
           	else {
           		//session expirée
           		response.sendRedirect(response.encodeRedirectURL("admin.jsp"));
           		} %>