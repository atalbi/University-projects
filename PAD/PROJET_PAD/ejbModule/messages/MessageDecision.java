package messages;

import entity.Candidat;
import entity.Candidature;
import entity.Offre;
import entity.Societe;

public class MessageDecision extends MessageMdb {

	Candidat candidat;
	Candidature candidature;
	Societe societe;

	public MessageDecision(Candidat candidat, Candidature candidature,
			Societe societe) {
		super();
		this.candidat = candidat;
		this.candidature = candidature;
		this.societe = societe;
		id = 2;
	}

	public Candidat getCandidat() {
		return candidat;
	}

	public Candidature getCandidature() {
		return candidature;
	}

	public Societe getSociete() {
		return societe;
	}

}
