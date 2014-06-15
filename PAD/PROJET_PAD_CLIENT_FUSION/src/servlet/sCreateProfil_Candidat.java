package servlet;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.ejb.EJB;
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
import entity.Candidat;
import entity.Formation;

/**
 * Servlet implementation class sCreateProfil_Candidat
 */
public class sCreateProfil_Candidat extends HttpServlet {
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
	

	public sCreateProfil_Candidat() {
		super();
		// TODO Auto-generated constructor stub
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
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		HttpSession session = request.getSession();
		String valide=null, nom = null, prenom = null,
		email = null, password = null, srcCreate = null,
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

					if (name.equals("srcCreate")) {
						srcCreate = value;
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
			

			Candidat c = new Candidat();
			c.setCv(cv);
			c.setEmail(email);
			c.setIdformation(formManag.rechercherFormation(Integer.parseInt(form)));
			c.setNiveauEtudes(etude);
			c.setNom(nom);
			c.setPassword(password);
			c.setPrenom(prenom);
			c.setTel(tel);
			c.setObservation(observ);

			if (srcCreate.equals("1")) { //cas d'une creation par le candidat

				if (nom != null && prenom != null && password != null && f != null
						&& !nom.equals("") && !prenom.equals("")
						&& !email.equals("") && !password.equals("")) {

					int result = candidatManag.creerCandidat(c);
					//retourne 	1 si ok
					//			2 si email deja existent
					//			0 si candidat deja existent
					if (result == 1){
						session.setAttribute("ok", 1);
						response.sendRedirect(response.encodeRedirectURL("index.jsp?id=15"));
					}
					else if (result == 2){
						session.setAttribute("ok", 2);
						response.sendRedirect(response.encodeRedirectURL("index.jsp?id=15#contenu"));
					}
					else if (result == 0){
						session.setAttribute("ok", 3);
						response.sendRedirect(response.encodeRedirectURL("index.jsp?id=15#contenu"));
					}

				}
				else { //cas où tous les champs n'ont pas été remplis par le candidat
					session.setAttribute("ok", 0);
					response.sendRedirect(response.encodeRedirectURL("index.jsp?id=15#contenu"));
				}

			}
			else if (srcCreate.equals("2")) { //cas d'une creation  par l'admin

				if (nom != null && prenom != null && password != null && f != null
						&& !nom.equals("") && !prenom.equals("")
						&& !email.equals("") && !password.equals("")) {

					int result = candidatManag.creerCandidat(c);
					//retourne 	1 si ok
					//			2 si email deja existent
					//			0 si candidat deja existent
					if (result == 1){
						response.sendRedirect(response.encodeRedirectURL("admin.jsp?id=53&tri=df&ord=DESC&min=1#contenu"));
					}
					else if (result == 2){
						session.setAttribute("okAd", 22);
						response.sendRedirect(response.encodeRedirectURL("admin.jsp?id=25#contenu"));
					}
					else if (result == 0){
						session.setAttribute("okAd", 23);
						response.sendRedirect(response.encodeRedirectURL("admin.jsp?id=25#contenu"));
					}

				}
				else { //cas où tous les champs n'ont pas été remplis
					session.setAttribute("okAd", 21);
					response.sendRedirect(response.encodeRedirectURL("admin.jsp?id=25#contenu"));
				}


			}

	}
}
