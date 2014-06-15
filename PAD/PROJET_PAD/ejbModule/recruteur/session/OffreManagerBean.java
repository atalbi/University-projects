package recruteur.session;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.jboss.ejb3.annotation.RemoteBinding;

import entity.Formation;
import entity.Offre;

/**
 * Session Bean implementation class Offre
 */
@Stateless
@RemoteBinding(jndiBinding="OffreManager")
public class OffreManagerBean implements OffreManager {
	 @PersistenceContext
	 private EntityManager em; 

    /**
     * Default constructor. 
     */
    public OffreManagerBean() {}
  
    @Override
	public void ajouter_offre(Offre offre) {
		em.persist(offre);
		em.flush();
	}
    
  
    
	@Override
	public ArrayList <Offre> recherche_List_Offre(String titreOffre, int idSociete, int idFormation, String dateDebut, String dateFin) {
		Date dateD = null, dateF = null;
		dateD = stringToDate(dateDebut);
		dateF = stringToDate(dateFin);
		
		String req = "Select offre From Offre as offre Where offre.valide=1";
		
		if (!titreOffre.equals(""))
			req+=" AND offre.titreOffre='"+titreOffre+"' ";
		
		if (idSociete != -1)
			req+= " AND offre.idsociete.idsociete="+idSociete;
		
		if (idFormation != -1)
			req+= " AND offre.idformation.idformation="+idFormation;
			
		if(dateD != null && dateF != null){
	        req += " AND offre.dateOffre between  '"+dateD+"' and '"+dateF+"'  ";
	    }
		else if(dateD != null && dateF == null){
	        req += " AND offre.dateOffre between  '"+dateD+"' and SYSDATE()  ";
	    }
		else if(dateD == null && dateF != null){
	        req += " AND dateOffre <  '"+dateF+"'   ";
	    }
		
		req+= " ORDER BY dateOffre DESC";
		ArrayList <Offre> res = (ArrayList <Offre>)em.createQuery(req).getResultList();
		return res;
		
	}

	public int recherche_List_Offre_nb(String titreOffre, int idSociete, int idFormation, String dateDebut, String dateFin) {
		String req = "Select count(*) From Offre Where valide=1 ";
		Date dateD = null, dateF = null;
		dateD = stringToDate(dateDebut);
		dateF = stringToDate(dateFin);
		
		
		if (!titreOffre.equals(""))
			req+=" AND titreOffre='"+titreOffre+"' ";
		
		if (idSociete != -1)
			req+= " AND idsociete.idsociete="+idSociete;
		
		if (idFormation != -1)
			req+= " AND idformation.idformation="+idFormation;
			
		if(dateD != null && dateF != null){
	        req += " AND offre.dateOffre between  '"+dateD+"' and '"+dateF+"'  ";
	    }
		else if(dateD != null && dateF == null){
	        req += " AND offre.dateOffre between  '"+dateD+"' and SYSDATE()  ";
	    }
		else if(dateD == null && dateF != null){
	        req += " AND dateOffre <  '"+dateF+"'   ";
	    }
		Long res = (Long)em.createQuery(req).getSingleResult();
		return res.intValue() ;
		
	}
	
	@Override
	public ArrayList <Offre> recherche_List_Offre_valide_or_not(String titreOffre, int idSociete, int idFormation, String dateDebut, String dateFin) {
		String req = "Select offre From Offre as offre Where (offre.valide=1 OR offre.valide=0) ";
		Date dateD = null, dateF = null;
		dateD = stringToDate(dateDebut);
		dateF = stringToDate(dateFin);
		
		if (!titreOffre.equals(""))
			req+=" AND offre.titreOffre='"+titreOffre+"' ";
		
		if (idSociete != -1)
			req+= " AND offre.idsociete.idsociete="+idSociete;
		
		if (idFormation != -1)
			req+= " AND offre.idformation.idformation="+idFormation;
			
		if(dateD != null && dateF != null){
	        req += " AND offre.dateOffre between  '"+dateD+"' and '"+dateF+"'  ";
	    }
		else if(dateD != null && dateF == null){
	        req += " AND offre.dateOffre between  '"+dateD+"' and SYSDATE()  ";
	    }
		else if(dateD == null && dateF != null){
	        req += " AND dateOffre <  '"+dateF+"'   ";
	    }
		
		req+= " ORDER BY dateOffre DESC";
		ArrayList <Offre> res = (ArrayList <Offre>)em.createQuery(req).getResultList();
		
		return res;
		
	}
	
	
	@Override
	public void supprimer_Offre(int id_offre) {
		Query q = em.createQuery("UPDATE Offre SET valide = 0 WHERE idoffre= " +id_offre);
		q.executeUpdate();
			
	}

