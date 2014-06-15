<%@include file="include/fonctions/init_context.jsp" %>
<html>
<head> 
	<title>Site de recrutement</title>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
	<link rel="stylesheet" href="css/style.css" type="text/css" media="screen"/>
    <link rel="stylesheet" href="css/style_page.css" type="text/css" media="screen"/>
</head>
<body bgcolor="#d4d4d6" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table id="Tableau_01" width="810" height="1000" border="0" cellpadding="0" cellspacing="0" align="center">
	<tr>
		<td>
			<img src="images/index_01.png" width="810" height="87" alt=""></td>
	</tr>
	<tr>
		<td background="images/index_02.png" width="810" height="41">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="index.jsp" class="txt_2"><b>CANDIDAT</b></a> | <a href="Recruteur.jsp" class="txt_2"><b>RECRUTEUR</b></a> | <a href="admin.jsp" class="txt_2"><b>ADMIN</b></a></td>
	</tr>
	<tr>
		<td width="810" height="219">
            <table id="Tableau_01" width="810" height="219" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td colspan="5" bgcolor="#FFFFFF">
                        <img src="images/identifier/identi_01.jpg" width="810" height="23" alt=""></td>
                </tr>
                <tr>
                    <td bgcolor="#FFFFFF">
                        <img src="images/identifier/identi_02.jpg" width="9" height="181" alt=""></td>
                    <td bgcolor="#FFFFFF">
                        <img src="images/identifier/identi_03.jpg" width="488" height="181" alt=""></td>
                    <td bgcolor="#FFFFFF">
                        <img src="images/identifier/identi_04.jpg" width="23" height="181" alt=""></td>
                    <td width="279" height="181" bgcolor="#FFFFFF">
                    	<%@include file= "include/pages/identification/login_admin.jsp"%> 
                    </td>
                    <td bgcolor="#FFFFFF">
                        <img src="images/identifier/identi_06.jpg" width="11" height="181" alt=""></td>
                </tr>
                <tr>
                    <td colspan="5">
                        <img src="images/identifier/identi_07.jpg" width="810" height="15" alt=""></td>
                </tr>
            </table>
         </td>
	</tr> 
	<tr>
		<td background="images/index_08.png" width="810" height="210">
		<% if ((Admin)session.getAttribute("admin") != null) {%>
				<%@include file="include/pages/session/admin/menu_admin_new.jsp" %>
		<%} else {%>
				
		<% } %>
		</td>
	</tr>
	<tr>
		<td>
			<img src="images/index_05.png" width="810" height="1" alt=""></td>
	</tr>
	<tr>
		<td width="810" height="382" valign="top" background="images/index_06.png">
        <div id="contenu">
        	<%@include file="include/fonctions/redirectionAdm.jsp" %>
        </div>
        </td>
	</tr>
	<tr>
		<td>
			<img src="images/index_07.png" width="810" height="60" alt=""></td>
	</tr>
</table>
</body>
</html>