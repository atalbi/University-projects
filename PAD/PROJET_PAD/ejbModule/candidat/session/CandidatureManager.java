package candidat.session;
import java.util.ArrayList;

import javax.ejb.Remote;

import entity.Candidature;
@Remote
public interface CandidatureManager {

	public void postuler(Candidature cc);
	public void supprimer_Candidature(int i);
	public ArrayList<Candidature> listeCandidaturesParCandidat(int idCandidat);
	public int nbCandidaturesParCandidat(int idCandidat);
	public ArrayList<Candidature> listeCandidaturesParOffre(int idOffre);
	public boolean verifCandidature(int idCandidat, int idOffre);
	public int nbCandidatures();
	public ArrayList<Candidature> listeCandidatures(String critereTri, String ordre);
	public Candidature rechercher(int idCandidature);
	public void editCandidature(Candidature cc);
}
