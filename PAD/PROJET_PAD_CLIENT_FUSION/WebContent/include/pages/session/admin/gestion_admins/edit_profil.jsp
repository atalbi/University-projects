<%
	if (((Admin)session.getAttribute("admin")) != null) {
		
		AdminManager adminManag  = (AdminManager)context.lookup("AdminManager");
		Admin a = ((Admin)session.getAttribute("admin"));
		int idAd = Integer.parseInt(request.getParameter("idAd"));
		
		if (!request.getParameter("idAd").equals("")  && 
				adminManag.rechercherAdmin(idAd) != null ) { //verfie si l'admin existe
				
			Admin profil_a_modifier = adminManag.rechercherAdmin(idAd);
			session.setAttribute("profil_a_modifier",profil_a_modifier);
	%>
    
    <table width="550" height="139" align="center">
            
            <tr align="center">
                 <td>
                 	<form action="sEditProfil_Admin" method="post" name="form_EditProfilAdmin" class="form">
                        <table>
                        <tr align="center">
                                        <td class="txt_1" colspan="2"><br /><b>MODIFICATION DE PROFIL</b><br /><br /></td>
                                    </tr>
                            <tr> 
                                <td class="txt_1">Login</td>
                                <td><input name="loginAdmin" type="text" class="styleZoneTxt"  align="right" value="<%=profil_a_modifier.getLogin() %>"/></td>
                            
                            </tr>     		
                            <tr>
                                <td class="txt_1">Mot de passe</td>
                                <td><input name="passwordAdmin" type="password" value="<%=profil_a_modifier.getPassword() %>" class="styleZoneTxt"/></td>
                            </tr>
                            
                            <tr>
                            <td colspan="2" align="center"><input type="submit" value="Valider" /></td>
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
            response.sendRedirect(response.encodeRedirectURL("admin.jsp?id=25#contenu"));
    }
}
else {
    //session expirée
    response.sendRedirect(response.encodeRedirectURL("admin.jsp"));
    } %>
 