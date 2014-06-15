package servlet;

import java.io.IOException;
import java.sql.Date;
import java.util.Calendar;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.quartz.SimpleTrigger;

import recruteur.session.OffreManager;
import recruteur.session.SocieteManager;
import admin.session.FormationManager;

import entity.Admin;
import entity.Offre;

/**
 * Servlet implementation class sEditOffre
 */
public class sEditOffre extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@EJB(mappedName = "OffreManager") 
	OffreManager offreManag;   

	@EJB(mappedName = "FormationManager") 
	FormationManager formManag; 

	@EJB(mappedName = "SocieteManager") 
	SocieteManager societeManag; 


	public sEditOffre() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {

		HttpSession session=request.getSession();
		Offre offre = null;
		offre = (Offre) session.getAttribute("offre");

		if (request.getParameter("srcEdit").equals("1")) {

			if (offre !=null){

				String titre, descript,formation;
				Date date;
				titre = ""+request.getParameter("titreOffre");
				descript = ""+request.getParameter("descriptionOffre"); 
				date = stringToDate(request.getParameter("dateOffre"));
				formation = request.getParameter("formationOffre");
				System.out.println("titre='"+request.getParameter("titreOffre")+"'");
				if (!titre.equals("") && !descript.equals("") && date != null && !formation.equals("-1")) {
					
					offre.setTitreOffre(titre);
					offre.setOffDescription(descript);
					offre.setIdformation(formManag.rechercherFormation(Integer.parseInt(formation)));
					offre.setValide(Integer.parseInt(request.getParameter("valide")));
					offreManag.editOffre(offre);
					session.removeAttribute("offre");
					response.sendRedirect(response.encodeRedirectURL("Recruteur.jsp?id=7&min=1#contenu"));		
				}
				else {
					session.setAttribute("ok", 0);
					response.sendRedirect(response.encodeRedirectURL("Recruteur.jsp?id=15#contenu"));
				}
			}
			else {
				session.setAttribute("ok", 11);
				response.sendRedirect(response.encodeRedirectURL("Recruteur.jsp?id=15#contenu"));
			}


		}
		else if (request.getParameter("srcEdit").equals("2")) {
			Admin a = null;
			a = (Admin) session.getAttribute("admin");
			if (a !=null){
				String titre, descript, societe, formation;
				Date date;
				titre = request.getParameter("titreOffre");
				descript = request.getParameter("descriptionOffre"); 
				date = stringToDate(request.getParameter("dateOffre"));
				formation = request.getParameter("formationOffre");
				societe = request.getParameter("societeOffre");


				if (offre != null) {
					if (!titre.equals("") && !descript.equals("") && date != null && !formation.equals("-1") && !societe.equals("-1")){

						offre.setTitreOffre(titre);
						offre.setDateOffre(date);
						offre.setIdformation(formManag.rechercherFormation(Integer.parseInt(formation)));
						offre.setIdsociete(societeManag.rechercherSociete(Integer.parseInt(societe)));
						offre.setOffDescription(descript);
						offre.setValide(Integer.parseInt(request.getParameter("valide")));
						offreManag.editOffre(offre);
						session.removeAttribute("offre");
						response.sendRedirect(response.encodeRedirectURL("admin.jsp?id=40&min=1&tri=dt&ord=DESC#contenu"));

					}
					else { //cas où tous les champs n'ont pas été remplis
						session.setAttribute("okAd", 12);
						response.sendRedirect(response.encodeRedirectURL("admin.jsp?id=25#contenu"));
					}
				}
				else {
					session.setAttribute("okAd", 13);
					response.sendRedirect(response.encodeRedirectURL("admin.jsp?id=25#contenu"));
				}
			}
			else {
				response.sendRedirect(response.encodeRedirectURL("admin.jsp"));
			}

		}

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
