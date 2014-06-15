package entity;

import java.util.Date;

public class AfficheCandidatureParCandidat {
	Offre offre;
	Societe recruteur;
	Date date;
	String decision;
	
	public AfficheCandidatureParCandidat(Offre offre, Societe soc, Date date, String decision) {
		this.offre = offre;
		this.recruteur = soc;
		this.date = date;
		this.decision = decision;
	}

	public Offre getOffre() {
		return offre;
	}

	public void setOffre(Offre offre) {
		this.offre = offre;
	}

	public Societe getRecruteur() {
		return recruteur;
	}

	public void setRecruteur(Societe recruteur) {
		this.recruteur = recruteur;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getDecision() {
		return decision;
	}

	public void setDecision(String decision) {
		this.decision = decision;
	}
	
	

}
