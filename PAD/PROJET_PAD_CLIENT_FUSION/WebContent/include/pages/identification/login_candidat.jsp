<% 
	Candidat can = null;
	if(session.getAttribute("candidat") == null){
%>

<%@page import="entity.Candidat"%><table id="Tableau_01" width="279" height="182" border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td colspan="5">
            <img src="images/identifier/candidat/cand_01.jpg" width="279" height="7" alt=""></td>
    </tr>
    <tr>
        <td colspan="2" rowspan="2">
            <img src="images/identifier/candidat/cand_02.jpg" width="11" height="37" alt=""></td>
        <td background="images/identifier/candidat/cand_03.jpg" width="258" height="32" align="center">IDENTIFICATION CANDIDAT</td>
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
                  <td align="right"><input type="hidden" name="typeIdent" value="1" />
                    <input type="submit" value="Connecter" /></td>
                </tr>
                <tr>
                  <td height="18" colspan="2">
                  	<div class="error_log_1">
                  		<% if((""+request.getParameter("id")).equals("-1")){out.print("Login et/ou mot de passe incorrect");} %>
                  	</div>
                  	<a href="index.jsp?id=16#contenu" class="txt_2">Pas encore inscrit, cliquez ici</a>
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
		can = (Candidat) session.getAttribute("candidat");
%>
<table id="Tableau_01" width="279" height="182" border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td colspan="5">
            <img src="images/identifier/candidat/cand_01.jpg" width="279" height="7" alt=""></td>
    </tr>
    <tr>
        <td colspan="2" rowspan="2">
            <img src="images/identifier/candidat/cand_02.jpg" width="11" height="37" alt=""></td>
        <td background="images/identifier/candidat/cand_03.jpg" width="258" height="32" align="center">DERNIERES OFFRES</td>
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
	OffreManager offreManag = (OffreManager)context.lookup("OffreManager");
	ArrayList<Offre> listeOffres = offreManag.listeOffres("dt","DESC");
	int max_offre;
	if(listeOffres.size() > 5){
		max_offre = 5;
	}else{
		max_offre = listeOffres.size();
	}
%>
			<%
			String off_desc = "";
				for (int i=0 ; i < max_offre; i++) {
					out.print("<tr><td class=\"txt_3\">"+listeOffres.get(i).getDateOffre()+"</td></tr>");
					out.print("<tr><td class=\"txt_3\"><b>"+listeOffres.get(i).getTitreOffre()+"</b></td></tr>");
					if(listeOffres.get(i).getOffDescription().length() > 70){
						off_desc = listeOffres.get(i).getOffDescription().substring(0,68)+" ...";
					}else{
						off_desc = listeOffres.get(i).getOffDescription();
					}
					out.print("<tr><td class=\"txt_1\">"+off_desc+"</td></tr>");
					out.print("<tr><td align=\"right\"><a href=\"index.jsp?id=23&o="+listeOffres.get(i).getIdoffre()+"#contenu\" class=\"txt_2\">lire la suite ...</a></td></tr>");
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