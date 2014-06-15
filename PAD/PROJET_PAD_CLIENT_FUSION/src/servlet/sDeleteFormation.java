package servlet;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin.session.FormationManager;

import candidat.session.AlerteManager;

import entity.Admin;
import entity.Alerte;
import entity.Candidat;
import entity.Formation;

/**
 * Servlet implementation class sDeleteFormation
 */
public class sDeleteFormation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	@EJB(mappedName = "FormationManager") 
	FormationManager formationManag;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public sDeleteFormation() {
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

		HttpSession session=request.getSession();
		Formation f = null;
		f = (Formation)session.getAttribute("formation");
		
		Admin adm = null;
		adm = (Admin) session.getAttribute("admin");
		if (adm !=null){
			if (request.getParameter("confirm").equals("OUI")) {

				formationManag.supprimerFormation(f.getIdformation());
					session.removeAttribute("formation");
				}
				response.sendRedirect(response.encodeRedirectURL("admin.jsp?id=32#contenu"));
			}
			else {
				response.sendRedirect(response.encodeRedirectURL("admin.jsp"));
			}
		
	}

}
