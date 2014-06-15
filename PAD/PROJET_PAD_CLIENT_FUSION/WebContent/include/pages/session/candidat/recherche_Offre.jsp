<%HttpSession sessionCand = request.getSession();
           	Candidat c = (Candidat)sessionCand.getAttribute("candidat");
           	if (c !=null) {
           	%>
            <div id="container">
            <div align = "right">Bonjour <%=c.getNom()%></div>
			<%@include file="menu_candidat.html" %>

                <div id="container_droite">
					<%@include file="../module_rechercheOff_Connecte.jsp" %>
                  </div>
                  
            </div>
            
            <%}
        	else {
           		//session expirée
           		response.sendRedirect(response.encodeRedirectURL("index.jsp?id=2&r=1"));
           		} %>
