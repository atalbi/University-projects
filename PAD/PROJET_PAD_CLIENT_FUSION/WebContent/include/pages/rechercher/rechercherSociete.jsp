<style>
	.ui-autocomplete {
		max-height: 100px;
		overflow-y: hidden;
		/* prevent horizontal scrollbar */
		overflow-x: hidden;
		/* add padding to account for vertical scrollbar */
		padding-right: 20px;
	}
	/* IE 6 doesn't support max-height
	 * we use height instead, but this forces the menu to always be this tall
	 */
	* html .ui-autocomplete {
		height: 100px;
	}
	</style>
    
    <% 
	CandidatManager canManag1 = (CandidatManager)context.lookup("CandidatManager");
	ArrayList<Candidat> listeCandidat11 = canManag1.listeCandidat();
	ArrayList<String> listeNom = new ArrayList<String>();
	ArrayList<String> listePrenom = new ArrayList<String>();
	int uu = 0, cc = 0, pp = 0;
	for (Candidat c: listeCandidat11) {
		 if (!listeNom.contains(c.getNom())) {
			 listeNom.add(c.getNom());
		 }
		 if (!listePrenom.contains(c.getPrenom())) {
			 listePrenom.add(c.getPrenom());
		 }
	}
		
	%>
    <script>
	$(function() {
		var availableTagsName = [<% for (String c: listeNom) {
										 %>"<%=c%>"
											 
									 <% uu++;
									 if (uu != listeNom.size()) {
									 	%>,<%
									 }
									 }
									 %>
			
			
		];
		var availableTagsPrenom = [<% for (String c: listePrenom) {%>
									 "<%=c%>"
									 <%
									 cc++;
									 if (cc != listePrenom.size()) {
									 	%>,<%
									 }
									 }
									 %>
			
			
		];
		var availableTagsEtude = [<% for (Candidat c: listeCandidat11) {
									if (c.getNiveauEtudes() != null && !c.getNiveauEtudes().equals("") && !c.getNiveauEtudes().equals("null")) { %>
									"<%=c.getNiveauEtudes()%>"
									<%
									if (pp != listeCandidat11.size()) {
									 	%>,<%
									 }
									}
		
									%>
									 
									 <%
									 pp++;
									 
									 }
									 %>
			
			
		];
		$( "#tagsN" ).autocomplete({
			source: availableTagsName
		});
		$( "#tagsP" ).autocomplete({
			source: availableTagsPrenom
		});
		$( "#tagsE" ).autocomplete({
			source: availableTagsEtude
		});
	});
	</script>

<form method="get" action="Recruteur.jsp?id=1&min=0&#contenu" name="formulaireRecherche">
                <table width="625" border="0" cellpadding="0" cellspacing="1"> 
                	<tr>
                    	<td height="19"></td><td colspan="2">Rechercher Candidat</td>
                    </tr>
                    
                    <tr>
                      <td width="11" align="center">&nbsp;</td>
                        <td height="22">&nbsp;&nbsp;&nbsp;<span class="txt_0">Nom</span></td>
                    <td><div id="ui-widget"><input id="tagsN" type="text" name="nomCand"  style="width:165px" value="<% if(!(""+request.getParameter("nomCand")).equals("null")){                 	out.println(""+request.getParameter("nomCand"));} %>"/></div></td>
                        <td width="132">&nbsp;&nbsp;&nbsp;<span class="txt_0">Niveau d'&eacute;tude</span></td><td colspan="2"><div id="ui-widget"><input id="tagsE" type="text" name="nvEtudes"  style="width:165px" value="<% if(!(""+request.getParameter("nvEtudes")).equals("null")){                 	out.println(""+request.getParameter("nvEtudes"));} %>"/></div></td>
                    </tr> 
                    
                    <tr>
                      	<td width="11"  align="center">&nbsp;</td>
                        <td height="22">&nbsp;&nbsp;&nbsp;<span class="txt_0">Prénom</span></td>
                      <td><div id="ui-widget"><input id="tagsP" type="text" name="prCand"  style="width:165px" value="<% if(!(""+request.getParameter("prCand")).equals("null")){                 	out.println(""+request.getParameter("prCand"));} %>"/></div></td><td>&nbsp;&nbsp;&nbsp;<span class="txt_0">Mot Clé</span></td><td colspan="2"><input type="text" name="keyWord"  style="width:165px" value="<% if(!(""+request.getParameter("keyWord")).equals("null")){                 	out.println(""+request.getParameter("keyWord"));} %>"/></td>
                    </tr> 
                    
                    <tr>
                    	<td width="11"  align="center">&nbsp;</td>
                      <td width="115" height="22" >&nbsp;&nbsp;&nbsp;<span class="txt_0">Formation</span></td>
                  <td width="176" ><select name="formation" style="width:165px">
                                <option value="-1" selected="selected"></option>
                                    <%
									
                                   FormationManager formManag = (FormationManager) context.lookup("FormationManager");
                              	   ArrayList<Formation> listForm = formManag.listefFormation();
                              	   
								   String id_form = ""+request.getParameter("formation");
								   if(id_form.equals("null")){
									   id_form = "-1";
								   }
                                    	
                                    for(Formation f: listForm){
                                    %>
                                          <option value="<%= f.getIdformation() %>" <%if((id_form).equals(""+f.getIdformation())){ out.print("selected=\"selected\""); }%>><%= f.getLibelleFormation() %></option>
                                    <%
                                        }
                                    %>
                            </select>
                        </td><td>&nbsp;&nbsp;&nbsp;<span class="txt_0">Email</span></td><td colspan="2"><input type="text" name="email"  style="width:165px" value="<% if(!(""+request.getParameter("email")).equals("null")){                 	out.println(""+request.getParameter("email"));} %>"/></td>
                    </tr>
                     <tr>
                      <td width="11" align="center">&nbsp;</td>
                        <td height="24">&nbsp;</td>
                        <td>&nbsp;</td><td><input type="hidden" name="id" value="1" />
                          <input type="hidden" name="min" value="1" /></td><td width="184" align="right"><input type="submit" value="Rechercher" /></td>
                          <td width="16" align="center">&nbsp;</td>
                    </tr>
  </table>
</form>