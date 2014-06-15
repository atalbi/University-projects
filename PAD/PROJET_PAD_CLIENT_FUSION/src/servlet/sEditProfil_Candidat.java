package servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.ejb.EJB;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import admin.session.FormationManager;

import candidat.session.CandidatManager;
import entity.Admin;
import entity.Candidat;
import entity.Formation;

/**
 * Servlet implementation class sEditProfil_Candidat
 */
public class sEditProfil_Candidat extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@EJB(mappedName = "CandidatManager")
	CandidatManager candidatManag;

	@EJB(mappedName = "FormationManager")
	FormationManager formManag;
	static String _jbossHome = System.getenv("JBOSS_HOME");
	static String file_separator = System.getProperty("file.separator");
	static String _jbossDefault = _jbossHome + file_separator 
	+ "server" + file_separator
	+ "default" + file_separator;

	private static final String TMP_DIR_PATH = _jbossDefault+file_separator+"cv_tmp";
	private File tmpDir;
	private static final String DESTINATION_DIR_PATH = _jbossDefault+file_separator+"cv_candidat";
	private File destinationDir;

	public sEditProfil_Candidat() {
		super();
	}

	public void init() throws ServletException {
		tmpDir = new File(TMP_DIR_PATH);
		if (!tmpDir.isDirectory()) {
			try {
				// Create one directory
				boolean success = ( new File(TMP_DIR_PATH)).mkdir();
				if (!success) {
					tmpDir = new File(TMP_DIR_PATH);
					System.out.println( "Directory: " + TMP_DIR_PATH + " created" ) ;
				}
			} catch (Exception e){
				System.err.println( "Error: " + e.getMessage());
			} 
		}
		String realPath = getServletContext().getRealPath(DESTINATION_DIR_PATH);
		destinationDir = new File(realPath);
		if (!destinationDir.isDirectory()) {
			try {
				// Create one directory
				boolean success = ( new File(DESTINATION_DIR_PATH)).mkdir();
				if (!success) {
					destinationDir = new File(realPath);
					System.out.println( "Directory: " + DESTINATION_DIR_PATH + " created" ) ;
				}
			} catch (Exception e){
				System.err.println( "Error: " + e.getMessage());
			} 
		}

	}

	protected void processRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		Candidat c = null;
		HttpSession session = request.getSession();
		String valide=null, nom = null, prenom = null,
		email = null, password = null, srcEdit = null,
		cv = null, observ = null, etude = null, 
		tel = null, form = null, idCandidat = null;
		Formation f;

		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		if (!isMultipart) {
		} else {

			FileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(factory);
			List items = null;
			try {
				items = upload.parseRequest(request);
			} catch (FileUploadException e) {
				e.printStackTrace();
			}
			Iterator itr = items.iterator();
			while (itr.hasNext()) {
				FileItem item = (FileItem) itr.next();
				if (item.isFormField()) {
					String name = item.getFieldName();
					String value = item.getString();
					if (name.equals("nomCandid")) {
						nom = value;
					}
					if (name.equals("prenomCandid")) {
						prenom = value;
					}
					if (name.equals("emailCandid")) {
						email = value;
					}
					if (name.equals("passwordCandid")) {
						password = value;
					}

					if (name.equals("srcEdit")) {
						srcEdit = value;
					}
					if (name.equals("observCandid")) {
						observ = value;
					}
					if (name.equals("telCandid")) {
						tel = value;
					}
					if (name.equals("formationCandid")) {
						form = value;
					}
					if (name.equals("validCandid")) {
						valide = value;
					}
					if (name.equals("idCandidat")) {
						idCandidat = value;
					}

				} else {
					try {

						String itemName = item.getName();
						cv = DESTINATION_DIR_PATH+file_separator+"cv_"+nom+"_"+prenom+itemName.substring(itemName.length()-4, itemName.length());
						File savedFile = new File(cv);
						item.write(savedFile);

					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			}
		}

		f = formManag.rechercherFormation(Integer.parseInt(form));

		if (srcEdit!=null && srcEdit.equals("1")) { // cas d'une modif
			// par le candidat
			c = (Candidat) session.getAttribute("candidat");
			if (nom != null && prenom != null && password != null && f != null
					&& !nom.equals("") && !prenom.equals("")
					&& !email.equals("") && !password.equals("")) {
				if (c != null) {

					if (cv != null && cv.length() > 10) {
						c.setCv(cv);
					}
					c.setEmail(email);
					c.setIdformation(f);
					c.setNiveauEtudes(etude);
					c.setNom(nom);
					c.setPrenom(prenom);
					c.setTel(tel);
					c.setObservation(observ);
					int result = -1;
					if (!c.getPassword().equals(password))
						result = candidatManag.editCandidat(c, password);
					else
						result = candidatManag.editCandidat(c, null);
					if (result == 1) {

						session.setAttribute("candidat", candidatManag.rechercherCandidat(c.getIdcandidat()));
						response.sendRedirect(response
								.encodeRedirectURL("index.jsp?id=5#contenu"));
					} else {
						session.setAttribute("ok", 10);
						response.sendRedirect(response.encodeRedirectURL("index.jsp?id=19#contenu"));
					}
				}
			} else {
				session.setAttribute("ok", 9);
				response.sendRedirect(response.encodeRedirectURL("index.jsp?id=19#contenu"));
			}
		}
		// /////////////
		else if (srcEdit.equals("2")) { // cas d'une
			// modification
			// par l'admin
			Admin adm = null;
			adm = (Admin) session.getAttribute("admin");
			if (adm != null) {
				c = (Candidat) candidatManag.rechercherCandidat(Integer.parseInt(idCandidat));
				if (c != null) {
					if (nom != null && prenom != null && password != null && f != null
							&& !nom.equals("") && !prenom.equals("")
							&& !email.equals("") && !password.equals("")) {
						if (cv != null && cv.length() > 10) {
							c.setCv(cv);
						}
						c.setEmail(email);
						c.setIdformation(f);
						c.setNiveauEtudes(etude);
						c.setNom(nom);
						c.setPrenom(prenom);
						c.setTel(tel);
						c.setObservation(observ);
						c.setValide(Integer.parseInt(valide));

						int result = -1;
						if (!c.getPassword().equals(password))
							result = candidatManag.editCandidat(c, password);
						else
							result = candidatManag.editCandidat(c, null);

						if (result == 1) {
							response.sendRedirect(response.encodeRedirectURL("admin.jsp?id=53&tri=df&ord=DESC&min=1#contenu"));
						} else {
							session.setAttribute("okAd", 22);
							response.sendRedirect(response.encodeRedirectURL("admin.jsp?id=25#contenu"));
						}
					} else {
						session.setAttribute("okAd", 21);
						response.sendRedirect(response
								.encodeRedirectURL("admin.jsp?id=25#contenu"));
					}
				} else {
					session.setAttribute("okAd", 20);
					response.sendRedirect(response
							.encodeRedirectURL("admin.jsp?id=25#contenu"));
				}
			} else {
				response.sendRedirect(response.encodeRedirectURL("admin.jsp"));
			}
		}

	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

}
