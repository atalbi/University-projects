<%HttpSession sessionSoc = request.getSession();
           	Societe s = (Societe)sessionSoc.getAttribute("societe");
           	if (s !=null) {
           	%>
            <div id="container">
            <div align = "right">Bonjour <%=s.getRaisonSocial()%></div>
			<%@include file="menu_societe.html" %>

                <div id="container_droite">
					<%@include file="module_rechercheCandidat.jsp" %>
                  </div>
                  
            </div>
            
            <%}
        	else {
           		//session expir�e
           		response.sendRedirect(response.encodeRedirectURL("index.jsp?id=3&r=1"));
           		} %>
