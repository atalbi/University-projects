package servlet;

import java.io.IOException;
import java.sql.Date;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import recruteur.session.OffreManager;
import candidat.session.CandidatureManager;
import entity.Candidat;
import entity.Candidature;
import entity.Offre;

/**
 * Servlet implementation class sCandidater
 */
public class sCandidater extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@EJB(mappedName = "CandidatureManager") 
	CandidatureManager candidatManag;
	  
	@EJB(mappedName = "OffreManager") 
	OffreManager offreManag;

    public sCandidater() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
    	Candidat c = null;
    	HttpSession session=request.getSession();
		c = (Candidat) session.getAttribute("candidat");
		String observ;
		int idOffre;
		Offre offre;
		observ = request.getParameter("observCandidature");
		idOffre = Integer.parseInt(request.getParameter("idOffre"));
		offre = offreManag.rechercher(idOffre);
		if (c !=null && offre != null){
			Candidature cand = new Candidature();
			cand.setDate(new Date(new java.util.Date().getTime()));
			cand.setObservation(observ);
			cand.setDecision("En cours");
			cand.setIdoffre(offre);
			cand.setIdcandidat(c);
			candidatManag.postuler(cand);

			session.setAttribute("ok", 2);
			response.sendRedirect(response.encodeRedirectURL("index.jsp?id=19#contenu"));
		}
		else {
			session.setAttribute("ok", 11);
			response.sendRedirect(response.encodeRedirectURL("index.jsp?id=19#contenu"));
		}
    }
}
