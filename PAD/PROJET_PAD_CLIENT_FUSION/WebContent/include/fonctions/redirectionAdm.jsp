<%
	int id = 0;
	if(request.getParameter("id") == null){
		id = 0;
	}else{
		id = Integer.parseInt(request.getParameter("id"));
	}
	
	if (id == 0){%>
		
    <% } else if (id == 7){ %>   
		<%@include file="../pages/session/admin/profil_admin.jsp" %>      
	<% } else  if (id == 25){ %>  
	 	<%@include file="../pages/session/admin/confirmation_messages_admin.jsp" %>
	<% }  else  if (id == 26){ %>  
	 	<%@include file="../pages/session/admin/gestion_admins/new_admin.jsp" %>
	<% } else  if (id == 27){ %>  
	 	<%@include file="../pages/session/admin/gestion_admins/edit_profil.jsp" %>
	<% } else  if (id == 28){ %>  
	 	<%@include file="../pages/session/admin/gestion_admins/liste_admins.jsp" %>
	<% } else  if (id == 29){ %>  
	 	<%@include file="../pages/session/admin/gestion_admins/delete_admin.jsp" %>
	<% } else  if (id == 30){ %>  
	 	<%@include file="../pages/session/admin/gestion_formations/new_formation.jsp" %>
	<% } else  if (id == 31){ %>  
	 	<%@include file="../pages/session/admin/gestion_formations/edit_formation.jsp" %>
	<% } else  if (id == 32){ %>  
	 	<%@include file="../pages/session/admin/gestion_formations/formations.jsp" %>
	<% } else  if (id == 33){ %>  
	 	<%@include file="../pages/session/admin/gestion_formations/delete_formation.jsp" %>
	<% } else  if (id == 34){ %>  
	 	<%@include file="../pages/session/admin/gestion_alertes/new_alerte.jsp" %>
	<% }else  if (id == 35){ %>  
	 	<%@include file="../pages/session/admin/gestion_alertes/liste_alertes.jsp" %>
	<% }else  if (id == 36){ %>  
	 	<%@include file="../pages/session/admin/gestion_alertes/edit_alerte.jsp" %>
	<% }else  if (id == 37){ %>  
	 	<%@include file="../pages/session/admin/gestion_alertes/delete_alerte.jsp" %>
	<% }else  if (id == 38){ %>  
	 	<%@include file="../pages/session/admin/gestion_alertes/liste_offresParAlerte.jsp" %>
	<% }else  if (id == 39){ %>  
	 	<%@include file="../pages/session/admin/gestion_offres/new_offre.jsp" %>
	<% } else  if (id == 40){ %>  
	 	<%@include file="../pages/session/admin/gestion_offres/liste_offres.jsp" %>
	<% } else  if (id == 41){ %>  
	 	<%@include file="../pages/session/admin/gestion_offres/edit_offre.jsp" %>
	<% } else  if (id == 42){ %>  
	 	<%@include file="../pages/session/admin/gestion_offres/delete_offre.jsp" %>
	<% } else  if (id == 43){ %>  
	 	<%@include file="../pages/session/admin/gestion_candidatures/liste_candidaturesParOffre.jsp" %>
	<% } else  if (id == 44){ %>  
	 	<%@include file="../pages/session/admin/gestion_candidatures/liste_candidatures.jsp" %>
	<% } else  if (id == 45){ %>  
	 	<%@include file="../pages/session/admin/gestion_recruteurs/liste_societes.jsp" %>
	<% } else  if (id == 46){ %>  
	 	<%@include file="../pages/session/admin/gestion_candidatures/ficheCandidature.jsp" %>
	<% } else  if (id == 47){ %>  
	 	<%@include file="../pages/session/admin/gestion_candidatures/delete_candidature.jsp" %>
	<% }else  if (id == 48){ %>  
	 	<%@include file="../pages/session/admin/gestion_recruteurs/delete_societe.jsp" %>
	<% } else  if (id == 49){ %>  
	 	<%@include file="../pages/session/admin/gestion_recruteurs/edit_societe.jsp" %>
	<% } else  if (id == 50){ %>  
	 	<%@include file="../pages/session/admin/gestion_recruteurs/new_profilSociete.jsp" %>
	<% }else  if (id == 51){ %>  
	 	<%@include file="../pages/session/admin/gestion_candidats/delete_candidat.jsp" %>
	<% }else  if (id == 52){ %>  
	 	<%@include file="../pages/session/admin/gestion_candidats/edit_profilCandidat.jsp" %>
	<% }else  if (id == 53){ %>  
	 	<%@include file="../pages/session/admin/gestion_candidats/liste_candidats.jsp" %>
	<% }else  if (id == 54){ %>  
	 	<%@include file="../pages/session/admin/gestion_candidats/new_profilCandidat.jsp" %>
	<% }else  if (id == 55){ %>  
	 	<%@include file="../pages/session/admin/gestion_candidats/fiche_Candidat.jsp" %>
	<% }
	%>