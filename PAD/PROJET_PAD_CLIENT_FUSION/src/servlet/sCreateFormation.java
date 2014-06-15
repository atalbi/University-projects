package servlet;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin.session.FormationManager;
import entity.Admin;

/**
 * Servlet implementation class sCreateFormation
 */
public class sCreateFormation extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@EJB(mappedName = "FormationManager") 
	FormationManager formationManag;


	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public sCreateFormation() {
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

		if (a !=null){
			if (!libelleF.equals(""))  {
				//retourne 1 si ok et 0 sinon
				int result = formationManag.creerFormation(libelleF);
				if (result == 1) {
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
