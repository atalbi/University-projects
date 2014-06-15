<%
int ok_ = ((Integer)session.getAttribute("okAd")).intValue();
if (ok_ == 11){%>
	<div align="center" class="error_log_1">Erreur: alerte non trouvée !</div>
<% 
session.removeAttribute("okAd");
}
else if (ok_ == 12){%>
	<div align="center" class="error_log_1">Erreur: veuillez renseigner tous les champs !</div>
<% 
session.removeAttribute("okAd");
}
else if (ok_ == 13){%>
<div align="center" class="error_log_1">Erreur: offre non trouvée !</div>
<% 
session.removeAttribute("okAd");
}
else if (ok_ == 14){%>
<div align="center" class="error_log_1">Erreur: candidature non trouvée !</div>
<% 
session.removeAttribute("okAd");
}
else if (ok_ == 15){%>
<div align="center" class="error_log_1">Erreur: société non trouvée !</div>
<% 
session.removeAttribute("okAd");
}
else if (ok_ == 16){%>
<div align="center" class="error_log_1">Erreur: assurez-vous que les champs raison sociale, login et mot de passe ont bien été renseignés  !</div>
<% 
session.removeAttribute("okAd");
}
else if (ok_ == 17){%>
<div align="center" class="error_log_1">Erreur: une société ayant le même login et/ou la même raison sociale existe déjà !</div>
<% 
session.removeAttribute("okAd");
}
else if (ok_ == 18){%>
<div align="center" class="error_log_1">Erreur: le champ VALIDE ne peut prendre que la valeur 1 ou 0 !</div>
<% 
session.removeAttribute("okAd");
}		
else if (ok_ == 19){%>
<div align="center" class="error_log_1">Erreur: formation non trouvée !</div>
<% 
session.removeAttribute("okAd");
}	
else if (ok_ == 20){%>
<div align="center" class="error_log_1">Erreur: candidat non trouvé !</div>
<% 
session.removeAttribute("okAd");
}
else if (ok_ == 21){%>
<div align="center" class="error_log_1">Erreur: assurez-vous que les champs nom, prénom, email, mot de passe du candidat, sont bien renseignés !</div>
<% 
session.removeAttribute("okAd");
}
else if (ok_ == 22){%>
<div align="center" class="error_log_1">Erreur: l'adresse email saisie existe déjà dans la base !</div>
<% 
session.removeAttribute("okAd");
}
else if (ok_ == 23){%>
<div align="center" class="error_log_1">Erreur: ce candidat existe déjà dans la base de donnée !</div>
<% 
session.removeAttribute("okAd");
}
%>