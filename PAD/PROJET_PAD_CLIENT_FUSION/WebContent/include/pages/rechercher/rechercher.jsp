<%@page import="entity.Societe"%>
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
	OffreManager offreManag1 = (OffreManager)context.lookup("OffreManager");
	ArrayList<Offre> listeOffres11 = offreManag1.listeOffres("dt","DESC");
	int uu = 0;
	%>
    <script>
	$(function() {
		var availableTags = [<% for (Offre o: listeOffres11) {%>
									 "<%=o.getTitreOffre()%>"
									 <%
									 uu++;
									 if (uu != listeOffres11.size()) {
									 	%>,<%
									 }
									 }
									 %>
			
			
		];
		$( "#tags" ).autocomplete({
			source: availableTags
		});
	});
	</script>
<form method="get" action="index.jsp?id=1&min=0&#contenu" name="formulaireRecherche">
                <table width="557"> 
                	<tr>
                    	<td height="23"></td><td colspan="5">Rechercher offre</td>
                    </tr>
                    <tr>
                      <td width="3" rowspan="3" align="center">&nbsp;</td>
                        <td height="24">&nbsp;&nbsp;&nbsp;<span class="txt_0">Titre</span></td>
                        <td><div id="ui-widget"><input id="tags" type="text" name="titre"  style="width:165px" value="<% if(!(""+request.getParameter("titre")).equals("null")){                 	out.println(""+request.getParameter("titre"));} %>"/></div></td>
                        
                        <td>&nbsp;&nbsp;&nbsp;<span class="txt_0">Societ&eacute;</span></td><td colspan="2"><select name="societe" style="width:165px">
                          <option value="-1" selected="selected"></option>
                          <%
                          String id_form;
                                    	SocieteManager societeManag = (SocieteManager)context.lookup("SocieteManager") ;   
                                    	ArrayList<Societe> listSociete = societeManag.listeSociete();
                                    
										id_form = ""+request.getParameter("societe");
									   if(id_form.equals("null")){
										   id_form = "-1";
									   }
									
                                        for(Societe s: listSociete){
                                    %>
                          <option value="<%= s.getIdsociete() %>" <%if((id_form).equals(""+s.getIdsociete())){ out.print("selected=\"selected\""); }%>><%= s.getRaisonSocial() %></option>
                          <%
                                        }
                                    %>
                        </select></td>
                        
                    </tr> 
                    <tr>
                      <td width="82" height="24" >&nbsp;&nbsp;&nbsp;<span class="txt_0">Formation</span></td>
                        <td width="169" ><select name="formation" style="width:165px">
                                <option value="-1" selected="selected"></option>
                                    <%
									
                                   FormationManager formManag = (FormationManager) context.lookup("FormationManager");
                              	   ArrayList<Formation> listForm = formManag.listefFormation();
                              	   
								   id_form = ""+request.getParameter("formation");
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
                        </td>
                        
                        <td width="93">&nbsp;&nbsp;&nbsp;<span class="txt_0">P&eacute;riode du </span></td>
                        <td colspan="2"><input name="date_D" type="text" maxlength="10"  style="width:71px" value="<% if(!(""+request.getParameter("date_D")).equals("null")){                 	out.println(""+request.getParameter("date_D"));} %>"/> 
                        <span class="txt_0">au </span>
                            <input name="date_F" type="text" maxlength="10" style="width:75px" value="<% if(!(""+request.getParameter("date_F")).equals("null")){                 	out.println(""+request.getParameter("date_F"));} %>"/>
                        </td>
                    </tr>
                    <tr>
                      <td height="24" >&nbsp;</td>
                        <td>
                            </td><td align="center"><input type="hidden" name="id" value="1" />
                              <input type="hidden" name="min" value="1" /></td>
                            <td width="175" align="right"><input type="submit" value="Rechercher" /></td>
                            <td width="7" align="right">&nbsp;</td>
                    </tr>
                </table>
</form>