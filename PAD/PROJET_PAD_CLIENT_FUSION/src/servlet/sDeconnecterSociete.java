package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entity.Candidat;
import entity.Societe;

/**
 * Servlet implementation class sDeconnecterCandidat
 */
public class sDeconnecterSociete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public sDeconnecterSociete() {
		super();

	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	protected void processRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		Societe s = null;
		HttpSession session = request.getSession();
		s = (Societe) session.getAttribute("societe");

		if (s != null) {
			session.removeAttribute("societe");
		}
		response.sendRedirect(response.encodeRedirectURL("Recruteur.jsp"));
	}
}
