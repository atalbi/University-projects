<%

    Societe s = (Societe)session.getAttribute("societe");       	
    if (s !=null) {
%>


    <form action="sEditSociete" method="post" name="form_editProfilsociete" class="form">
        <table width="441" align="center">
        <tr align="center">
                                        <td class="txt_1" colspan="2"><br /><b>MODIFICATION PROFIL</b><br /><br /></td>
                                    </tr>
        <tr>
            <td width="149" class="txt_1"> Raison Sociale</td>
            <td width="280" ><input name="nomSociete" type="text" class="styleZoneTxt"  align="right" value="<%= s.getRaisonSocial() %>"/></td>
        
        </tr>
        <tr>
            <td class="txt_1">Email</td>
            <td><input name="emailSociete" type="text" class="styleZoneTxt" value="<%= s.getLogin()%>"/></td>
        </tr>
        
        <tr>
            <td class="txt_1">Mot de passe</td>
            <td><input name="passwordSociete" type="password" value ="<%=s.getPassword()%>" class="styleZoneTxt"/></td>
        </tr>
        
        <tr>
            <td class="txt_1">T&eacute;l&eacute;phone</td>
            <td><input name="telSociete" type="text" class="styleZoneTxt" value="<%if (!(""+s.getTel()).equals("null")) %><%=s.getTel()%>"/></td>
   		</tr>      
        <tr>
            <td valign="top" class="txt_1">Adresse</td>
            <td>
            <textarea name="adressSociete" cols="40" rows="3"><%if (!(""+s.getAdresse()).equals("null")) %><%=s.getAdresse()%></textarea>
            </td>
        </tr>
        
        <tr>
            <td valign="top" class="txt_1">Description</td>
            <td>
            <textarea name="descriptionSociete" cols="40" rows="3"><%if (!(""+s.getDescription()).equals("null")) %><%=s.getDescription()%></textarea>
          </td>
        </tr>
  <tr>
        	<td colspan="2" align="center"><input type="submit" value="Valider" /></td>
        </tr>
</table>
        <input name="srcEdit" value="1" type="hidden"/>
        </form>
<%} else {
	response.sendRedirect(response.encodeRedirectURL("Recruteur.jsp"));
} %>

