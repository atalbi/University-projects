package entity;

import java.io.Serializable;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Formation implements Serializable {
	@Id
	private int idformation;

	@Column(name="Libelle_Formation")
	private String libelleFormation;

	@OneToMany(mappedBy="idformation")
	private Set<Offre> offreCollection;

	@OneToMany(mappedBy="idformation")
	private Set<Candidat> candidatCollection;

	private static final long serialVersionUID = 1L;

	public Formation() {
		super();
	}

	public int getIdformation() {
		return this.idformation;
	}

	public void setIdformation(int idformation) {
		this.idformation = idformation;
	}

	public String getLibelleFormation() {
		return this.libelleFormation;
	}

	public void setLibelleFormation(String libelleFormation) {
		this.libelleFormation = libelleFormation;
	}

	public Set<Offre> getOffreCollection() {
		return this.offreCollection;
	}

	public void setOffreCollection(Set<Offre> offreCollection) {
		this.offreCollection = offreCollection;
	}

	public Set<Candidat> getCandidatCollection() {
		return this.candidatCollection;
	}

	public void setCandidatCollection(Set<Candidat> candidatCollection) {
		this.candidatCollection = candidatCollection;
	}

}
