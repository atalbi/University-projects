<%@page import="entity.*"%>
            <%HttpSession sessionAdmin = request.getSession();
           	Admin a = (Admin)sessionAdmin.getAttribute("admin"); %>
            <div id="container">   
            <div align = "right">Bonjour <%=a.getLogin() %></div>         
                <div id="container_gauche">
                	
                      <ul>
                          
                          <li>Gestion des candidats</li>
                          <li>Gestion des recruteurs</li>
                          <li>Gestion des candidatures</li>
                          <li>Gestion des offres</li>
                          <li>Gestion des alertes</li>
                          <li>Gestion des formations</li>
                          <li>Gestion des admins</li>
                          <li>Se déconnecter</li>
                          
                      </ul>
                  </div>


                

                <div id="container_droite">
                         <div id="fiche_admin" class="rubrique" align="center">
                         	<div id="admin"><h3 >Statistiques globalesx</h3>
                    		
                        		<table>
                        		<tr> 
                        			<td> Nombre total de candidats inscrits: </td>
                        			<td>NB</td>
                        		
                        		</tr>
                        		<tr> 
                        			<td> Nombre total de societes enregistrées: </td>
                        			<td>NB</td>
                        		</tr>
                        		<tr> 
                        			<td> Nombre total d'offres publiées: </td>
                        			<td>NB</td>
                        		
                        		</tr>
                        		<tr> 
                        			<td> Nombre total de candidatures<: </td>
                        			<td>NB</td>
                        		</tr>
                        		<tr> 
                        			<td> Nombre total d'alertes candidat: </td>
                        			<td>NB</td>
                        		
                        		</tr>
                        		<tr> 
                        			<td> Offres a supprimer : </td>
                        			<td>NB</td>
                        		</tr>
                        		<tr> 
                        			<td> Candidat a supprimer: </td>
                        			<td>NB</td>
                        		
                        		</tr>
                        		<tr> 
                        			<td> Societe a supprimer: </td>
                        			<td>NB</td>
                        		</tr>
                        		</table>
							
                          	</div>
                          	
                        </div>

                  </div>
                  
            </div>
 