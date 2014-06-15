<%@include file="../../fonctions/init_context.jsp" %>

                         
                     <table width="550" height="139" align="center">
    <tr align="center">
        <td height="30"><h3>Rechercher Offre</h3></td>
    </tr>
    <tr align="center">
        <td>
            <form method="get" action="index.jsp?id=14&min=0" name="formulaireRecherche">
                <table width="469">
                    <tr>
                        <td>Titre</td>
                        <td><input type="text" name="titre" /></td>
                    </tr>
                    <tr>
                        <td width="128">Formation</td>
                        <td width="329"><select name="formation" style="width:160px">
                                <option value="-1" selected="selected"></option>
                                    <%
                                    FormationManager formManag = (FormationManager) context.lookup("FormationManager");
                              	   ArrayList<Formation> listForm = formManag.listefFormation();
                              	   
                                    	
                                        for(Formation f: listForm){
                                    %>
                                          <option value="<%= f.getIdformation() %>"><%= f.getLibelleFormation() %></option>
                                    <%
                                        }
                                    %>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Date de </td>
                        <td>
                            <input name="date_D" type="text" maxlength="10" /> &agrave; 
                            <input name="date_F" type="text" maxlength="10" />
                        </td>
                    </tr>
                    <tr>
                        <td>Societé</td>
                        <td ><select name="societe" style="width:160px">
                                <option value="-1" selected="selected"></option>
                                    <%
                                    	SocieteManager societeManag = (SocieteManager)context.lookup("SocieteManager") ;   
                                    	ArrayList<Societe> listSociete = societeManag.listeSociete();
                                    	
                                        for(Societe s: listSociete){
                                    %>
                                          <option value="<%= s.getIdsociete() %>"><%= s.getRaisonSocial() %></option>
                                    <%
                                        }
                                    %>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="hidden" name="id" value="14" /><input type="hidden" name="min" value="1" /></td><td align="right"><input type="submit" value="Rechercher" /></td>
                    </tr>
                </table>
            </form>
        </td>
    </tr>
</table>
