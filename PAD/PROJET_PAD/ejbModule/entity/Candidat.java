package entity;

import java.io.Serializable;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Candidat implements Serializable {
	@Id
	private int idcandidat;

	private String nom;

	private String prenom;

	@Column(name="Niveau_etudes")
	private String niveauEtudes;

	private String cv;

	private String email;

	private String password;

	private int valide;

	@Lob
	private String observation;

	private String tel;

	@ManyToOne
	@JoinColumn(name="idFormation")
	private Formation idformation;

	@OneToMany(mappedBy="idcandidat")
	private Set<Alerte> alerteCollection;

	@OneToMany(mappedBy="idcandidat")
	private Set<Candidature> candidatureCollection;

	private static final long serialVersionUID = 1L;

	public Candidat() {
		super();
	}

	public int getIdcandidat() {
		return this.idcandidat;
	}

	public void setIdcandidat(int idcandidat) {
		this.idcandidat = idcandidat;
	}

	public String getNom() {
		return this.nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public String getPrenom() {
		return this.prenom;
	}

	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}

	public String getNiveauEtudes() {
		return this.niveauEtudes;
	}

	public void setNiveauEtudes(String niveauEtudes) {
		this.niveauEtudes = niveauEtudes;
	}

	public String getCv() {
		return this.cv;
	}

	public void setCv(String cv) {
		this.cv = cv;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getValide() {
		return this.valide;
	}

	public void setValide(int valide) {
		this.valide = valide;
	}

	public String getObservation() {
		return this.observation;
	}

	public void setObservation(String observation) {
		this.observation = observation;
	}

	public String getTel() {
		return this.tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public Formation getIdformation() {
		return this.idformation;
	}

	public void setIdformation(Formation idformation) {
		this.idformation = idformation;
	}

	public Set<Alerte> getAlerteCollection() {
		return this.alerteCollection;
	}

	public void setAlerteCollection(Set<Alerte> alerteCollection) {
		this.alerteCollection = alerteCollection;
	}

	public Set<Candidature> getCandidatureCollection() {
		return this.candidatureCollection;
	}

	public void setCandidatureCollection(Set<Candidature> candidatureCollection) {
		this.candidatureCollection = candidatureCollection;
	}

}
