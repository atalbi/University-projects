<%@include file="../../../fonctions/init_context.jsp"%>


<table width="550" height="139" align="center">
	<tr align="center">
		<td height="30">
		<h3>Rechercher Candidat</h3>
		</td>
	</tr>
	<tr align="center">
		<td>
		<form method="get" action="sRechercheCandidat" name="RechercheCand">
		<table width="469">
			<tr>
				<td>Nom :</td>
				<td><input type="text" name="nomCand" /></td>
			</tr>
			<tr>
				<td width="128">Prénom :</td>
				<td><input type="text" name="prCand" /></td>



			</tr>

			<tr>
				<td width="128">Formation :</td>
				<td width="329"><select name="formation" style="width: 160px">
					<option value="-1" selected="selected"></option>
					<%
						FormationManager formManag = (FormationManager) context
								.lookup("FormationManager");
						ArrayList<Formation> listForm = formManag.listefFormation();

						for (Formation f : listForm) {
					%>
					<option value="<%=f.getIdformation()%>"><%=f.getLibelleFormation()%></option>
					<%
						}
					%>
				</select></td>
			</tr>
			<tr>
				<td>Niveau d'etude :</td>
				<td><input type="text" name="nvEtudes" /></td>
			</tr>
			<tr>
				<td>Mot Clé :</td>
				<td><input type="text" name="keyWord" /></td>
			</tr>
			<tr>
				<td>Email :</td>
				<td><input type="text" name="email" /></td>
			</tr>
			<tr>
				<td><input type="hidden" name="min" value="1" /></td>
				<td align="right"><input type="submit" value="Rechercher" /></td>
			</tr>
		</table>
		</form>
		</td>
	</tr>
</table>