	@Override
	public void validerSuppressionOffre(int idOffre) {
		Offre of = em.find(Offre.class, idOffre);
		em.remove(of);
		
	}
	
	
	

	public ArrayList<Offre> listeOffreAsupprimer() {
		return (ArrayList<Offre>)(em.createQuery("Select offre From Offre as offre Where offre.valide=0 "));
	}

	@Override
	public Offre rechercher(int idOffre) {
		Offre o = null;
		o = em.find(Offre.class, idOffre);
		return o;
	}

	@Override
	public ArrayList<Offre> listeOffre_ParAlerte(String motCle) {
		String req = "Select offre From Offre as offre Where offre.valide=1 and (" +
				"offre.titreOffre LIKE '%"+motCle+"%' OR " +
				"offre.offDescription LIKE '%"+motCle+"%' OR " +
				"offre.idsociete.raisonSocial LIKE '%"+motCle+"%' OR " +
				"offre.idformation.libelleFormation LIKE '%"+motCle+"%')" +
				" ORDER BY dateOffre DESC";

		ArrayList <Offre> res = (ArrayList <Offre>)em.createQuery(req).getResultList();
		return res;
	}

	@Override
	public int listeOffre_ParAlerte_nb(String motCle) {
		String req = "Select count(offre) From Offre as offre Where offre.valide=1 and (" +
		"offre.titreOffre LIKE '%"+motCle+"%' OR " +
		"offre.offDescription LIKE '%"+motCle+"%' OR " +
		"offre.idsociete.raisonSocial LIKE '%"+motCle+"%' OR " +
		"offre.idformation.libelleFormation LIKE '%"+motCle+"%')";

		Long res = (Long)em.createQuery(req).getSingleResult();
		return res.intValue() ;
	}

	@Override
	public int nbOffres() {
		return ((Long)em.createQuery("select count (o) from Offre as o").getSingleResult()).intValue();
	}
	
	@Override
	public int nbOffresAsupprimer() {
		return ((Long)em.createQuery("select count (o) from Offre as o where o.valide = 0").getSingleResult()).intValue();
	}

	@Override
	public ArrayList<Offre> listeOffres(String critereTri, String ordre) {
		String str = "From Offre";
		if (critereTri != null) {
			if (critereTri .equals("tt"))
				str+= " ORDER BY titreOffre "+ordre;
			else if (critereTri .equals("st"))
				str+= " ORDER BY idsociete.raisonSocial "+ordre;
			else if (critereTri .equals("dt"))
				str+= " ORDER BY dateOffre "+ordre;
		}
		return ((ArrayList<Offre>)em.createQuery(str).getResultList());
	}

	@Override
	public void editOffre(Offre offre) {
		em.merge(offre);
		em.flush();
	}

	@Override
	public void suppression_definitive(int idOffre) {
		Query q = em.createQuery("DELETE FROM Offre WHERE idoffre = " +idOffre);
		q.executeUpdate();
		
	}
		
	private Date stringToDate(String str) {
		str = str.trim();
		if (str.length() == 10) {
			String[] strTab = str.split("/");

			if (strTab.length == 3) {
				int dd = Integer.parseInt(strTab[0]);
				int mm = Integer.parseInt(strTab[1])-1;
				int yyyy = Integer.parseInt(strTab[2])-1900;
				return new Date(yyyy, mm, dd);
			}
		}
		return null;
	}

	public static String dateToString(Date d) {
		Calendar c = Calendar.getInstance();
		c.setTime(d);
		String str;
		String tmp = "";
		tmp = ""+c.get(Calendar.DATE);
		str = (tmp.length()==2)? tmp : "0"+tmp;

		tmp = ""+(c.get(Calendar.MONTH)+1);
		str += (tmp.length()==2)? "/"+tmp : "/0"+tmp;

		tmp = ""+c.get(Calendar.YEAR);
		str += "/"+tmp;

		return str;
	}


}
