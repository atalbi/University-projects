package admin.session;

import java.util.ArrayList;
import java.util.Collection;

import javax.ejb.Stateless;
import javax.jws.WebService;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.jboss.ejb3.annotation.RemoteBinding;

import entity.Formation;

@Stateless
@RemoteBinding(jndiBinding = "FormationManager")
public class FormationManagerBean implements FormationManager {

	@PersistenceContext
	private EntityManager em;

	//retourne 1 si ok et 0 sinon
	@Override
	public int creerFormation(String libelleFormation) {
		Formation f = new Formation();
		f.setLibelleFormation(libelleFormation);
		
		if (verifNewFormation(f) == true) {
			em.persist(f);
			em.flush();
			return 1;
		}
		else
			return 0;

	}

	//retourne false si doublon et true sinon
	@Override
	public boolean verifNewFormation(Formation f) {
		Long result;
		result = (Long) (em.createQuery("select count(form) FROM Formation as form WHERE form.libelleFormation = '"+f.getLibelleFormation()+"'")).getSingleResult();
		if (result > 0) {
			return false;
		}
		return true;
	}

	//retourne false si doublon et true sinon
	@Override
	public boolean verifModifFormation(Formation f) {
		Long result;
		result = (Long) (em.createQuery("select count(form) FROM Formation as form WHERE form.libelleFormation = '"+f.getLibelleFormation()+"' AND " +
				"form.idformation <> "+f.getIdformation())).getSingleResult();
		if (result > 0) {
			return false;
		}
		return true;
	}

	
	@Override
	public Formation rechercherFormation(int clef) {
		Formation f = em.find(Formation.class, clef);
		return f;
	}



	//retourne 1 si ok et 0 sinon
	@Override
	public int editFormation(Formation f) {
		if (verifModifFormation(f) == true) {
			em.merge(f);
			em.flush();
			return 1;
		}
		else
			return 0;
		

	}

	@Override
	public void supprimerFormation(int clef) {
		Formation f = em.find(Formation.class, clef);
		em.remove(f);
	}


	public ArrayList<Formation> listefFormation() {
		Query q = em.createQuery("FROM Formation ORDER BY libelleFormation" );
		return (ArrayList<Formation>)q.getResultList();

	}
}
