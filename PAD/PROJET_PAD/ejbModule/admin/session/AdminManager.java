package admin.session;
import java.util.ArrayList;

import javax.ejb.Remote;

import entity.Admin;

@Remote
public interface AdminManager {
	
	public Admin identification(String login, String password);
	public int creerAdmin(Admin ad);
	public int editAdmin(Admin ad, String pass);
	public int supprimerAdmin(int idAdmin);
	public boolean verif_NewAdmin(Admin a);
	void cryptPassword(Admin a);
	boolean verif_ModifAdmin(Admin a);
	public ArrayList<Admin>liste_profils_Admin();
	public Admin rechercherAdmin(int idAdmin);

}
