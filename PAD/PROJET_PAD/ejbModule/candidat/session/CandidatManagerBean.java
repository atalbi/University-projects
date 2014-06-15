package candidat.session;

import java.util.ArrayList;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.jboss.ejb3.annotation.RemoteBinding;

import entity.Candidat;
import entity.Societe;

@Stateless
@RemoteBinding(jndiBinding="CandidatManager")
public class CandidatManagerBean implements CandidatManager {

	@PersistenceContext
	private EntityManager em;

	//retourne 	1 si ok
	//			2 si email deja existent
	//			0 si candidat deja existent
	public int creerCandidat(Candidat c) {
		if (verif_NouveauCandidat(c) == true) {
			if (verif_DoublonEmail(c.getEmail()) == true) {//retourne true si pas de doublon et false si oui
				c.setValide(1);
				em.persist(c);
				em.flush();
				cryptPassword(c);
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

	public void cryptPassword(Candidat c) {
		String str = "update Candidat set password = md5('"+c.getPassword()+
		"') where nom = '"+c.getNom()+"' and prenom = '"+c.getPrenom()+"' and email = '"+c.getEmail()+"'";
		Query q = em.createQuery(str);
		q.executeUpdate();

	}

	@Override
	public Candidat rechercherCandidat(int clef) {
		Candidat c=em.find(Candidat.class, clef);
		return c;
	}

	//retourne 	1 si ok
	//			2 si email deja existent
	public int editCandidat(Candidat c, String pass){

		Candidat old_cand = rechercherCandidat(c.getIdcandidat());
			if (!old_cand.getEmail().equalsIgnoreCase(c.getEmail())) { //cas où le candidat a changé son mail, on verifie si le nouveau est unique
				if (verif_DoublonEmail(c.getEmail()) == false) { //retourne true si pas de doublon et false si oui
					return 2;
				}
				
			}
			em.merge(c);
			em.flush();
			if (pass != null) {
				c.setPassword(pass);
				cryptPassword(c);
			}
			return 1;
	}


	@Override
	public void supprimerCandidat(int clef) {
		Query q = em.createQuery("UPDATE Candidat SET valide = 0 WHERE idcandidat= " +clef);
		q.executeUpdate();

	}

	public ArrayList<Candidat> listeCandidat(){
		Query q = em.createQuery("select c from Candidat AS c");
		return (ArrayList<Candidat>) q.getResultList();
	}

	
	public Candidat identification(String login, String password){
		Candidat c = null;
		try {
			c = (Candidat)em.createQuery("select c from Candidat AS c WHERE " +
					"c.valide=1 AND c.email = '"+login+"' and c.password = md5('"+password+"')").getSingleResult();

		}
		catch (NoResultException e) {
			return null;
		}
		return c;
	}

	//retourne true si verif ok et false sinon
	@Override
	public boolean verif_NouveauCandidat(Candidat c) {

		if (!c.getNom().equals("") && !c.getPrenom().equals("") && !c.getEmail().equals("") && !c.getPassword().equals("") && c.getIdformation()!=null) {

			try {
				int nb = ((Long)em.createQuery("select count(c) from Candidat AS c WHERE " +
						"c.prenom = '"+c.getPrenom()+"' and c.email = '"+c.getEmail()+"' and c.nom = '"+c.getNom()+"'").getSingleResult()).intValue();
				if (nb >= 1) {
					return false;
				}
				return true;
			}
			catch (NoResultException e) {
				return true;
			}
		}
		else {
			return false;
		}

	}


	public boolean verif_DoublonEmail(String mail){

		try {
			Query q = em.createQuery("select count(c) from Candidat AS c WHERE c.email = '"+mail+"'");
			int nb = ((Long)q.getSingleResult()).intValue();
			return (nb == 0)? true : false; //retourne true si pas de doublon et false si oui
		}
		catch (NoResultException e) {
			return true;
		}
	}

	@Override
	public int nbCandidat() {
		return ((Long)em.createQuery("select count (c) from Candidat as c").getSingleResult()).intValue();
	}
	
	@Override
	public int nbCandidatAsupprimer() {
		return ((Long)em.createQuery("select count (c) from Candidat as c where c.valide = 0").getSingleResult()).intValue();
	}

	@Override
	public ArrayList<Candidat> listeCandidat(String critereTri, String ordre) {
		String str = "select cand from Candidat AS cand ";
		if (critereTri != null) {
			if (critereTri .equals("np"))
				str+= " ORDER BY cand.nom "+ordre;
			else if (critereTri .equals("ft"))
				str+= " ORDER BY cand.idformation.libelleFormation "+ordre;
			
			
		}
		return (ArrayList<Candidat>)(em.createQuery(str)).getResultList();
	}

	@Override
	public void suppression_definitive(int idcandidat) {
		Query q = em.createQuery("DELETE FROM Candidat WHERE idcandidat = " +idcandidat);
		q.executeUpdate();
	}
	
	@Override
	public ArrayList<Candidat> recherche_List_Candidat(String nom,
			String prenom, int idFormation, String nivEtudes, String email,
			String motCles) {
		String req = "Select candidat From Candidat as candidat Where candidat.valide=1";

		if (!nom.equals(""))
			req += " AND candidat.nom LIKE '%" + nom + "%' ";

		if (!prenom.equals(""))
			req += " AND candidat.prenom LIKE '%" + prenom+"%'";

		if (idFormation != -1)
			req += " AND candidat.idformation.idformation=" + idFormation;

		if (!nivEtudes.equals(""))
			req += " AND candidat.niveauEtudes LIKE '%" + nivEtudes+"%'";

		if (!email.equals(""))
			req += " AND candidat.email='" + email+"'";

		if (!motCles.equals(""))
			req += " AND candidat.observation LIKE '%" + motCles + "%'";

		req += " ORDER BY candidat.nom, candidat.prenom DESC";
		ArrayList<Candidat> res = (ArrayList<Candidat>) em.createQuery(req)
				.getResultList();

		return res;

	}

	@Override
	public int recherche_nb_Candidat(String nom, String prenom,
			int idFormation, String nivEtudes, String email, String motCles) {
		String req = "Select count(*) From Candidat as candidat Where candidat.valide=1";

		if (!nom.equals(""))
			req += " AND candidat.nom LIKE '%" + nom + "%' ";

		if (!prenom.equals(""))
			req += " AND candidat.prenom LIKE '%" + prenom+"%'";

		if (idFormation != -1)
			req += " AND candidat.idformation.idformation=" + idFormation;

		if (!nivEtudes.equals(""))
			req += " AND candidat.niveauEtudes LIKE '%" + nivEtudes+"%'";

		if (!email.equals(""))
			req += " AND candidat.email='" + email+"'";

		if (!motCles.equals(""))
			req += " AND candidat.observation LIKE '%" + motCles + "%'";

		Long res = (Long) em.createQuery(req).getSingleResult();
		return res.intValue();
	}
}
