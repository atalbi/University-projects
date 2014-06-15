package entity;

import java.io.Serializable;
import java.sql.Date;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;

@Entity
public class Candidature implements Serializable {
	@Id
	private int idcandidature;

	private Date date;

	@Lob
	private String observation;

	private String decision;

	@ManyToOne
	@JoinColumn(name="idCandidat")
	private Candidat idcandidat;

	@ManyToOne
	@JoinColumn(name="idOffre")
	private Offre idoffre;

	private static final long serialVersionUID = 1L;

	public Candidature() {
		super();
	}

	public int getIdcandidature() {
		return this.idcandidature;
	}

	public void setIdcandidature(int idcandidature) {
		this.idcandidature = idcandidature;
	}

	public Date getDate() {
		return this.date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getObservation() {
		return this.observation;
	}

	public void setObservation(String observation) {
		this.observation = observation;
	}

	public String getDecision() {
		return this.decision;
	}

	public void setDecision(String decision) {
		this.decision = decision;
	}

	public Candidat getIdcandidat() {
		return this.idcandidat;
	}

	public void setIdcandidat(Candidat idcandidat) {
		this.idcandidat = idcandidat;
	}

	public Offre getIdoffre() {
		return this.idoffre;
	}

	public void setIdoffre(Offre idoffre) {
		this.idoffre = idoffre;
	}

}
