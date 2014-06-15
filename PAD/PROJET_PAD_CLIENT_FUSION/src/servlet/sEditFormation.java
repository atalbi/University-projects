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
 * Servlet implementation class sEditFormation
 */
public class sEditFormation extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	@EJB(mappedName = "FormationManager") 
	FormationManager formationManag;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public sEditFormation() {
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
		a = (Admin) session.getAttribute("admin");
		String libelleF = request.getParameter("libelleFormation");
		Formation formation_a_modifier = (Formation) session.getAttribute("formation_a_modifier");
		
		
		if (a !=null){
			if (!libelleF.equals(""))  {
				
				formation_a_modifier.setLibelleFormation(libelleF);
				
				//retourne 1 si ok et 0 sinon
				int result = formationManag.editFormation(formation_a_modifier);
				if (result == 1) {
					session.removeAttribute("formation_a_modifier");
					response.sendRedirect(response.encodeRedirectURL("admin.jsp?id=32#contenu"));
					}
				else {
					session.setAttribute("okAd", 8);
					response.sendRedirect(response.encodeRedirectURL("admin.jsp?id=25#contenu"));
				}
			}
			else {
				session.setAttribute("okAd", 7);
				response.sendRedirect(response.encodeRedirectURL("admin.jsp?id=25#contenu"));
			}
			
		}
		else {
			response.sendRedirect(response.encodeRedirectURL("admin.jsp"));
		}
    }
}
