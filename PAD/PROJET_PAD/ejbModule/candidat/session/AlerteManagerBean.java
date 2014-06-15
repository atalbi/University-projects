package candidat.session;

import java.util.ArrayList;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.jboss.ejb3.annotation.RemoteBinding;

import entity.Alerte;
import entity.Candidat;
import entity.Formation;
import entity.Offre;

@Stateless
@RemoteBinding(jndiBinding="AlerteManager")
public class AlerteManagerBean implements  AlerteManager{

	@PersistenceContext
	private EntityManager em;

	//retourne 1 si ok et 0 sinon
	@Override
	public int creerAlerte(String motcle, Candidat idcandidat) {
		
		Alerte s=new Alerte();
		s.setMotcle(motcle);
		s.setIdcandidat(idcandidat);
		
		if (verifNewAlerte(s) == true) {
			em.persist(s);
			em.flush();
			return 1;
		}
		else
			return 0;

	}

	//retourne false si doublon et true sinon
	@Override
	public boolean verifNewAlerte(Alerte a) {
		Long result;
		result = (Long) (em.createQuery("select count(alert) FROM Alerte as alert WHERE alert.motcle = '"+a.getMotcle()+"' AND " +
				"alert.idcandidat.idcandidat = "+a.getIdcandidat().getIdcandidat())).getSingleResult();
		if (result > 0) {
			return false;
		}
		return true;
	}

	//retourne false si doublon et true sinon
	@Override
	public boolean verifModifAlerte(Alerte a) {
		Long result;
		result = (Long) (em.createQuery("select count(alert) FROM Alerte as alert WHERE alert.motcle = '"+a.getMotcle()+"' AND " +
				"alert.idcandidat.idcandidat = "+a.getIdcandidat().getIdcandidat()+" AND alert.idalerte <> "+a.getIdalerte())).getSingleResult();
		if (result > 0) {
			return false;
		}
		return true;
	}
	
	@Override
	public Alerte rechercherAlerte(int id) {
		Alerte a = null;
		a = (Alerte)em.find(Alerte.class, id);
		return a;
	}

	@Override
	public void supprimerAlerte(Alerte alerte) {
		
		Query q = em.createQuery("DELETE FROM Alerte WHERE idcandidat = " +alerte.getIdcandidat().getIdcandidat()+" and idalerte="+alerte.getIdalerte());
		q.executeUpdate();
	}

	@Override
	public ArrayList<Alerte> listeAlertes(String critereTri, String ordre) {
		String str = "FROM Alerte";
		if (critereTri != null && (critereTri.equals("motcle") || critereTri.equals("idcandidat")))
			str+=" ORDER BY "+critereTri+" "+ordre;
		
		Query q = em.createQuery(str);
		return (ArrayList<Alerte>)q.getResultList();
	}


	@Override
	public ArrayList<Alerte> listeAlertesParCandidat(int idCandidat) {
		return (ArrayList<Alerte>)(em.createQuery("FROM Alerte WHERE idcandidat.idcandidat="+idCandidat)).getResultList();
	}

	@Override
	public ArrayList<Offre> listeOffresParAlerte(int idAlerte) {
		Query q = em.createQuery("select offre FROM Offre AS offre, Alerte AS alerte, Formation AS formation " +
				"WHERE alerte.idalerte="+idAlerte+" and offre.valide = 1 and " +
				"(offre.titreOffre LIKE %alerte.motcle% OR " +
				"(offre.idformation.idformation = formation.idformation and formation.libelleFormation LIKE %alerte.motcle%) OR " +
		"offre.offDescription LIKE %alerte.motcle%)");
		return (ArrayList<Offre>)q.getResultList();
	}

	@Override
	public int nbAlertesParCandidat(int idCandidat) {

		Long res = (Long)em.createQuery("select count(*) FROM Alerte WHERE idcandidat.idcandidat="+idCandidat).getSingleResult();
		return res.intValue() ;

	}

	@Override
	public int modifierAlerte(Alerte alerte) {
		if (verifModifAlerte(alerte) == true) {
			em.merge(alerte);
			em.flush();
			return 1;
		}
		else
			return 0;

	}

	@Override
	public int nbAlerte() {
		return ((Long)em.createQuery("select count (a) from Alerte as a").getSingleResult()).intValue();
	}


}
