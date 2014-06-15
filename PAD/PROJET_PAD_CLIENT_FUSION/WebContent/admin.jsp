<%@include file="include/fonctions/init_context.jsp" %>
<html>
<head>
<title>Site de recrutement</title>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
	<link rel="stylesheet" href="css/style.css" type="text/css" media="screen"/>
    <link rel="stylesheet" href="css/style_page.css" type="text/css" media="screen"/>
    <link rel="stylesheet" href="css/carrousel.css" type="text/css">
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="js/script_diaporama.js"></script>
</head>
<body bgcolor="#d4d4d6"  leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<!-- Save for Web Slices (Sans titre-2.psd) -->
<table id="Tableau_01" width="811" height="871" border="0" cellpadding="0" cellspacing="0" align="center">
	<tr>
		<td>
			<img src="images/_index_01.jpg" width="811" height="12" alt=""></td>
	</tr>
	<tr>
		<td background="images/_index_02.jpg" width="811" height="40">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="index.jsp" class="txt_2"><b>CANDIDAT</b></a> | <a href="Recruteur.jsp" class="txt_2"><b>RECRUTEUR</b></a> | <span class="txt_1"><b>ADMIN</b></span></td>
	</tr>
	<tr>
		<td><table id="Tableau_01" width="810" height="219" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td colspan="5" bgcolor="#FFFFFF">
                        <img src="images/identifier/identi_01.jpg" width="810" height="23" alt=""></td>
                </tr>
                <tr>
                    <td bgcolor="#FFFFFF">
                        <img src="images/identifier/identi_02.jpg" width="9" height="181" alt=""></td>
                    <td bgcolor="#FFFFFF" width="488" height="181" >
                        <div id="conteneur">
            <div id="carrousel">
                <div id="slide1" class="slide">
                    <div class="visu">
                        <img src="images/03.png" alt="">
                    </div>
                </div>
                <div id="slide2" class="slide">
                    <div class="visu">
                        <img src="images/04.png" alt="">
                    </div>
                </div>
                
            </div>
       </div></td>
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
      </table></td>
	</tr>
	<tr>
		<% if ((Admin)session.getAttribute("admin") != null) {%>
		<td background="images/rec_041.jpg" width="811" height="138">
			<%@include file="include/pages/session/admin/menu_admin_new.jsp" %>
		</td>
		<%} else {%>
		<td background="images/rec_04.jpg" width="811" height="138">
				<%@include file="include/pages/rechercher/rechercher.jsp" %>
		</td>
		<% } %>
            
	</tr>
	<tr>
		<td width="811" height="408" valign="top" background="images/_index_05.jpg">
			<div id="contenu">
        	<%@include file="include/fonctions/redirectionAdm.jsp" %>
        </div></td>
	</tr>
	<tr>
		<td>
			<img src="images/_index_06.jpg" width="811" height="35" alt=""></td>
	</tr>
	<tr>
		<td>
			<img src="images/_index_07.jpg" width="811" height="18" alt=""></td>
	</tr>
</table>
<!-- End Save for Web Slices -->
</body>
</html>