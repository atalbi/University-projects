package servlet;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import candidat.session.AlerteManager;
import candidat.session.CandidatManager;
import entity.Admin;
import entity.Candidat;

/**
 * Servlet implementation class sCreateAlerte
 */
public class sCreateAlerte extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@EJB(mappedName = "AlerteManager") 
	AlerteManager alerteManag;

	@EJB(mappedName = "CandidatManager") 
	CandidatManager candidatManag;

	public sCreateAlerte() {
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
		String alert = request.getParameter("motCle");

		if (request.getParameter("srcCreate").equals("1")) { //cas d'une creation d'alerte par le candidat
			Candidat c = null;
			HttpSession session=request.getSession();
			c = (Candidat) session.getAttribute("candidat");
			if (c !=null) {
				if (!alert.equals("")){

					int result = alerteManag.creerAlerte(alert, c);
					if (result == 1){
						response.sendRedirect(response.encodeRedirectURL("index.jsp?id=9#contenu"));
					}
					else {
						session.setAttribute("ok", 8);
						response.sendRedirect(response.encodeRedirectURL("index.jsp?id=19#contenu"));
					}
				}
				else {
					session.setAttribute("ok", 3);
					response.sendRedirect(response.encodeRedirectURL("index.jsp?id=19#contenu"));
				}
			}
			else {
				session.setAttribute("ok", 11);
				response.sendRedirect(response.encodeRedirectURL("index.jsp?id=19#contenu"));
			}

		}
		else if (request.getParameter("srcCreate").equals("2")) { //cas d'une creation d'alerte par l'admin

			Admin a = null;
			HttpSession session=request.getSession();
			a = (Admin) session.getAttribute("admin");
			int idCand = Integer.parseInt(request.getParameter("candidat"));

			if (a !=null){
				if (!request.getParameter("candidat").equals("-1") && !alert.equals("")) {
					Candidat cand = null;
					cand = candidatManag.rechercherCandidat(idCand);
					if (cand != null) {
						int result = alerteManag.creerAlerte(alert, cand);
						if (result == 1){
							response.sendRedirect(response.encodeRedirectURL("admin.jsp?id=35&tri=df&ord=DESC&min=1#contenu"));
						}
						else {
							session.setAttribute("okAd", 9);
							response.sendRedirect(response.encodeRedirectURL("admin.jsp?id=25#contenu"));
						}

					}
				}
				else {
					session.setAttribute("okAd", 10);
					response.sendRedirect(response.encodeRedirectURL("admin.jsp?id=25#contenu"));
				}

			}
			else {
				response.sendRedirect(response.encodeRedirectURL("admin.jsp"));
			}
		}
	}
}
