<%@include file="../../../fonctions/init_context.jsp" %>
<%
	CandidatManager candidatManag = (CandidatManager)context.lookup("CandidatManager");
	if(candidatManag.verif_DoublonEmail(request.getParameter("email")) == true){
		out.println("false");
	}else{
		out.println("true");
	}
%>