package recruteur.session;
import java.util.ArrayList;

import javax.ejb.Remote;

import entity.Offre;

@Remote
public interface OffreManager {
public void ajouter_offre(Offre offre);
public ArrayList <Offre> recherche_List_Offre(String titreOffre, int idSociete, int idFormation, String dateDebut, String dateFin);
public ArrayList <Offre> recherche_List_Offre_valide_or_not(String titreOffre, int idSociete, int idFormation, String dateDebut, String dateFin);
public int recherche_List_Offre_nb(String titreOffre, int idSociete, int idFormation, String dateDebut, String dateFin);
public ArrayList <Offre> listeOffre_ParAlerte(String motCle);
public int listeOffre_ParAlerte_nb(String motCle);
public void supprimer_Offre(int id_offre); //suppression logique effectuee par le recruteur
public void validerSuppressionOffre(int idOffre); //suppression physique et definitive effectuee par l'admin
public Offre rechercher(int idOffre);
public ArrayList<Offre> listeOffreAsupprimer();
public int nbOffres();
public int nbOffresAsupprimer();
public ArrayList<Offre> listeOffres(String critereTri, String ordre);
public void editOffre(Offre offre);
public void suppression_definitive(int idOffre);

}
