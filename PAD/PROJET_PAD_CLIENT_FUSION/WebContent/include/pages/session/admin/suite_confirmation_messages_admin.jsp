<%
int ok_ = ((Integer)session.getAttribute("okAd")).intValue();
if (ok_ == 11){%>
	<div align="center" class="error_log_1">Erreur: alerte non trouv�e !</div>
<% 
session.removeAttribute("okAd");
}
else if (ok_ == 12){%>
	<div align="center" class="error_log_1">Erreur: veuillez renseigner tous les champs !</div>
<% 
session.removeAttribute("okAd");
}
else if (ok_ == 13){%>
<div align="center" class="error_log_1">Erreur: offre non trouv�e !</div>
<% 
session.removeAttribute("okAd");
}
else if (ok_ == 14){%>
<div align="center" class="error_log_1">Erreur: candidature non trouv�e !</div>
<% 
session.removeAttribute("okAd");
}
else if (ok_ == 15){%>
<div align="center" class="error_log_1">Erreur: soci�t� non trouv�e !</div>
<% 
session.removeAttribute("okAd");
}
else if (ok_ == 16){%>
<div align="center" class="error_log_1">Erreur: assurez-vous que les champs raison sociale, login et mot de passe ont bien �t� renseign�s  !</div>
<% 
session.removeAttribute("okAd");
}
else if (ok_ == 17){%>
<div align="center" class="error_log_1">Erreur: une soci�t� ayant le m�me login et/ou la m�me raison sociale existe d�j� !</div>
<% 
session.removeAttribute("okAd");
}
else if (ok_ == 18){%>
<div align="center" class="error_log_1">Erreur: le champ VALIDE ne peut prendre que la valeur 1 ou 0 !</div>
<% 
session.removeAttribute("okAd");
}		
else if (ok_ == 19){%>
<div align="center" class="error_log_1">Erreur: formation non trouv�e !</div>
<% 
session.removeAttribute("okAd");
}	
else if (ok_ == 20){%>
<div align="center" class="error_log_1">Erreur: candidat non trouv� !</div>
<% 
session.removeAttribute("okAd");
}
else if (ok_ == 21){%>
<div align="center" class="error_log_1">Erreur: assurez-vous que les champs nom, pr�nom, email, mot de passe du candidat, sont bien renseign�s !</div>
<% 
session.removeAttribute("okAd");
}
else if (ok_ == 22){%>
<div align="center" class="error_log_1">Erreur: l'adresse email saisie existe d�j� dans la base !</div>
<% 
session.removeAttribute("okAd");
}
else if (ok_ == 23){%>
<div align="center" class="error_log_1">Erreur: ce candidat existe d�j� dans la base de donn�e !</div>
<% 
session.removeAttribute("okAd");
}
%>