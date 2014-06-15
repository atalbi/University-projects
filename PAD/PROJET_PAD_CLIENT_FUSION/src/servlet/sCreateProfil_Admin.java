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

/**
 * Servlet implementation class sCreateProfil_Admin
 */
public class sCreateProfil_Admin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@EJB(mappedName = "AdminManager") 
	AdminManager adminManag;   

	public sCreateProfil_Admin() {
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
	    	Admin a = new Admin();
			String login, password;
			login = request.getParameter("loginAdmin");
			password = request.getParameter("passwordAdmin");
			
			HttpSession session = request.getSession();
			
			if ((Admin)session.getAttribute("admin") != null){
				
				a.setLogin(login);
				a.setPassword(password);
				
				int result = adminManag.creerAdmin(a);
				//retourne 1 si ok
				//		   0 si tous le login et le password ne sont pas renseignés dans le fromulaire
				//		   2 si le login indiqué existe deja
				if (result == 1){
					session.setAttribute("okAd", 1);
					response.sendRedirect(response.encodeRedirectURL("admin.jsp?id=25#contenu"));
				}
				else if (result == 2){
					session.setAttribute("okAd", 2);
					response.sendRedirect(response.encodeRedirectURL("admin.jsp?id=25#contenu"));
				}
				else if (result == 0){
					session.setAttribute("okAd", 0);
					response.sendRedirect(response.encodeRedirectURL("admin.jsp?id=25#contenu"));
				}
				
			}
			else { //cas où la session de l'admin qui crée le profil est expirée
				response.sendRedirect(response.encodeRedirectURL("admin.jsp"));
			}
			
	    }
}
