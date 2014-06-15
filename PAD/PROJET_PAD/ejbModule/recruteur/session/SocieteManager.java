package recruteur.session;

import java.util.ArrayList;

import javax.ejb.Remote;
import javax.jws.WebService;
import javax.jws.soap.SOAPBinding;
import javax.jws.soap.SOAPBinding.Style;
import javax.jws.soap.SOAPBinding.Use;

import entity.Societe;

@Remote
public interface SocieteManager {
	
	public int creerSociete(Societe s);
	public Societe rechercherSociete(int idSociete);
	public void supprimerSociete(int idSociete); //suppression logique effectuee par le candidat
	public int editSociete(Societe soc, String pass);
	public boolean verifModifSociete(Societe s);
	public ArrayList<Societe> listeSociete();
	public ArrayList<Societe> listeSociete(String critereTri, String ordre);
	public void validerSuppressionSociete(int idSociete); //suppression physique et definitive effectuee par l'admin
	public Societe identification(String login, String password);
	public int nbSociete();
	public int nbSocieteAsupprimer();
	void suppression_definitive(int idSociete);
	public boolean verif_DoublonNomSociete(String nom);
	public boolean verif_DoublonLogin(String login);
}
