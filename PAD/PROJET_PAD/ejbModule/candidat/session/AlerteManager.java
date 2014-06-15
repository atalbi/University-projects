package candidat.session;

import java.util.ArrayList;

import javax.ejb.Remote;

import entity.Alerte;
import entity.Candidat;
import entity.Offre;

@Remote
public interface AlerteManager {
	public int creerAlerte(String motcle,Candidat idcandidat);
	public Alerte rechercherAlerte(int idAlerte);
	public int modifierAlerte(Alerte alerte);
	public void supprimerAlerte(Alerte alerte);
	public ArrayList<Alerte> listeAlertesParCandidat(int idCandidat);
	public int nbAlertesParCandidat(int idCandidat);
	public ArrayList<Alerte> listeAlertes(String critereTri, String ordre);
	public ArrayList<Offre> listeOffresParAlerte(int idAlerte);
	public boolean verifModifAlerte(Alerte a);
	public boolean verifNewAlerte(Alerte a);
	public int nbAlerte();
	
}
