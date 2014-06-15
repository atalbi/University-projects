<%
int ok = ((Integer) session.getAttribute("ok")).intValue();
if (ok == 1) {
%>
<div align="center" class="info_log_1">Votre profil a été créé avec succès !</div>
<%  
} else if (ok == 0) {
%>
<div align="center" class="error_log_1">Erreur: assurez-vous que tous les champs sont bien remplis</div>
<%  
} else if (ok == 2) {
%>
<div align="center" class="error_log_1">Erreur: l'adresse email indiquée existe déjà !</div>
<%  
} else if (ok == 3) {
%>
<div align="center" class="error_log_1">Erreur: cette societe existe déjà dans la base de donnée !</div>
<%  
} else if (ok == 6) {
%>
<div align="center" class="info_log_1">Votre décision a été transmise au candidat concerné.</div>
<%  
} else if (ok == 7) {
%>
<div align="center" class="info_log_1">L'offre a été ajoutée avec succès !</div>
<%  
} else if (ok == 8) {
%>
<div align="center" class="error_log_1">Ce titre existe déjà, veuillez modifier le titre de l'offre.</div>
<%  
} else if (ok == 9) {
%>
<div align="center" class="error_log_1">Veuillez remplir tous les champs du formulaire</div>
<%
} else if (ok == 10){%>
<div align="center" class="error_log_1">Erreur: une société ayant la même adresse email et/ou la même raison sociale existe déjà !</div>
<% 
} else if (ok == 11){%>
<div align="center" class="error_log_1">Erreur: offre non trouvée !</div>
<% 
}

session.removeAttribute("ok");

%>

