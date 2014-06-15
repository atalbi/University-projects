package entity;

import java.io.Serializable;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.OneToMany;

@Entity
public class Societe implements Serializable {
	@Id
	private int idsociete;

	@Column(name="raison_social")
	private String raisonSocial;

	private String tel;

	private String adresse;

	@Lob
	private String description;

	private int valide;

	private String login;

	private String password;

	@OneToMany(mappedBy="idsociete")
	private Set<Offre> offreCollection;

	private static final long serialVersionUID = 1L;

	public Societe() {
		super();
	}

	public int getIdsociete() {
		return this.idsociete;
	}

	public void setIdsociete(int idsociete) {
		this.idsociete = idsociete;
	}

	public String getRaisonSocial() {
		return this.raisonSocial;
	}

	public void setRaisonSocial(String raisonSocial) {
		this.raisonSocial = raisonSocial;
	}

	public String getTel() {
		return this.tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getAdresse() {
		return this.adresse;
	}

	public void setAdresse(String adresse) {
		this.adresse = adresse;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getValide() {
		return this.valide;
	}

	public void setValide(int valide) {
		this.valide = valide;
	}

	public String getLogin() {
		return this.login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Set<Offre> getOffreCollection() {
		return this.offreCollection;
	}

	public void setOffreCollection(Set<Offre> offreCollection) {
		this.offreCollection = offreCollection;
	}

}
