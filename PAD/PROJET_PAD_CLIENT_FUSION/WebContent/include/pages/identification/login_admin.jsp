
<% 
	Admin ad = null;
	if(session.getAttribute("admin") == null){
%>
<%@page import="entity.Admin"%>
<table id="Tableau_01" width="279" height="182" border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td colspan="5">
            <img src="images/identifier/candidat/cand_01.jpg" width="279" height="7" alt=""></td>
    </tr>
    <tr>
        <td colspan="2" rowspan="2">
            <img src="images/identifier/candidat/cand_02.jpg" width="11" height="37" alt=""></td>
        <td background="images/identifier/candidat/cand_03.jpg" width="258" height="32" align="center">IDENTIFICATION ADMIN</td>
        <td colspan="2" rowspan="2">
            <img src="images/identifier/candidat/cand_04.jpg" width="10" height="37" alt=""></td>
    </tr>
    <tr>
        <td>
            <img src="images/identifier/candidat/cand_05.jpg" width="258" height="5" alt=""></td>
    </tr>
    <tr>
        <td rowspan="2">
            <img src="images/identifier/candidat/cand_06.jpg" width="10" height="137" alt=""></td>
        <td colspan="3" background="images/identifier/candidat/cand_07.jpg" width="261" height="127"><table border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="263" height="89"  valign="top" align="center">
    	<form action="sIdentification" method="post"  name="form_ident_cand" id="form_ident_cand" >
      		<table width="250" border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="84" height="20" class="txt_1">Login</td>
                  <td width="154" align="left"><input type="text" id="can_log" name="login" value="" style="height:20px;"/></td>
                </tr>
                <tr>
                  <td height="25" class="txt_1" >Password</td>
                  <td align="left"><input type="password" id="can_pass" name="password" value="" style="height:20px;"/></td>
                </tr>
               
                <tr>
                  <td align="right"></td>
                  <td align="right"><input type="hidden" name="typeIdent" value="3" />
                    <input type="submit" value="Connecter" /></td>
                </tr>
                <tr>
                  <td height="18" colspan="2"><div class="error_log_1"><% if((""+request.getParameter("id")).equals("-1")){out.print("Login et/ou mot de passe incorrect");} %></div></td>
                </tr>
      		</table>
         </form></td></tr>
         
</table></td>
        <td rowspan="2">
            <img src="images/identifier/candidat/cand_08.jpg" width="8" height="137" alt=""></td>
    </tr>
    <tr>
        <td colspan="3">
            <img src="images/identifier/candidat/cand_09.jpg" width="261" height="10" alt=""></td>
    </tr>
    <tr>
        <td>
            <img src="images/identifier/candidat/spacer.gif" width="10" height="1" alt=""></td>
        <td>
            <img src="images/identifier/candidat/spacer.gif" width="1" height="1" alt=""></td>
        <td>
            <img src="images/identifier/candidat/spacer.gif" width="258" height="1" alt=""></td>
        <td>
            <img src="images/identifier/candidat/spacer.gif" width="2" height="1" alt=""></td>
        <td>
            <img src="images/identifier/candidat/spacer.gif" width="8" height="1" alt=""></td>
    </tr>
</table>

<%
	}else{
		ad = (Admin) session.getAttribute("admin");
%>
<table id="Tableau_01" width="279" height="182" border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td colspan="5">
            <img src="images/identifier/candidat/cand_01.jpg" width="279" height="7" alt=""></td>
    </tr>
    <tr>
        <td colspan="2" rowspan="2">
            <img src="images/identifier/candidat/cand_02.jpg" width="11" height="37" alt=""></td>
        <td background="images/identifier/candidat/cand_03.jpg" width="258" height="32" align="center">ESPACE ADMIN</td>
        <td colspan="2" rowspan="2">
            <img src="images/identifier/candidat/cand_04.jpg" width="10" height="37" alt=""></td>
    </tr>
    <tr>
        <td>
            <img src="images/identifier/candidat/cand_05.jpg" width="258" height="5" alt=""></td>
    </tr>
    <tr>
        <td rowspan="2">
            <img src="images/identifier/candidat/cand_06.jpg" width="10" height="137" alt=""></td>
        <td colspan="3" background="images/identifier/candidat/cand_07.jpg" width="261" height="127"><table border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="263"   valign="top" align="center">
    	  <table width="250" border="0" cellpadding="0" cellspacing="0">
    	  <tr>
    	    <td>
    	    <table width="250" border="0" cellpadding="0" cellspacing="0">
    	      <tr>
    	        <td width="84" class="txt_1" colspan="2">Bienvenu(e) <% out.println(ad.getLogin()); %> </td>
  	       		</tr>
  	       		<tr><td colspan="2"><br /></td></tr>
                <tr><td colspan="2">
                <a href="admin.jsp?id=27&idAd=<%=ad.getIdadmin() %>#contenu" class="txt_2">Editer mon profil</a><br />
                <a href="admin.jsp?id=29&idAd=<%=ad.getIdadmin() %>#contenu"  class="txt_2">Supprimer mon profil</a><br />
                <a href="admin.jsp?id=7#contenu"  class="txt_2">Consulter les statistiques</a><br />
                <a href="sDeconnecterAdmin" class="txt_2">Se déconnecter</a></td></tr>
            </table>
         </td>
  	    </tr>
    	  </table>
</td></tr>
         
</table></td>
        <td rowspan="2">
            <img src="images/identifier/candidat/cand_08.jpg" width="8" height="137" alt=""></td>
    </tr>
    <tr>
        <td colspan="3">
            <img src="images/identifier/candidat/cand_09.jpg" width="261" height="10" alt=""></td>
    </tr>
    <tr>
        <td>
            <img src="images/identifier/candidat/spacer.gif" width="10" height="1" alt=""></td>
        <td>
            <img src="images/identifier/candidat/spacer.gif" width="1" height="1" alt=""></td>
        <td>
            <img src="images/identifier/candidat/spacer.gif" width="258" height="1" alt=""></td>
        <td>
            <img src="images/identifier/candidat/spacer.gif" width="2" height="1" alt=""></td>
        <td>
            <img src="images/identifier/candidat/spacer.gif" width="8" height="1" alt=""></td>
    </tr>
</table>
<%
	}
%>


