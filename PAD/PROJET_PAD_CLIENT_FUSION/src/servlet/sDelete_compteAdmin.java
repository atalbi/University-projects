package servlet;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin.session.AdminManager;

import entity.Admin;
import entity.Alerte;
import entity.Candidat;

/**
 * Servlet implementation class sDelete_compteAdmin
 */
public class sDelete_compteAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@EJB(mappedName = "AdminManager") 
	AdminManager adminManag;   
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public sDelete_compteAdmin() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
    	Admin a = null;
    	HttpSession session=request.getSession();
		a = (Admin) session.getAttribute("admin");
		
		
		if (a !=null){ 
			if (request.getParameter("confirm").equals("OUI")) {
				Admin profil_a_supprimer = (Admin)session.getAttribute("profil_a_supprimer");
				session.removeAttribute("profil_a_supprimer");
				//retourne 1 si suppression ok
				//		   0 si suppression nOk
				//		   2 si suppression impossible car il s'agit du superAdmin qui ne peut etre supprimé
				int result = adminManag.supprimerAdmin(profil_a_supprimer.getIdadmin());
				
				if (result == 1) {
					if (a.getIdadmin() == profil_a_supprimer.getIdadmin()) {
						session.removeAttribute("admin");
						response.sendRedirect(response.encodeRedirectURL("admin.jsp"));
					}
					else {
						session.setAttribute("okAd", 4);
						response.sendRedirect(response.encodeRedirectURL("admin.jsp?id=25#contenu"));
					}
				}
				else if (result == 0) {
					session.setAttribute("okAd", 5);
					response.sendRedirect(response.encodeRedirectURL("admin.jsp?id=25#contenu"));
				}
				else if (result == 2) {
					session.setAttribute("okAd", 6);
					response.sendRedirect(response.encodeRedirectURL("admin.jsp?id=25#contenu"));
				}
			}
			else if (request.getParameter("confirm").equals("NON")){
				response.sendRedirect(response.encodeRedirectURL("admin.jsp"));
			}
			
			
			
		}
		else {
			response.sendRedirect(response.encodeRedirectURL("admin.jsp"));
		}
    }

}
