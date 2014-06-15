package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entity.Admin;

/**
 * Servlet implementation class sDeconnecterAdmin
 */
public class sDeconnecterAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public sDeconnecterAdmin() {
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
	    Admin a = null;	
		 HttpSession session=request.getSession();
			a = (Admin) session.getAttribute("admin");
			
			if (a != null) {
				session.removeAttribute("admin");
			}
			response.sendRedirect(response.encodeRedirectURL("admin.jsp"));
	 }
}
