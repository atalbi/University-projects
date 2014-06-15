package servlet;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.sql.Date;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import recruteur.session.OffreManager;
import recruteur.session.SocieteManager;
import admin.session.FormationManager;
import entity.Admin;
import entity.Offre;
import entity.Societe;

/**
 * Servlet implementation class sCreateOffre
 */
public class sCreateOffre extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@EJB(mappedName = "OffreManager") 
	OffreManager offreManag;   

	@EJB(mappedName = "FormationManager") 
	FormationManager formManag; 

	@EJB(mappedName = "SocieteManager") 
	SocieteManager societeManag; 

	public sCreateOffre() {
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
		Admin a = null;
		HttpSession session=request.getSession();

		if (request.getParameter("srcCreate").equals("1")) {
			Societe societe = null;
			societe = (Societe) session.getAttribute("societe");

			if (societe != null) {
				Offre off = new Offre();
				String titre, obser;
				Date date = stringToDate(request.getParameter("DateOff"));

				String idForm;
				titre = request.getParameter("titleOff");
				obser = request.getParameter("ObsOff");

				idForm = request.getParameter("formationOff");

				if (!titre.equals("") && date != null && !obser.equals("") && societe!=null && !idForm.equals("-1")){
					off.setTitreOffre(titre);
					off.setDateOffre(date);
					off.setOffDescription(obser);
					off.setIdsociete(societe);
					off.setIdformation(formManag.rechercherFormation(Integer.parseInt(idForm)));
					off.setValide(Integer.parseInt(request.getParameter("valide")));
					offreManag.ajouter_offre(off);
					response.sendRedirect(response.encodeRedirectURL("Recruteur.jsp?id=7&min=1#contenu"));
				}
				else { 
					session.setAttribute("ok", 0);
					response.sendRedirect(response.encodeRedirectURL("Recruteur.jsp?id=15#contenu"));
				}
			}
			else {
				response.sendRedirect(response.encodeRedirectURL("Recruteur.jsp"));
			}
			
		}

		else if (request.getParameter("srcCreate").equals("2")) {

			a = (Admin) session.getAttribute("admin");

			if (a !=null){
				String titre, descript, societe, formation;
				Date date = stringToDate(request.getParameter("dateOffre"));
				titre = request.getParameter("titreOffre");
				descript = request.getParameter("descriptionOffre"); 

				formation = request.getParameter("formationOffre");
				societe = request.getParameter("societeOffre");

				if (!titre.equals("") && !descript.equals("") && date != null && !formation.equals("-1") && !societe.equals("-1")){
					Offre offre = new Offre();

					offre.setTitreOffre(titre);
					offre.setDateOffre(date);
					offre.setIdformation(formManag.rechercherFormation(Integer.parseInt(formation)));
					offre.setIdsociete(societeManag.rechercherSociete(Integer.parseInt(societe)));
					offre.setOffDescription(descript);
					offre.setValide(Integer.parseInt(request.getParameter("valide")));
					offreManag.ajouter_offre(offre);
					response.sendRedirect(response.encodeRedirectURL("admin.jsp?id=40&min=1&tri=dt&ord=DESC#contenu"));


				}
				else { //cas où tous les champs n'ont pas été remplis
					session.setAttribute("okAd", 12);
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
}
