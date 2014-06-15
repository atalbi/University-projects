package entity;

import java.io.Serializable;
import java.sql.Date;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Offre implements Serializable {
	@Id
	private int idoffre;

	@Column(name="Titre_Offre")
	private String titreOffre;

	@Column(name="date_offre")
	private Date dateOffre;

	@Column(name="Off_description")
	@Lob
	private String offDescription;

	private int valide;

	@ManyToOne
	@JoinColumn(name="idFormation")
	private Formation idformation;

	@ManyToOne
	@JoinColumn(name="idSociete")
	private Societe idsociete;

	@OneToMany(mappedBy="idoffre")
	private Set<Candidature> candidatureCollection;

	private static final long serialVersionUID = 1L;

	public Offre() {
		super();
	}

	public int getIdoffre() {
		return this.idoffre;
	}

	public void setIdoffre(int idoffre) {
		this.idoffre = idoffre;
	}

	public String getTitreOffre() {
		return this.titreOffre;
	}

	public void setTitreOffre(String titreOffre) {
		this.titreOffre = titreOffre;
	}

	public Date getDateOffre() {
		return this.dateOffre;
	}

	public void setDateOffre(Date dateOffre) {
		this.dateOffre = dateOffre;
	}

	public String getOffDescription() {
		return this.offDescription;
	}

	public void setOffDescription(String offDescription) {
		this.offDescription = offDescription;
	}

	public int getValide() {
		return this.valide;
	}

	public void setValide(int valide) {
		this.valide = valide;
	}

	public Formation getIdformation() {
		return this.idformation;
	}

	public void setIdformation(Formation idformation) {
		this.idformation = idformation;
	}

	public Societe getIdsociete() {
		return this.idsociete;
	}

	public void setIdsociete(Societe idsociete) {
		this.idsociete = idsociete;
	}

	public Set<Candidature> getCandidatureCollection() {
		return this.candidatureCollection;
	}

	public void setCandidatureCollection(Set<Candidature> candidatureCollection) {
		this.candidatureCollection = candidatureCollection;
	}

}
