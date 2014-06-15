package servlet;

import java.io.IOException;

import javax.ejb.EJB;
import javax.jms.JMSException;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import messages.MessageConfInsSoc;

import recruteur.session.SocieteManager;
import ressources.Mdb;

import entity.Admin;
import entity.Societe;

/**
 * Servlet implementation class sCreateSociete
 */
public class sCreateSociete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@EJB(mappedName = "SocieteManager")
	SocieteManager societeManag;

	public sCreateSociete() {
		super();
	}

	protected void processRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		Societe s = null;
		HttpSession session = request.getSession();

		if (request.getParameter("srcCreate").equals("1")) {

			s = new Societe();
			String raisonSoc, tel, adresse, desc, email, password;
			raisonSoc = request.getParameter("raiSoc");
			tel = request.getParameter("TelSoc");
			adresse = request.getParameter("AdresSoc"); 
			desc = request.getParameter("description");
			email = request.getParameter("emailSoc");
			password = request.getParameter("passwordSoc");
			System.out.println("password='"+password+"'");
			if (!raisonSoc.equals("") && !tel.equals("") && !adresse.equals("")
					&& !desc.equals("-1") && !email.equals("")
					&& !password.equals("")) {
				s.setRaisonSocial(raisonSoc);
				s.setTel(tel);
				s.setAdresse(adresse);
				s.setDescription(desc);
				s.setLogin(email);
				s.setPassword(password);
				s.setValide(1);
				int result = societeManag.creerSociete(s);
				//retourne 1 si ok
				//		   2 si doublon login
				//		   3 si doublon raison Sociale
				if (result == 1) {
					Mdb canal = new Mdb();
					MessageConfInsSoc m = new MessageConfInsSoc();
					m.setSociete(s);
					try {
						canal.send(m);
					} catch (JMSException e) {
						e.printStackTrace();
					} catch (NamingException e) {
						e.printStackTrace();
					}
					session.setAttribute("ok", 1);
					response.sendRedirect(response.encodeRedirectURL("Recruteur.jsp?id=15#contenu"));
				} else if (result == 2) {
					session.setAttribute("ok", 2);
					response.sendRedirect(response.encodeRedirectURL("Recruteur.jsp?id=15#contenu"));
				} else if (result == 3) {
					session.setAttribute("ok", 3);
					response.sendRedirect(response.encodeRedirectURL("Recruteur.jsp?id=15#contenu"));
				}

			} else { // cas où tous les champs n'ont pas été remplis 
				session.setAttribute("ok", 0);
				response.sendRedirect(response.encodeRedirectURL("Recruteur.jsp?id=15#contenu"));
			}

		}
		
		else if (request.getParameter("srcCreate").equals("2")) {
			Admin adm = null;
			adm = (Admin) session.getAttribute("admin");

			if (adm != null) {

				String nom, login, password;
				nom = request.getParameter("nomSociete"); 
				login = request.getParameter("loginSociete");
				password = request.getParameter("passwordSociete");

				if (!nom.equals("") && !login.equals("") && !password.equals("")) {

					s = new Societe();
					s.setRaisonSocial(nom);
					s.setLogin(login);
					s.setDescription(request.getParameter("descriptionSociete"));
					s.setAdresse(request.getParameter("adresseSociete"));
					s.setTel(request.getParameter("telSociete"));
					s.setPassword(request.getParameter("passwordSociete"));
					if (request.getParameter("valide").equals("1") || request.getParameter("valide").equals("0")) {

						s.setValide(Integer.parseInt(request.getParameter("valide")));

						int result = societeManag.creerSociete(s);

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
