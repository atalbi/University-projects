package servlet;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import recruteur.session.SocieteManager;
import entity.Admin;
import entity.Societe;

/**
 * Servlet implementation class sDeleteSociete
 */
public class sDeleteSociete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@EJB(mappedName = "SocieteManager") 
	SocieteManager societeManag;  

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public sDeleteSociete() {
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
		Societe s = null;
		s = (Societe)session.getAttribute("societe");

		if (request.getParameter("srcDelete").equals("1")) { //cas d'une suppression par le recruteur

		}

		else if (request.getParameter("srcDelete").equals("2")) { //cas d'une modification d'alerte par l'admin

			Admin adm = null;
			adm = (Admin) session.getAttribute("admin");

			if (adm !=null){
				if (s != null) {
					if (request.getParameter("confirm").equals("OUI")) {

						societeManag.suppression_definitive(s.getIdsociete());
						session.removeAttribute("societe");

					}
					response.sendRedirect(response.encodeRedirectURL("admin.jsp?id=45&min=1&tri=df&ord=DESC#contenu"));

				}
			}
			else {
				response.sendRedirect(response.encodeRedirectURL("admin.jsp"));
			}
		}
	}

}
