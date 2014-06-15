package servlet;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import recruteur.session.SocieteManager;
import admin.session.AdminManager;
import candidat.session.CandidatManager;
import entity.Admin;
import entity.Candidat;
import entity.Societe;

/**
 * 
 * @author Administrateur
 */
public class sIdentification extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@EJB(mappedName = "CandidatManager")
	CandidatManager candidatManag;

	@EJB(mappedName = "SocieteManager")
	SocieteManager societeManag;

	@EJB(mappedName = "AdminManager")
	AdminManager adminManag;

	protected void processRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		String log = request.getParameter("login");
		String password = request.getParameter("password");
		String typeIdent = request.getParameter("typeIdent");
		HttpSession session = request.getSession();

		// identification d'un candidat
		if (typeIdent.equals("1")) {

			if (!log.equals("") && !password.equals("")) {

				Candidat c = null;
				c = candidatManag.identification(log, password);
				if (c != null) {

					session.setAttribute("candidat", c);

					response.sendRedirect(response.encodeRedirectURL("index.jsp?id=5"));
				} else {
					response.sendRedirect(response.encodeRedirectURL("index.jsp?id=-1"));
				}
			} else {

				session.setAttribute("ok", 4);
				response.sendRedirect(response
						.encodeRedirectURL("index.jsp?id=15"));
			}
		} else if (typeIdent.equals("2")) {

			Societe s = null;
			s = societeManag.identification(log, password);

			if (s != null) {
				session.setAttribute("societe", s);
				response.sendRedirect(response
						.encodeRedirectURL("Recruteur.jsp"));
			} else {
				response.sendRedirect(response
						.encodeRedirectURL("Recruteur.jsp?id=9"));
			}

		}

		// identification d'un admin
		else if (typeIdent.equals("3")) {

			Admin a = null;
			a = adminManag.identification(log, password);

			if (a != null) {

				session.setAttribute("admin", a);
				response.sendRedirect(response.encodeRedirectURL("admin.jsp"));
			} else {
				response.sendRedirect(response.encodeRedirectURL("admin.jsp?id=-1"));
			}

		}

	}

	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

}
