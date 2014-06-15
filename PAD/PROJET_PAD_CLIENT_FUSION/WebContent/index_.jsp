<%
out.print("toto1");	
if(session.getAttribute("societe") != null){
		out.print("toto");
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link rel="stylesheet" href="css/style.css" type="text/css" media="screen"/>
	<title>Plate forme d'e-Recrutement</title>
</head>
<body>
	<div id="top"></div>
	<div id="menu">
        <span id="menu1" class="item_menu"><a href="index.jsp">Accueil</a></span>
        <span id="menu2" class="item_menu"><a href="index.jsp?id=2&r=1">Candidat</a></span>
        <span id="menu3" class="item_menu"><a href="index.jsp?id=3">Recruteur</a></span>
        <span id="menu4" class="item_menu"><a href="index.jsp?id=4">Admin</a></span>
    </div>
    <div id="contenu">
    	
        <bR /><bR /><bR />

<div id="container_accueil">
            <%@include file="include/fonctions/redirection.jsp" %>
</div>
        
  	</div>
</body>
</html>
