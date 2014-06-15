
            <%
			HttpSession sessionSoc = request.getSession();
           	Societe s = (Societe)sessionSoc.getAttribute("societe");
 
           	if (s != null) {
           		String idO = request.getParameter("o");
           		sessionSoc.setAttribute("idOffre", idO);
           		%>
                <%@include file="../fiche_offre.jsp" %>
            <%
           	} else {
           		if (request.getParameter("of").equals("1")) { //il s'agit dune offre issue d'une recherche d'offre en mode non connecté
           			String numOff = request.getParameter("o");
           			sessionSoc.setAttribute("idOffre", numOff);
           			%> 
           				<%@include file="../fiche_offre.jsp" %>
           			<%
           		}
           		else {//cas d'une offre issue d'une recherche d'offre d'un candidat connecté mais dont la session est expirée
           		response.sendRedirect(response.encodeRedirectURL("index.jsp?id=3&r=1"));
           		}
           	} %>
 