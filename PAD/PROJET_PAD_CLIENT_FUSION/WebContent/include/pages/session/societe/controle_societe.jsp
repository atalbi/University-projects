<%@include file="../../../fonctions/init_context.jsp" %>
<%
	SocieteManager societeManag = (SocieteManager)context.lookup("SocieteManager");
	if(request.getParameter("id").equals("1")){
		if(societeManag.verif_DoublonLogin(request.getParameter("email")) == true){
			out.println("false");
		}else{
			out.println("true");
		}
	}else{
		if(societeManag.verif_DoublonNomSociete(request.getParameter("RS")) == true){
			out.println("false");
		}else{
			out.println("true");
		}

	}
%>