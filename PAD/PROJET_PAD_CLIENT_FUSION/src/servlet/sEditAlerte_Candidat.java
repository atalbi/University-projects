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
import entity.Alerte;
import entity.Candidat;

/**
 * Servlet implementation class sEditAlerte_Candidat
 */
public class sEditAlerte_Candidat extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@EJB(mappedName = "AlerteManager") 
	AlerteManager alerteManag;

	@EJB(mappedName = "CandidatManager") 
	CandidatManager candidatManag;


	public sEditAlerte_Candidat() {
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
		String motCle = request.getParameter("motCle");

		if (request.getParameter("srcEdit").equals("1")) { //cas d'une modification d'alerte par le candidat
			Candidat c = null;
			c = (Candidat) session.getAttribute("candidat");
			
			if (c !=null) {
				if (a != null && !motCle.equals("")){ 

					a.setMotcle(motCle);
					int result = alerteManag.modifierAlerte(a);
					if (result == 1){
						session.removeAttribute("alerte");
						response.sendRedirect(response.encodeRedirectURL("index.jsp?id=9#contenu"));
					}
					else {
						session.setAttribute("ok", 8);
						response.sendRedirect(response.encodeRedirectURL("index.jsp?id=19#contenu"));
					}
				}
				else {
					session.setAttribute("ok", 4);
					response.sendRedirect(response.encodeRedirectURL("index.jsp?id=19#contenu"));
				}
			}
			else {
				session.setAttribute("ok", 11);
				response.sendRedirect(response.encodeRedirectURL("index.jsp?id=19#contenu"));
			}
		}
		
		
		else if (request.getParameter("srcEdit").equals("2")) { //cas d'une modification d'alerte par l'admin
			Admin adm = null;
			adm = (Admin) session.getAttribute("admin");
			int idCand = Integer.parseInt(request.getParameter("candidat"));

			if (adm !=null){
				if (!request.getParameter("candidat").equals("-1") && !motCle.equals("") && a!=null) {
					Candidat cand = null;
					cand = candidatManag.rechercherCandidat(idCand);
					
					if (cand != null) {
						
						a.setIdcandidat(cand);
						a.setMotcle(motCle);
						int result = alerteManag.modifierAlerte(a);
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
