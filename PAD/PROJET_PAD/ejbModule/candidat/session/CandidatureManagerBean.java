package candidat.session;

import java.util.ArrayList;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.jboss.ejb3.annotation.RemoteBinding;

import entity.AfficheCandidatureParCandidat;
import entity.Candidature;


/**
 * 
 */
@Stateless
@RemoteBinding(jndiBinding="CandidatureManager")
public class CandidatureManagerBean implements CandidatureManager {

	/**
	 * Default constructor. 
	 */
	@PersistenceContext
	private EntityManager em; 
	public CandidatureManagerBean() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public void supprimer_Candidature(int idCandidature) {
		Candidature can=em.find(Candidature.class,idCandidature);
		em.remove(can);
	}

	@Override
	public void postuler(Candidature cc) {

		em.persist(cc);//Ajout de la candidature
		em.flush();

	}


	@Override
	public ArrayList<Candidature> listeCandidaturesParCandidat(int idCandidat) {

		Query q2 = em.createQuery("select candidature from Candidature AS candidature WHERE "+
				"candidature.idcandidat.idcandidat="+idCandidat+" ORDER BY candidature.date DESC");
		return (ArrayList<Candidature>) q2.getResultList();

	}


	@Override
	public ArrayList<Candidature> listeCandidaturesParOffre(int idOffre) {

		Query q2 = em.createQuery("select candidature from Candidature AS candidature WHERE candidature.idoffre.idoffre="+idOffre+" ORDER BY candidature.date DESC");
		return (ArrayList<Candidature>) q2.getResultList();

	}

	@Override
	public int nbCandidaturesParCandidat(int idCandidat) {

		Query q2 = em.createQuery("select count(*) from Candidature AS candidature WHERE "+
				"candidature.idcandidat.idcandidat="+idCandidat);
		Long res = (Long)q2.getSingleResult();
		return res.intValue();
	}

	@Override
	public boolean verifCandidature(int idCandidat, int idOffre) {
		Query q = em.createQuery("select count(candidature) from Candidature AS candidature WHERE " +
				"candidature.idoffre.idoffre="+idOffre+" and " +
				"candidature.idcandidat.idcandidat="+idCandidat);
		boolean res = ((Long)q.getSingleResult()==0)? true : false;
		return res;
	}

	@Override
	public int nbCandidatures() {
		return ((Long)em.createQuery("select count (c) from Candidature as c").getSingleResult()).intValue();
	}

	@Override
	public ArrayList<Candidature> listeCandidatures(String critereTri, String ordre) {
		String str = "select cand From Candidature as cand ";
		if (critereTri.equals("tO")) 
			str+= " ORDER BY cand.idoffre.titreOffre "+ordre;
		else if (critereTri.equals("cC"))
			str+= " ORDER BY cand.idcandidat.nom, cand.idcandidat.prenom "+ordre;
		else if (critereTri.equals("dtC"))
			str+= " ORDER BY cand.date "+ordre;
		else if (critereTri.equals("dcC"))
			str+= " ORDER BY cand.decision "+ordre;
		
		return (ArrayList<Candidature>)em.createQuery(str).getResultList();
	}

	@Override
	public Candidature rechercher(int idCandidature) {
		return (Candidature)em.find(Candidature.class, idCandidature);
	}

	@Override
	public void editCandidature(Candidature cc) {
		em.merge(cc);
		em.flush();		
	}
}
