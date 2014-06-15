package admin.session;

import java.util.ArrayList;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.jboss.ejb3.annotation.RemoteBinding;

import entity.Admin;
import entity.Alerte;
import entity.Candidat;

/**
 * Session Bean implementation class AdminManagerBean
 */
@Stateless
@RemoteBinding(jndiBinding="AdminManager")
public class AdminManagerBean implements AdminManager {

	@PersistenceContext
	private EntityManager em;

	//retourne 1 si ok
	//		   0 si tous le login et le password ne sont pas renseignés dans le fromulaire
	//		   2 si le login indiqué existe deja
	@Override
	public int creerAdmin(Admin a) {
		if (!a.getLogin().equals("") && !a.getPassword().equals("")) {
			if (verif_NewAdmin(a) == true) {
				em.persist(a);
				em.flush();
				cryptPassword(a);
				return 1;
			}
			else {
				return 2;
			}
		}
		else {
			return 0;
		}
	}

	//retourne 1 si ok
	//		   2 si login deja existent
	@Override
	public int editAdmin(Admin ad, String pass) {
		String old_login = ((Admin)em.find(Admin.class, ad.getIdadmin())).getLogin();
		if (!old_login.equalsIgnoreCase(ad.getLogin())) {
			if (verif_ModifAdmin(ad) == false) {
				return 2;
			}
		}
		em.merge(ad);
		em.flush();
		
		if (pass != null) {
			ad.setPassword(pass);
			cryptPassword(ad);
		}
		return 1;
		
	}

	@Override
	public Admin identification(String login, String password) {
		Admin a = null;
		try {
			a = (Admin)em.createQuery("select a from Admin AS a WHERE " +
					" a.login = '"+login+"' and a.password = md5('"+password+"')").getSingleResult();
		}
		catch (NoResultException e) {
			return null;
		}
		return a;
	}

	//retourne 1 si suppression ok
	//		   0 si suppression nOk
	//		   2 si suppression impossible car il s'agit du superAdmin qui ne peut etre supprimé
	@Override
	public int supprimerAdmin(int idAdmin) {
		
		Admin ad = em.find(Admin.class, idAdmin);
		if (ad.getSuperAdmin() == 0) {
			em.remove(ad);
			if (em.find(Admin.class, idAdmin) == null) 
				return 1;
			else
				return 0;
		}
		else 
			return 2;
		
		
	}

	//retourne true si verif ok et false sinon
	@Override
	public boolean verif_NewAdmin(Admin a) {

		try {
			int nb = ((Long)em.createQuery("select count(a) from Admin AS a WHERE a.login = '"+a.getLogin()+"'").getSingleResult()).intValue();
			if (nb >= 1) {
				return false;
			}
			return true;
		}
		catch (NoResultException e) {
			return true;
		}
	}
	
	//retourne true si verif ok et false sinon
	@Override
	public boolean verif_ModifAdmin(Admin a) {

		try {
			int nb = ((Long)em.createQuery("select count(a) from Admin AS a WHERE a.login = '"+a.getLogin()+"'").getSingleResult()).intValue();
			if (nb >= 1) {
				return false;
			}
			return true;
		}
		catch (NoResultException e) {
			return true;
		}
	}
	
	
	@Override
	public void cryptPassword(Admin a) {
		String str = "update Admin set password = md5('"+a.getPassword()+"') where login = '"+a.getLogin()+"'";
		Query q = em.createQuery(str);
		q.executeUpdate();
	}

	@Override
	public ArrayList<Admin> liste_profils_Admin() {
		return (ArrayList<Admin>)(em.createQuery("FROM Admin")).getResultList();
	}

	@Override
	public Admin rechercherAdmin(int idAdmin) {
		Admin a =null;
		return (Admin)(em.find(Admin.class, idAdmin));
	}
}
