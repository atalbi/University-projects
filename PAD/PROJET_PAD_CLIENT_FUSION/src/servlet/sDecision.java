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

import messages.MessageDecision;

import recruteur.session.OffreManager;
import ressources.Mdb;

import candidat.session.CandidatManager;
import candidat.session.CandidatureManager;
import entity.Alerte;
import entity.Candidat;
import entity.Candidature;
import entity.Societe;

/**
 * Servlet implementation class sDesinscription
 */
public class sDecision extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@EJB(mappedName = "CandidatureManager")
	CandidatureManager candidatureManag;

	@EJB(mappedName = "CandidatManager")
	CandidatManager candidatManag;

	@EJB(mappedName = "OffreManager")
	OffreManager offreManager;

	public sDecision() {
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
		Candidature cc = null;
		Candidat c = null;
		HttpSession session = request.getSession();

		Societe s = (Societe) session.getAttribute("societe");

		int idcc = Integer.parseInt(request.getParameter("idcandidature"));
		int idc = Integer.parseInt(request.getParameter("idcandidat"));
		cc = candidatureManag.rechercher(idcc);
		c = candidatManag.rechercherCandidat(idc);
		if (cc != null) {
			if (request.getParameter("confirm").equals("Accepter")) {
				cc.setDecision("Accepted");
				candidatureManag.editCandidature(cc);
				Mdb canal = new Mdb();
				MessageDecision mgd = new MessageDecision(c, cc, s);
				try {
					canal.send(mgd);
				} catch (JMSException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (NamingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				session.removeAttribute("idcandidature");
				session.setAttribute("ok", 6);
				response.sendRedirect(response.encodeRedirectURL("Recruteur.jsp?id=5#contenu"));
			} else if (request.getParameter("confirm").equals("Refuser")) {
				cc.setDecision("Refused");
				candidatureManag.editCandidature(cc);

				Mdb canal = new Mdb();
				MessageDecision mgd = new MessageDecision(c, cc, s);
				try {
					canal.send(mgd);
				} catch (JMSException e) {
					e.printStackTrace();
				} catch (NamingException e) {
					e.printStackTrace();
				}
				session.removeAttribute("idcandidature");
				session.setAttribute("ok", 6);
				response.sendRedirect(response.encodeRedirectURL("Recruteur.jsp?id=5#contenu"));
			} else if (request.getParameter("confirm").equals("Retour")) {
				session.removeAttribute("idcandidature");
				response.sendRedirect(response.encodeRedirectURL("Recruteur.jsp?id=5#contenu"));
			}

		} else {
			response.sendRedirect(response.encodeRedirectURL("Recruteur.jsp"));
		}
	}
}
