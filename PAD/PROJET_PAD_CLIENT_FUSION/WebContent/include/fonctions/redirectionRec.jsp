<%
	int id = 0;
	if(request.getParameter("id") == null){
		id = 0;
	}else{
		id = Integer.parseInt(request.getParameter("id"));
	}
	if (((Societe)session.getAttribute("societe")) != null) { %>
	<center><div id="menu_anim1"></div></center>  
<%}
	if (id == 0){%>
			
    <% } else if (id == 1){ %>   
		<%@include file="../pages/rechercher/afficherRechercheSociete.jsp" %>       
	<% } else if (id == 2){  %>   
		<%@include file="../pages/session/societe/fiche_Candidature.jsp" %>       
	<% } else if (id == 3){  %>   
		<%@include file="../pages/session/societe/profil_recruteur.jsp" %>       
	<% } else if (id == 4){  %>   
		<%@include file="../pages/session/societe/edit_profil_recrut.jsp" %>       
	<% } else if (id == 5){  %>   
		<%@include file="../pages/session/societe/listeCandidatures_ParOffre.jsp" %>       
	<% } else if (id == 6){  %>   
		<%@include file="../pages/session/societe/decision.jsp"%>     
	<% } else if (id == 7){  %>   
		<%@include file="../pages/session/societe/module_resultatRechercheOff_Societe.jsp"%>
	<% } else if (id == 8){  %>   
		<%@include file="../pages/session/societe/display_ficheOffreSoc.jsp"%>
	<% } else if (id == 10){  %>   
		<%@include file="../pages/session/societe/Editer_Offre.jsp"%>
	<% } else if (id == 11){  %>   
		<%@include file="../pages/session/societe/delete_Offre.jsp"%>
	<% } else if (id == 12){  %>   
		<%@include file="../pages/session/societe/ajouter_offre.jsp"%>
	<% } else if (id == 13){  %>   
		<%@include file="../pages/session/societe/new_profilSoc.jsp"%>
	<% } else if (id == 14){  %>   
		<%@include file="../pages/session/societe/desinscription.jsp"%>
	<% } else if (id == 15){  %>   
		<%@include file="../pages/session/societe/messages_divers.jsp"%>
	<% }%>
	
	
	
	
	
	
	