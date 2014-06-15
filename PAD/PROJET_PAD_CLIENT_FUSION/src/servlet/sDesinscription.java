package servlet;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import candidat.session.CandidatManager;

import recruteur.session.SocieteManager;

import entity.Candidat;

/**
 * Servlet implementation class sDesinscription
 */
public class sDesinscription extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@EJB(mappedName = "CandidatManager")
	CandidatManager candidatManag;
    
    public sDesinscription() {
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
	    Candidat c = null;	
		 HttpSession session=request.getSession();
			c = (Candidat) session.getAttribute("candidat");
			
			if (c != null) {
				
				if (request.getParameter("confirm").equals("OUI")) {
					c.setValide(0);
					candidatManag.editCandidat(c, null);
					session.removeAttribute("candidat");
				}
				response.sendRedirect(response.encodeRedirectURL("index.jsp"));
			}
			else {
				session.setAttribute("ok", 11);
				response.sendRedirect(response.encodeRedirectURL("index.jsp?id=19#contenu"));
			}
	 }
}
