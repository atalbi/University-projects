package servlet;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import candidat.session.CandidatManager;
import entity.Admin;
import entity.Alerte;
import entity.Candidat;

/**
 * Servlet implementation class sDesinscription
 */
public class sDeleteCandidat extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	@EJB(mappedName = "CandidatManager") 
	CandidatManager candidatManag;
	
    public sDeleteCandidat() {
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
    	Candidat c = null;
    	HttpSession session=request.getSession();
    	
    	if (request.getParameter("srcDelete").equals("1")) { //cas d'une suppression par le candidat
    		c = (Candidat) session.getAttribute("candidat");
    		if (c !=null){ 
    			if (request.getParameter("confirm").equals("OUI")) {
    				candidatManag.supprimerCandidat(c.getIdcandidat());
    				session.removeAttribute("candidat");
    				session.setAttribute("ok", 5);
    				response.sendRedirect(response.encodeRedirectURL("index.jsp?id=15#contenu"));
    			}
    			else if (request.getParameter("confirm").equals("NON")){
    				response.sendRedirect(response.encodeRedirectURL("index.jsp?id=5"));
    			}
    		}
    		else {
    			response.sendRedirect(response.encodeRedirectURL("index.jsp?id=2"));
    		}
		}

		else if (request.getParameter("srcDelete").equals("2")) { //cas d'une modification d'alerte par l'admin
			Admin adm = null;
			adm = (Admin) session.getAttribute("admin");

			if (adm !=null){
				c = (Candidat) session.getAttribute("candidat");
				if (c != null) {
					if (request.getParameter("confirm").equals("OUI")) {

						candidatManag.suppression_definitive(c.getIdcandidat());
						session.removeAttribute("candidat");

					}
					response.sendRedirect(response.encodeRedirectURL("admin.jsp?id=53&tri=df&ord=DESC&min=1#contenu"));

				}
				else {
					session.setAttribute("okAd", 20);
					response.sendRedirect(response.encodeRedirectURL("admin.jsp?id=25#contenu"));
				}
			}
			else {
				response.sendRedirect(response.encodeRedirectURL("admin.jsp"));
			}
		}
		
    }

}
