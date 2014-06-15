
<%@page import="candidat.session.CandidatManager"%><table align="center">
<tr>
<td>

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
<table align="right">
<tr>
	<td><img src="images/espace__1.jpg" height="8" width="8" /></td><td></td>
</tr>
<tr>
<td>

<table id="Tableau_01" width="269" height="173" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td colspan="3">
			<img src="images/cadre_1_01.jpg" width="269" height="1" alt=""></td>
	</tr>
	<tr>
		<td rowspan="4">
			<img src="images/cadre_1_02.jpg" width="10" height="172" alt=""></td>
		<td background="images/cadre_1_03.jpg" width="248" height="37" align="center">DERNIERES OFFRES</td>
		<td rowspan="4">
			<img src="images/cadre_1_04.jpg" width="11" height="172" alt=""></td>
	</tr>
	<tr>
		<td>
			<img src="images/cadre_1_05.jpg" width="248" height="4" alt=""></td>
	</tr>
	<tr>
		<td background="images/cadre_1_06.jpg" width="248" height="124">
        
        <marquee class="infos" direction="up" onmouseout="scrollAmount=2;" onmouseover="scrollAmount=0;" scrollamount="2" style="font-size: 11px; font-weight: bold; margin-right: 5px; margin-left: 5px; color: rgb(255, 255, 255); text-align: left; width: 236px; height: 124px; line-height: 17px;">
        <table >
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
	<tr>
		<td>
			<img src="images/cadre_1_07.jpg" width="248" height="7" alt=""></td>
	</tr>
</table>


















</td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td></tr></table>

</td>
<td>

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
<table align="right">
<tr>
	<td><img src="images/espace__1.jpg" height="8" width="8" /></td>
</tr>
<tr>
<td>

<table id="Tableau_02" width="269" height="173" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td colspan="3">
			<img src="images/cadre_1_01.jpg" width="269" height="1" alt=""></td>
	</tr>
	<tr>
		<td rowspan="4">
			<img src="images/cadre_1_02.jpg" width="10" height="172" alt=""></td>
		<td background="images/cadre_1_03.jpg" width="248" height="37" align="center">DERNIERS CANDIDATS
			</td>
		<td rowspan="4">
			<img src="images/cadre_1_04.jpg" width="11" height="172" alt=""></td>
	</tr>
	<tr>
		<td>
			<img src="images/cadre_1_05.jpg" width="248" height="4" alt=""></td>
	</tr>
	<tr>
		<td background="images/cadre_1_06.jpg" width="248" height="124">
			<marquee class="infos" direction="up" onmouseout="scrollAmount=2;" onmouseover="scrollAmount=0;" scrollamount="2" style="font-size: 11px; font-weight: bold; margin-right: 5px; margin-left: 5px; color: rgb(255, 255, 255); text-align: left; width: 236px; height: 124px; line-height: 17px;">
        <table >
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
        </marquee></td>
	</tr>
	<tr>
		<td>
			<img src="images/cadre_1_07.jpg" width="248" height="7" alt=""></td>
	</tr>
</table>

</td></tr></table>
</td></tr></table>