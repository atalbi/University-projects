<div id="container_gauche">
<%@page import="entity.Admin" %>
<%HttpSession sessionAd = request.getSession();
	Admin aa = (Admin)sessionAd.getAttribute("admin"); %>
                      <ul>
                          
                          <li>Gestion des candidats</li>
                          <div><a href="admin.jsp?id=54">Ajouter un candidat</a></div>
                          <div><a href="admin.jsp?id=53&tri=df&ord=DESC&min=1">Afficher la liste des candidats</a></div>
                          <li>Gestion des recruteurs</li>
                          <div><a href="admin.jsp?id=50">Ajouter une soci�t�</a></div>
                          <div><a href="admin.jsp?id=45&tri=df&ord=DESC&min=1">Afficher la liste des soci�t�s</a></div>
                          <li>Gestion des candidatures</li>
                          <div><a href="admin.jsp?id=44&tri=dtC&min=1&ord=DESC">Afficher la liste des candidatures</a></div>
                          <li>Gestion des offres</li>
                          <div><a href="admin.jsp?id=39">Ajouter une offre</a></div>
                          <div><a href="admin.jsp?id=40&tri=dt&ord=DESC&min=1">Afficher la liste des offres</a></div>
                          <li>Gestion des alertes</li>
                          <div><a href="admin.jsp?id=34">Cr�er une alerte</a></div>
                          <div><a href="admin.jsp?id=35&tri=df&ord=DESC&min=1">Afficher la liste des alertes</a></div>
                          <li>Gestion des formations</li>
                          <div><a href="admin.jsp?id=30">Ajouter une formation</a></div>
                          <div><a href="admin.jsp?id=32">Afficher la liste des formations</a></div>
                          <li>Gestion des admins</li>
                          <div><a href="admin.jsp?id=26">Cr�er un nouvel admin</a></div>
                          <div><a href="admin.jsp?id=27&idAd=<%=aa.getIdadmin() %>">Editer mon profil</a></div>
                          <div><a href="admin.jsp?id=29&idAd=<%=aa.getIdadmin() %>">Supprimer mon profil</a></div>
                          <div><a href="admin.jsp?id=28">Liste des comptes admin</a></div>
                          <li><a href="admin.jsp?id=7">Statistiques</a></li>
                          <li><a href="sDeconnecterAdmin">Se d�connecter</a></li>
                          
                      </ul>
                  </div>