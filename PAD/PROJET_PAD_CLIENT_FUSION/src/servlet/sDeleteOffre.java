package servlet;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import recruteur.session.OffreManager;

import entity.Admin;
import entity.Alerte;
import entity.Candidat;
import entity.Offre;
import entity.Societe;

/**
 * Servlet implementation class sDeleteOffre
 */
public class sDeleteOffre extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@EJB(mappedName = "OffreManager") 
	OffreManager offreManag;   

	public sDeleteOffre() {
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
		Offre o = null;
		o = (Offre)session.getAttribute("offre");

		if (request.getParameter("srcDelete").equals("1")) { //cas d'une suppression par le recruteur
			
			Societe s = (Societe) session.getAttribute("societe");
			
			
			if (s !=null){ 
				if (request.getParameter("confirm").equals("OUI")) {
					offreManag.suppression_definitive(o.getIdoffre());
				}
				session.removeAttribute("offre");
				response.sendRedirect(response.encodeRedirectURL("Recruteur.jsp?id=7&min=1#contenu"));
				
			}
			else {
				response.sendRedirect(response.encodeRedirectURL("Recruteur.jsp"));
			}
			
		}

		else if (request.getParameter("srcDelete").equals("2")) { //cas d'une modification d'alerte par l'admin
			Admin adm = null;
			adm = (Admin) session.getAttribute("admin");

			if (adm !=null){
				if (o != null) {
					if (request.getParameter("confirm").equals("OUI")) {
						offreManag.suppression_definitive(o.getIdoffre());
					}
					session.removeAttribute("offre");
					response.sendRedirect(response.encodeRedirectURL("admin.jsp?id=40&min=1&tri=dt&ord=DESC#contenu"));

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

