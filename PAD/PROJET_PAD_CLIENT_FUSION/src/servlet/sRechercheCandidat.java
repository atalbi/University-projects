package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import recruteur.session.OffreManager;
import recruteur.session.SocieteManager;

import admin.session.FormationManager;

import candidat.session.CandidatManager;
import entity.Candidat;
import entity.Formation;
import entity.Offre;
import entity.Societe;

/**
 * Servlet implementation class sEditProfil_Candidat
 */
public class sRechercheCandidat extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@EJB(mappedName = "CandidatManager")
	CandidatManager candManag;

	public sRechercheCandidat() {
		super();
	}

	protected void processRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		ArrayList<Candidat> listeCand = null;
		listeCand = candManag
				.recherche_List_Candidat(request.getParameter("nomCand"),
						request.getParameter("prCand"), Integer
								.parseInt(request.getParameter("formation")),
						request.getParameter("nvEtudes"), request
								.getParameter("email"), request
								.getParameter("keyWord"));
		session.setAttribute("listeCand", listeCand);

		response.sendRedirect(response.encodeRedirectURL("index.jsp?id=66&min=2"));
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

}
