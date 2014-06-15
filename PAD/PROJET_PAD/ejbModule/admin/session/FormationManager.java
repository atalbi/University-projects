package admin.session;

import java.util.ArrayList;

import javax.ejb.Remote;
import javax.jws.WebService;
import javax.jws.soap.SOAPBinding;
import javax.jws.soap.SOAPBinding.Style;

import entity.Formation;

@Remote
@SOAPBinding(style = Style.DOCUMENT, use = SOAPBinding.Use.LITERAL, parameterStyle = SOAPBinding.ParameterStyle.WRAPPED)

public interface FormationManager {
	public int creerFormation(String libelleFormation);
	public int editFormation(Formation f);
	public void supprimerFormation(int clef);
	public ArrayList<Formation> listefFormation() ;
	public Formation rechercherFormation(int clef);
	public boolean verifNewFormation(Formation f);
	public boolean verifModifFormation(Formation f);
}
