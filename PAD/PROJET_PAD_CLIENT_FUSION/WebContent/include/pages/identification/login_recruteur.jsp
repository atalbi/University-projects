<%
	Societe soc = null;
	if(session.getAttribute("societe") == null){
%>

<%@page import="entity.Societe"%><table id="Tableau_01" width="279" height="182" border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td colspan="5">
            <img src="images/identifier/candidat/cand_01.jpg" width="279" height="7" alt=""></td>
    </tr>
    <tr>
        <td colspan="2" rowspan="2">
            <img src="images/identifier/candidat/cand_02.jpg" width="11" height="37" alt=""></td>
        <td background="images/identifier/candidat/cand_03.jpg" width="258" height="32" align="center">IDENTIFICATION RECRUTEUR</td>
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
    	<form name="form_ident_recrut" method="post" action="sIdentification" >
      		<table width="250" border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="84" height="20" class="txt_1">Login</td>
                  <td width="154" align="left"><input type="text" id="recrut_log" name="login" value="" style="height:20px;"/></td>
                </tr>
                <tr>
                  <td height="25" class="txt_1" >Password</td>
                  <td align="left"><input type="password" id="recrut_pass" name="password" value="" style="height:20px;"/></td>
                </tr>
               
                <tr>
                  <td align="right"></td>
                  <td align="right"><input type="submit" value="Connecter" /><input type="hidden" name="typeIdent" value="2" /></td>
                </tr>
                <tr>
                  <td height="18" colspan="2">
                  	<div class="error_log_1">
                  		<% if ((""+request.getParameter("id")).equals("9")) {out.print("Login et/ou mot de passe incorrect");} %>
                  	</div>
                    <a href="Recruteur.jsp?id=13#contenu" class="txt_2">Pas encore inscrit, cliquez ici</a>
                  </td>
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
		soc = (Societe) session.getAttribute("societe"); 
%>
<table id="Tableau_01" width="279" height="182" border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td colspan="5">
            <img src="images/identifier/candidat/cand_01.jpg" width="279" height="7" alt=""></td>
    </tr>
    <tr>
        <td colspan="2" rowspan="2">
            <img src="images/identifier/candidat/cand_02.jpg" width="11" height="37" alt=""></td>
        <td background="images/identifier/candidat/cand_03.jpg" width="258" height="32" align="center">DERNIERS CANDIDATS</td>
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
    	    <td><marquee class="infos" direction="up" onmouseout="scrollAmount=2;" onmouseover="scrollAmount=0;" scrollamount="2" style="font-size: 11px; font-weight: bold; margin-right: 5px; margin-left: 5px; color: rgb(255, 255, 255); text-align: left; width: 236px; height: 124px; line-height: 17px;">
        <table >
        <%
	CandidatManager condManag = (CandidatManager)context.lookup("CandidatManager");
	ArrayList<Candidat> listeCandidat= condManag.listeCandidat("dt","DESC");
	int max_cond = 0;
	if(listeCandidat.size() > 15){
		max_cond = 15;
	}else{
		max_cond = listeCandidat.size();
	}
%>
			<%
			String cand_desc = "";
				for (int i=0 ; i < max_cond; i++) {
					out.print("<tr><td class=\"txt_3\">"+listeCandidat.get(i).getNom()+" "+listeCandidat.get(i).getPrenom()+"</td></tr>");
					out.print("<tr><td class=\"txt_3\"><b>"+listeCandidat.get(i).getIdformation().getLibelleFormation()+"</b></td></tr>");
					out.print("<tr><td align=\"right\"><a href=\"Recruteur.jsp?id=2&idcandidat="+listeCandidat.get(i).getIdcandidat()+"#contenu\" class=\"txt_2\">Détail ...</a></td></tr>");
					out.print("<tr><td align=\"center\" class=\"txt_1\">----------------------------------------</td></tr>");
				}
			%>
        </table>
        </marquee>
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