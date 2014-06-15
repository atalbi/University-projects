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
 * Servlet implementation class sEditSociete
 */
public class sEditSociete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@EJB(mappedName = "SocieteManager")
	SocieteManager societeManag;


	public sEditSociete() {
		super();
	}

	protected void processRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		Societe s = null;
		HttpSession session = request.getSession();

		if (request.getParameter("srcEdit").equals("1")) { //cas modif par le recruteur
			
			s = (Societe) session.getAttribute("societe");

			if (s != null) {
				if (!request.getParameter("nomSociete").equals("")&& !request.getParameter("emailSociete").equals("")
						&& !request.getParameter("passwordSociete").equals("")) {
					
					s.setRaisonSocial(request.getParameter("nomSociete"));
					s.setTel(request.getParameter("telSociete"));
					s.setAdresse(request.getParameter("adressSociete"));
					s.setLogin(request.getParameter("emailSociete"));
					s.setDescription(request.getParameter("descriptionSociete"));
					int result = 1;
					
					if (!s.getPassword().equals(request.getParameter("passwordSociete")))
						result = societeManag.editSociete(s,request.getParameter("passwordSociete"));
					else 
						result = societeManag.editSociete(s, null);

					if (result == 1) {
						session.setAttribute("societe", s);
						response.sendRedirect(response.encodeRedirectURL("Recruteur.jsp"));
					}
					else {
						session.setAttribute("ok", 10);
						response.sendRedirect(response.encodeRedirectURL("Recruteur.jsp?id=15#contenu"));
					}
					
					
				} else {
					session.setAttribute("ok", 9);
					response.sendRedirect(response.encodeRedirectURL("Recruteur.jsp?id=15#contenu"));
				}
							
			}
			else {
				response.sendRedirect(response.encodeRedirectURL("Recruteur.jsp"));
			}
					
			
		}
		
		else if (request.getParameter("srcEdit").equals("2")) { //cas modif par l'admin
		
			Admin adm = null;
		adm = (Admin) session.getAttribute("admin");

		if (adm != null) {
			s = (Societe) (societeManag.rechercherSociete(Integer.parseInt(request.getParameter("idSociete"))));
			if (s != null) {
				if (!request.getParameter("nomSociete").equals("")&& !request.getParameter("loginSociete").equals("")
						&& !request.getParameter("passwordSociete").equals("")) {

					s.setRaisonSocial(request.getParameter("nomSociete"));
					s.setLogin(request.getParameter("loginSociete"));
					s.setDescription(request.getParameter("descriptionSociete"));
					s.setAdresse(request.getParameter("adresseSociete"));
					s.setTel(request.getParameter("telSociete"));
					if (request.getParameter("valideSociete").equals("1") || request.getParameter("valideSociete").equals("0")) {

						s.setValide(Integer.parseInt(request.getParameter("valideSociete")));
						int result = 1;
						if (!s.getPassword().equals(request.getParameter("passwordSociete")))
							result = societeManag.editSociete(s,request.getParameter("passwordSociete"));
						else 
							result = societeManag.editSociete(s, null);

						if (result == 1) {
							response.sendRedirect(response.encodeRedirectURL("admin.jsp?id=45&min=1&tri=df&ord=DESC#contenu"));
						}
						else {
							session.setAttribute("okAd", 17);
							response.sendRedirect(response.encodeRedirectURL("admin.jsp?id=25#contenu"));
						}
					}
					else {
						session.setAttribute("okAd", 18);
						response.sendRedirect(response.encodeRedirectURL("admin.jsp?id=25#contenu"));
					}

				} else {
					session.setAttribute("okAd", 16);
					response.sendRedirect(response.encodeRedirectURL("admin.jsp?id=25#contenu"));
				}

			} else {
				session.setAttribute("okAd", 15);
				response.sendRedirect(response.encodeRedirectURL("admin.jsp?id=25#contenu"));
			}
		} else {
			response.sendRedirect(response.encodeRedirectURL("admin.jsp"));
		}
	}
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

}