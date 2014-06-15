package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entity.Candidat;

/**
 * Servlet implementation class sDeconnecterCandidat
 */
public class sDeconnecterCandidat extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public sDeconnecterCandidat() {
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
			c = (Candidat) session.getAttribute("candidat");
			
			if (c != null) {
				session.removeAttribute("candidat");
			}
			response.sendRedirect(response.encodeRedirectURL("index.jsp"));
	 }
}
