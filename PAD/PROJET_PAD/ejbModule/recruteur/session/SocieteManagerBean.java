package recruteur.session;
import java.util.ArrayList;

import javax.ejb.Stateless;
import javax.jws.WebService;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.jboss.ejb3.annotation.RemoteBinding;

import entity.Candidat;
import entity.Formation;
import entity.Societe;

@Stateless
@RemoteBinding(jndiBinding="SocieteManager")
public class SocieteManagerBean implements SocieteManager {
	@PersistenceContext
	private EntityManager em;

	//retourne 1 si ok
	//		   2 si doublon login
	//		   3 si doublon raison Sociale
	public int creerSociete(Societe s){
		if (verif_DoublonNomSociete(s.getRaisonSocial()) == true) {
			if (verif_DoublonLogin(s.getLogin()) == true) {
				em.persist(s);
				em.flush();
				cryptPassword(s);
				return 1;
			}
			else
				return 2;
		}
		else
			return 3;

	}

	public Societe rechercherSociete(int idSociete){
		return em.find(Societe.class, idSociete);
	}

	public void supprimerSociete(int idSociete){
		Query q = em.createQuery("UPDATE Societe SET valide = 0 WHERE idsociete= " +idSociete);
		q.executeUpdate();

	}

	//retourne 1 si ok
	//		   0 sinon
	public int editSociete(Societe soc, String pass){
		if (verifModifSociete(soc) == true) {

			em.merge(soc);
			em.flush();
			if (pass != null) {
				soc.setPassword(pass);
				cryptPassword(soc);
			}
			return 1;
		}
		else {
			return 0;
		}
	}


	public boolean verif_DoublonLogin(String login){

		try {
			Query q = em.createQuery("select count(s) from Societe AS s WHERE s.login = '"+login+"'");
			int nb = ((Long)q.getSingleResult()).intValue();
			return (nb == 0)? true : false; //retourne true si pas de doublon et false si oui
		}
		catch (NoResultException e) {
			return true;
		}
	}

	public boolean verif_DoublonNomSociete(String nom){

		try {
			Query q = em.createQuery("select count(s) from Societe AS s WHERE s.raisonSocial = '"+nom+"'");
			int nb = ((Long)q.getSingleResult()).intValue();
			return (nb == 0)? true : false; //retourne true si pas de doublon et false si oui
		}
		catch (NoResultException e) {
			return true;
		}
	}

	public void cryptPassword(Societe s) {
		String str = "update Societe set password = md5('"+s.getPassword()+
		"') where raisonSocial = '"+s.getRaisonSocial()+"' and login = '"+s.getLogin()+"'";
		Query q = em.createQuery(str);
		q.executeUpdate();

	}

	//retourne false si doublon et true sinon
	@Override
	public boolean verifModifSociete(Societe soc) {
		Long result;
		result = (Long) (em.createQuery("select count(s) FROM Societe as s WHERE (s.raisonSocial = '"+soc.getRaisonSocial()+"' OR " +
				"s.login = '"+soc.getLogin()+"') AND s.idsociete <> "+soc.getIdsociete())).getSingleResult();
		if (result > 0) {
			return false;
		}
		return true;
	}


	public ArrayList<Societe> listeSociete(){
		return (ArrayList<Societe>)(em.createQuery("select soc from Societe AS soc")).getResultList();
	}

	
	public ArrayList<Societe> listeSociete(String critereTri, String ordre){
		String str = "select soc from Societe AS soc ";
		if (critereTri != null) {
			if (critereTri .equals("rs"))
				str+= " ORDER BY soc.raisonSocial "+ordre;
			
		}
		return (ArrayList<Societe>)(em.createQuery(str)).getResultList();
	}
	
	//validation fiche societe par l'administrateur du site
	public void validerSuppressionSociete(int idSociete){
		Societe soc = em.find(Societe.class, idSociete);
		em.remove(soc);
	}

	@Override
	public Societe identification(String login, String password) {
		Societe s = null;
		try {
			s = (Societe)em.createQuery("select s from Societe AS s WHERE " +
					"s.valide=1 AND s.login = '"+login+"' and s.password = md5('"+password+"')").getSingleResult();
		}
		catch (NoResultException e) {
			return null;
		}
		return s;
	}

	@Override
	public int nbSociete() {
		return ((Long)em.createQuery("select count (s) from Societe as s").getSingleResult()).intValue();
	}

	@Override
	public int nbSocieteAsupprimer() {
		return ((Long)em.createQuery("select count (s) from Societe as s where s.valide = 0").getSingleResult()).intValue();
	}

	@Override
	public void suppression_definitive(int idSociete) {
		Query q = em.createQuery("DELETE FROM Societe WHERE idsociete = " +idSociete);
		q.executeUpdate();

	}
}
