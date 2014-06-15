package servlet;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import recruteur.session.SocieteManager;

import entity.Societe;

/**
 * Servlet implementation class sDesinscription
 */
public class sDesinscriptionSoc extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	@EJB(mappedName = "SocieteManager") 
	SocieteManager socManag;
	
    public sDesinscriptionSoc() {
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
    	Societe s = null;
    	HttpSession session=request.getSession();
		s = (Societe) session.getAttribute("societe");
		
		
		if (s !=null){ 
			if (request.getParameter("confirm").equals("OUI")) {
				socManag.supprimerSociete(s.getIdsociete());
				session.removeAttribute("societe");
			}
		}
		response.sendRedirect(response.encodeRedirectURL("Recruteur.jsp"));
		
    }

}
