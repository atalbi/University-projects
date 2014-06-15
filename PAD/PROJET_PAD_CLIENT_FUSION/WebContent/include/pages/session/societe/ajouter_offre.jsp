<%
	HttpSession sessionSoc = request.getSession();
	Societe s = (Societe) sessionSoc.getAttribute("societe");

	if (s != null) {
%>

<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%><div id="container">
<table width="668" height="139" align="center">
	
	<tr>
		<td>
		<form name="formCreation_Offre" action="sCreateOffre" method="POST">
		<table width="380" align="center">
        <tr align="center">
                                        <td class="txt_1" colspan="2"><br /><b>CREATION OFFRE</b><br /><br /></td>
                                    </tr>
			<tr>
				<td class="txt_1">Titre</td>
				<td><input name="titleOff" type="text" value="" class="styleZoneTxt"/></td>
			</tr>
			<tr>
				<td class="txt_1">Date</td>
				<%
					Date actuelle = new Date();
						DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
						String dat = dateFormat.format(actuelle);
				%>
				<td><input readonly="readonly" name="DateOff" type="text" value="<%=dat%>" class="styleZoneTxt" /></td>
			</tr>
			
			<tr>
				<td class="txt_1">Formation</td>
				<td><select name="formationOff" style="width: 160px">
				<option value="-1" selected="selected"> </option>
					<%
						FormationManager formManag2 = (FormationManager) context.lookup("FormationManager");
							ArrayList<Formation> listForm1 = formManag2.listefFormation();

							for (Formation f : listForm1) {
					%>
					<option value="<%=f.getIdformation()%>"><%=f.getLibelleFormation()%></option>
					<%
						}
					%>
				</select></td>
			</tr>
            <tr>
				<td class="txt_1">Publié</td>
				<td>
                	<select name="valide">
                    	<option value="1" selected="selected">Oui</option>
                    	<option value="0">Non</option>                        
                    </select>
                </td>
			</tr>
            <tr>
				<td class="txt_1">Description</td>
				<td><textarea cols="40" rows="4" name="ObsOff"
					style="width: 244px; height: 71px;"></textarea></td>
			</tr>
            
			<tr>
				<td colspan="2" align="center"><input type="submit" value="   Ajouter   " /></td>
			</tr>

		</table>
		<input name="srcCreate" type="hidden" value="1"/>
		</form>
		</td>
	</tr>
</table>


<table>



</table>

<%
	} else {
	response.sendRedirect(response.encodeRedirectURL("Recruteur.jsp"));
	}
%>
