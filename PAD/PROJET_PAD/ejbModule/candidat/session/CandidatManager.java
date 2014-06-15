package candidat.session;

import java.util.ArrayList;

import javax.ejb.Remote;

import entity.Candidat;

@Remote
public interface CandidatManager {
	
	public int creerCandidat(Candidat c);
	public Candidat rechercherCandidat(int clef);
	public void supprimerCandidat(int clef); //suppression logique effectuee par le candidat
	public int editCandidat(Candidat c, String pass);
	public ArrayList<Candidat> listeCandidat();
	public ArrayList<Candidat> listeCandidat(String critereTri, String ordre);
	public void cryptPassword(Candidat c);
	public Candidat identification(String login, String password);
	public boolean verif_NouveauCandidat(Candidat c);
	public boolean verif_DoublonEmail(String mail);
	public int nbCandidat();
	public int nbCandidatAsupprimer();
	public void suppression_definitive(int idcandidat);
	public ArrayList<Candidat> recherche_List_Candidat(String Nom, String Prenom,
			int idFormation, String NivEtudes, String Email, String motCles);
	public int recherche_nb_Candidat(String Nom, String Prenom,
			int idFormation, String NivEtudes, String Email, String motCles);
}
