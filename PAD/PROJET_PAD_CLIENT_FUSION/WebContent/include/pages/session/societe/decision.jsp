
<%
	HttpSession sessionSoc = request.getSession();
	Societe s = (Societe) sessionSoc.getAttribute("societe");

	if (s != null) {
		String idcture = request.getParameter("re");
		sessionSoc.setAttribute("idcandidature", idcture);
		String idc = request.getParameter("c");
		sessionSoc.setAttribute("idcandidat", idc);
%>
<%@include file="fiche_Candidature.jsp"%>
<table width="668" height="110" align="center">
	<tr align="center">
                                        <td class="txt_1"><b>DECISION</b></td>
                                    </tr>

	<tr>
		<td>
		<form name="formDecision" action="sDecision?idcandidat=<%= request.getParameter("idcandidat") %>&idcandidature=<%= request.getParameter("idcandidature") %>" method="POST">
		<table width="377" align="center">
			<tr>
			  <td colspan="3" align="center" class="txt_1">Indiquez ici votre d&eacute;cision concernant cette candidature</td>
			</tr>
			<tr>

				<td width="119" align="center" valign="middle"><input name="confirm" type="submit" value="Accepter" /></td>
			  <td width="108" align="center" valign="middle"><input name="confirm" type="submit" value="Refuser" /></td>
			  <td width="117" align="center" valign="middle"><input name="confirm" type="submit" value="Retour" /></td>
		  </tr>

		</table>
		</form>
		</td>
	</tr>
</table>
<%
	} else {
		//session expirée
		response.sendRedirect(response
				.encodeRedirectURL("Recruteur.jsp?id=-1"));
	}
%>
