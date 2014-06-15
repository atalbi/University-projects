package mdb;

import java.io.UnsupportedEncodingException;
import java.util.Properties;

import javax.ejb.MessageDriven;
import javax.ejb.ActivationConfigProperty;
import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.MessageListener;
import javax.jms.ObjectMessage;
import javax.mail.MessagingException;
import javax.mail.NoSuchProviderException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.MimeMessage;
import javax.naming.NamingException;

import messages.MessageConfInsSoc;
import messages.MessageDecision;
import messages.MessageMdb;

import entity.Candidat;
import entity.Candidature;
import entity.Offre;
import entity.Societe;

@MessageDriven(mappedName = "mailbox", activationConfig = {
		@ActivationConfigProperty(propertyName = "destinationType", propertyValue = "javax.jms.Queue"),
		@ActivationConfigProperty(propertyName = "destination", propertyValue = "queue/testQueue") })
public class MailBox implements MessageListener {

	public MailBox() {
	}

	public void onMessage(Message msg) {

		try {

			Candidat candidat;
			Candidature candidature;
			Societe societe;
			Offre offre;
			ObjectMessage lemessage = (ObjectMessage) msg;
			MessageMdb mgd = (MessageMdb) lemessage.getObject();
			if (mgd.getId() == 2) {
				System.out.println("mailbox condition");
				candidat = ((MessageDecision) mgd).getCandidat();
				candidature = ((MessageDecision) mgd).getCandidature();
				societe = ((MessageDecision) mgd).getSociete();
				sendMsg(candidat, candidature, societe);
			}
			if (mgd.getId() == 1) {
				System.out.println("mailbox condition");
				societe = ((MessageConfInsSoc) mgd).getSociete();
				sendMsg(societe);
			}
			
		} catch (NoSuchProviderException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (MessagingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JMSException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	protected void sendMsg(Candidat candidat, Candidature candidature,
			Societe societe) throws MessagingException, NamingException,
			UnsupportedEncodingException {

		try {
			MimeMessage message;

			Session sessionMail;

			String host = "smtp.gmail.com";
			Properties prop = new Properties();
			
	        prop.setProperty( "java.naming.factory.initial","org.jnp.interfaces.NamingContextFactory" );
	        prop.setProperty( "java.naming.provider.url", "127.0.0.1:1099" );
	        prop.setProperty( "java.naming.factory.url.pkgs", "org.jboss.naming" );
			
			prop.setProperty("mail.host", "smtp.gmail.com");
			prop.put("mail.smtp.auth", "true");
			prop.put("mail.smtp.port", 587);
			prop.put("mail.smtp.starttls.enable", "true");

			sessionMail = Session.getInstance(prop, null);
			message = new MimeMessage(sessionMail);

			Transport transport = sessionMail.getTransport("smtp");
			transport.connect(host, "portail.recrutement@gmail.com",
					"portail+90");

			message.setSubject("Bonjour " + candidat.getNom());
			message.setRecipients(javax.mail.Message.RecipientType.TO,
					javax.mail.internet.InternetAddress.parse(candidat
							.getEmail(), false));

			String body = "Bonjour " + candidat.getNom() + "\n\n"
					+ " Vous avez postuler le "
					+ candidature.getDate().getDay() + "/"
					+ candidature.getDate().getMonth() + "/"
					+ candidature.getDate().getYear() + " pour le poste de : "
					+ candidature.getIdoffre().getTitreOffre()
					+ ".\n l'entreprise " + societe.getRaisonSocial()
					+ " a rendu sa decison : ";

			if (candidature.getDecision().equalsIgnoreCase("accepted"))
				body += "Felicitation vous etes accepté !!!!!!!!!!!!";
			else if (candidature.getDecision().equalsIgnoreCase("refused"))
				body += "Malgré tout l'interet de votre dossier, votre candidature n'a pas être retenue.";
			body += "\n\n Equipe Portail Recrutement.";
			message.setText(body);
			message.saveChanges();
			transport = sessionMail.getTransport("smtp");
			;
			transport.connect(host, "portail.recrutement@gmail.com",
					"portail+90");

			transport.sendMessage(message, message.getAllRecipients());
			transport.close();
			System.out.println("envoi without prob");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	protected void sendMsg(Societe societe) throws MessagingException, NamingException,
			UnsupportedEncodingException {

		try {
			MimeMessage message;

			Session sessionMail;

			String host = "smtp.gmail.com";
			Properties prop = System.getProperties();
			prop.setProperty("mail.host", "smtp.gmail.com");
			prop.put("mail.smtp.auth", "true");
			prop.put("mail.smtp.port", 587);
			prop.put("mail.smtp.starttls.enable", "true");

			sessionMail = Session.getInstance(prop, null);
			message = new MimeMessage(sessionMail);

			Transport transport = sessionMail.getTransport("smtp");
			transport.connect(host, "portail.recrutement@gmail.com",
					"portail+90");

			message.setSubject("Bonjour " + societe.getRaisonSocial());
			message.setRecipients(javax.mail.Message.RecipientType.TO,
					javax.mail.internet.InternetAddress.parse(societe.getLogin(), false));

			String body = "Bonjour " + societe.getRaisonSocial()+ ". \n"
			 + "Vous recevez cette email pour confirmer votre inscription au portail de recrutement.\n\n" +
			 "veuillez gardez confidentiel vos identifiants de connexion : \n" +
			 "Login : " + societe.getLogin() + "\n" +
			 "Password : " + societe.getPassword() + "\n\n" +
			 "Equipe portail recrutement";
			
			message.setText(body);
			message.saveChanges();
			transport = sessionMail.getTransport("smtp");
			;
			transport.connect(host, "portail.recrutement@gmail.com",
					"portail+90");

			transport.sendMessage(message, message.getAllRecipients());
			transport.close();
			System.out.println("envoi without prob");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
