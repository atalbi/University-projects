<%
int ok = ((Integer) session.getAttribute("ok")).intValue();
if (ok == 1) {
%>
<div align="center" class="info_log_1">Votre profil a �t� cr�� avec succ�s !</div>
<%  
} else if (ok == 0) {
%>
<div align="center" class="error_log_1">Erreur: assurez-vous que tous les champs sont bien remplis</div>
<%  
} else if (ok == 2) {
%>
<div align="center" class="error_log_1">Erreur: l'adresse email indiqu�e existe d�j� !</div>
<%  
} else if (ok == 3) {
%>
<div align="center" class="error_log_1">Erreur: cette societe existe d�j� dans la base de donn�e !</div>
<%  
} else if (ok == 6) {
%>
<div align="center" class="info_log_1">Votre d�cision a �t� transmise au candidat concern�.</div>
<%  
} else if (ok == 7) {
%>
<div align="center" class="info_log_1">L'offre a �t� ajout�e avec succ�s !</div>
<%  
} else if (ok == 8) {
%>
<div align="center" class="error_log_1">Ce titre existe d�j�, veuillez modifier le titre de l'offre.</div>
<%  
} else if (ok == 9) {
%>
<div align="center" class="error_log_1">Veuillez remplir tous les champs du formulaire</div>
<%
} else if (ok == 10){%>
<div align="center" class="error_log_1">Erreur: une soci�t� ayant la m�me adresse email et/ou la m�me raison sociale existe d�j� !</div>
<% 
} else if (ok == 11){%>
<div align="center" class="error_log_1">Erreur: offre non trouv�e !</div>
<% 
}

session.removeAttribute("ok");

%>

