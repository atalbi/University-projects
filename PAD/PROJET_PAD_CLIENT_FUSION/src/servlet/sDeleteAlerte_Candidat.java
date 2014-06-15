package servlet;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import candidat.session.AlerteManager;

import entity.Admin;
import entity.Alerte;
import entity.Candidat;

/**
 * Servlet implementation class sDeleteAlerte_Candidat
 */
public class sDeleteAlerte_Candidat extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@EJB(mappedName = "AlerteManager") 
	AlerteManager alerteManag;

	public sDeleteAlerte_Candidat() {
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
		Alerte a = null;
		a = (Alerte)session.getAttribute("alerte");
		
		if (request.getParameter("srcDelete").equals("1")) { //cas d'une suppression d'alerte par le candidat
			Candidat c = null;
			c = (Candidat) session.getAttribute("candidat");
			if (c !=null){ 
				if (request.getParameter("confirm").equals("OUI")) {

					alerteManag.supprimerAlerte(a);
					session.removeAttribute("alerte");
					
				}
				response.sendRedirect(response.encodeRedirectURL("index.jsp?id=9#contenu"));
			}
			else {
				session.setAttribute("ok", 11);
				response.sendRedirect(response.encodeRedirectURL("index.jsp?id=19#contenu"));
			}
		}
		
		
		else if (request.getParameter("srcDelete").equals("2")) { //cas d'une suppression d'alerte par l'admin
			
			Admin adm = null;
			adm = (Admin) session.getAttribute("admin");
			if (adm !=null){
				if (request.getParameter("confirm").equals("OUI")) {

					alerteManag.supprimerAlerte(a);
					session.removeAttribute("alerte");
					
				}
				response.sendRedirect(response.encodeRedirectURL("admin.jsp?id=35&tri=df&ord=DESC&min=1#contenu"));
			}
			else {
				response.sendRedirect(response.encodeRedirectURL("admin.jsp"));
			}
			
		}
	}

}
