package entity;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Admin implements Serializable {
	@Id
	private int idadmin;

	private String login;

	private String password;

	@Column(name="super_admin")
	private int superAdmin;

	private static final long serialVersionUID = 1L;

	public Admin() {
		super();
	}

	public int getIdadmin() {
		return this.idadmin;
	}

	public void setIdadmin(int idadmin) {
		this.idadmin = idadmin;
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

	public int getSuperAdmin() {
		return this.superAdmin;
	}

	public void setSuperAdmin(int superAdmin) {
		this.superAdmin = superAdmin;
	}

}
