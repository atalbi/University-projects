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
 * Servlet implementation class sEditProfil_Admin
 */
public class sEditProfil_Admin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@EJB(mappedName = "AdminManager") 
	AdminManager adminManag;   

	public sEditProfil_Admin() {
		super();
	}

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		Admin a = null;
		HttpSession session=request.getSession();
		a = (Admin) session.getAttribute("admin");
		String login, password;
		login = request.getParameter("loginAdmin");
		password = request.getParameter("passwordAdmin");
		Admin profil_a_modifier = (Admin)session.getAttribute("profil_a_modifier");
		

		if (a !=null){
			if (profil_a_modifier!= null && !login.equals("") && !password.equals("")) {
				
				profil_a_modifier.setLogin(login);

				//retourne 1 si ok
				//		   2 si login deja existent
				int result = -1;
				if (!profil_a_modifier.getPassword().equals(request.getParameter("passwordAdmin"))) 
					result = adminManag.editAdmin(profil_a_modifier, request.getParameter("passwordAdmin"));
				else
					result = adminManag.editAdmin(profil_a_modifier, null);

				if (result == 1) {
					session.removeAttribute("profil_a_modifier");
					if (profil_a_modifier.getIdadmin() == a.getIdadmin())
						session.setAttribute("admin", profil_a_modifier);

					response.sendRedirect(response.encodeRedirectURL("admin.jsp"));
				}
				else if(result == 2){ 
					session.setAttribute("okAd", 2);
					response.sendRedirect(response.encodeRedirectURL("admin.jsp?id=25#contenu"));
				}

			}
			else { //cas où le login et le mot de passe ne sont pas renseignés
				session.setAttribute("okAd", 0);
				response.sendRedirect(response.encodeRedirectURL("admin.jsp?id=25#contenu"));
			}

		}
		else {
			response.sendRedirect(response.encodeRedirectURL("admin.jsp"));
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

}
