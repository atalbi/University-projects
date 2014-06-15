package servlet;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import candidat.session.AlerteManager;
import candidat.session.CandidatureManager;

import entity.Admin;
import entity.Alerte;
import entity.Candidat;
import entity.Candidature;

/**
 * Servlet implementation class sDeleteCandidature
 */
public class sDeleteCandidature extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	@EJB(mappedName = "CandidatureManager") 
	CandidatureManager candManag;
	
    
    public sDeleteCandidature() {
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
			Admin adm = null;
			adm = (Admin) session.getAttribute("admin");
			if (adm !=null){
				if (request.getParameter("confirm").equals("OUI")) {
					Candidature c = (Candidature)session.getAttribute("candidature");
					candManag.supprimer_Candidature(c.getIdcandidature());
					session.removeAttribute("candidature");
					
				}
				response.sendRedirect(response.encodeRedirectURL("admin.jsp?id=44&tri=dtC&min=1&ord=DESC#contenu"));
			}
			else {
				response.sendRedirect(response.encodeRedirectURL("admin.jsp"));
			}
			
		
	}

}
