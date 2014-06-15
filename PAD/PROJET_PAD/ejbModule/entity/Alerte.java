package entity;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Alerte implements Serializable {
	@Id
	private int idalerte;

	private String motcle;

	@ManyToOne
	@JoinColumn(name="idCandidat")
	private Candidat idcandidat;

	private static final long serialVersionUID = 1L;

	public Alerte() {
		super();
	}

	public int getIdalerte() {
		return this.idalerte;
	}

	public void setIdalerte(int idalerte) {
		this.idalerte = idalerte;
	}

	public String getMotcle() {
		return this.motcle;
	}

	public void setMotcle(String motcle) {
		this.motcle = motcle;
	}

	public Candidat getIdcandidat() {
		return this.idcandidat;
	}

	public void setIdcandidat(Candidat idcandidat) {
		this.idcandidat = idcandidat;
	}

}
