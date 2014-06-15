	<%
	int id = 0;
	if(request.getParameter("id") == null){
		id = 0;
	}else{
		id = Integer.parseInt(request.getParameter("id"));
		
	}
	if (((Candidat)session.getAttribute("candidat")) != null) { %>
		<center><div id="menu_anim"></div></center>  
	<%}
	if (id == 0){
		if (((Candidat)session.getAttribute("candidat")) == null) {
	%>
    	<%@include file="../pages/session/candidat/index_dernierOffre.jsp" %>     
    <% 
		}
		} else if (id == 1){ %>   
		<%@include file="../pages/rechercher/afficherRecherche.jsp" %>
             
	<% } else if (id == 17) { %>
		<%@include file="../pages/session/candidat/candidater.jsp"%>
	<% } else if (id == 19) { %>
		<%@include file="../pages/session/candidat/confirmation_messages_candidat.jsp"%>
	<% } else if (id == 5) { %>
		<%@include file="../pages/session/candidat/profil_candidat.jsp"%>
	<% }  else if (id == 8) { %>
		<%@include file="../pages/session/candidat/edit_profil.jsp"%>
	<% } else if (id == 9) { %>
		<%@include file="../pages/session/candidat/alertes.jsp"%>
	<% }else if (id == 10) { %>
		<%@include file="../pages/session/candidat/candidatures.jsp"%>
	<% }else if (id == 15) { %>
		<%@include file="../pages/session/confirmation_messages_divers.jsp"%>
	<% }else if (id == 16) { %>
		<%@include file="../pages/session/candidat/new_profil.jsp"%>
	<% }else if (id == 18) { %>
		<%@include file="../pages/session/candidat/new_alerte.jsp"%>
	<% }else if (id == 20) { %>
		<%@include file="../pages/session/candidat/edit_alerte.jsp"%>
	<% } else if (id == 21) { %>
		<%@include file="../pages/session/candidat/delete_alerte.jsp"%>
	<% } else if (id == 22) { %>
		<%@include file="../pages/session/candidat/listeOffres_ParAlerte.jsp"%>
	<% } else if (id == 23) { %>
		<%@include file="../pages/session/fiche_offre.jsp"%>
	<% } else if (id == 24) { %>
		<%@include file="../pages/session/candidat/desinscrire.jsp"%>
	<% } %>
	
	
	
	