import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Vector;

import se.sics.jasper.*;

public class Moteur {
	static Socket sock;
	static SICStus sp;
	static String couleurAdv = "non-defini", couleurJoueur;
	static String dernierCoupAdv;
	static String plateauJeuTmp = "";
	static String plateauJeuEncours = "[]";
	static String commandeAdv = "";

	static String requestProlog1(SICStus sp, String commande) {
		System.out.println("--------Entree RequestCoup prolog");
		String retour = new String("");
		HashMap listResults = new HashMap();

		try {

			Query qu = sp.openQuery(commande, listResults);

			// parcours des solutions
			boolean moreSols = qu.nextSolution();

			// on ne boucle que si la liste des instanciations de variables est
			// non vide
			boolean continuer = !(listResults.isEmpty());
			
			retour += "["+listResults.get("TypCoup").toString(); 
			retour += ","+listResults.get("PieceJ").toString();
			retour += "," + listResults.get("PieceP").toString(); 
			retour += "," + listResults.get("Direc").toString() + "]\0";
			plateauJeuTmp = formatPlateau(listResults.get("Plateau").toString());
			System.out.println("--------Resultat prolog " + retour);
			System.out.println("--------Valeur du plateau tampon "+plateauJeuTmp+"\n");
			qu.close();
			
		} catch (SPException e) {
			
			System.err.println("Exception prolog\n" + e);
			
		}

		// autres exceptions levées par l'utilisation du Query.nextSolution()
		catch (Exception e) {
			System.err.println("Other exception : " + e);
		}

		return retour;
	}

	static String requestProlog2(SICStus sp, String commande) {

		System.out.println("--------Entree RequestIntegrationCoup prolog");
		String retour = new String("");
		HashMap listResults = new HashMap();

		try {

			//Query qu = sp.openQuery(commande, listResults);
			Query qu = sp.openQuery(commande, listResults);
			// parcours des solutions
			boolean moreSols = qu.nextSolution();

			// on ne boucle que si la liste des instanciations de variables est
			// non vide
			boolean continuer = !(listResults.isEmpty());
			
			retour = formatPlateau(listResults.get("Plateau").toString());
			qu.close();
			
		} catch (SPException e) {
			
			System.err.println("Moteur IA : Exception prolog\n" + e);
			
		}

		// autres exceptions levées par l'utilisation du Query.nextSolution()
		catch (Exception e) {
			
			System.err.println("Moteur IA : Other exception : " + e);
			
		}

		return retour;
	}

	
	
	static void execute() {

		int taille = 0;
		byte[] data = null;
		String resultat = " ";
		String req = "";
		InputStream is = null;

		System.out.println("Moteur IA : JOUEUR "+couleurJoueur);
		try {
			is = sock.getInputStream();
			data = new byte[20];

			// reception de la requete du processusJoueur C
			taille = is.read(data);
			for (int i = 0; i <= taille; i++) {
				req += (char) data[i];
			}
		} catch (IOException e) {

		}
		
		
		if (req.startsWith("INIT")) {
			
			plateauJeuEncours = "[]";
			plateauJeuTmp = "";
			System.out
					.println("Moteur IA : Initialisation du plateau de jeu");

		}
		
		// Cas d'une demande de coup
		else if (req.startsWith("REQ_COUP")) {
			
			System.out.println("Moteur IA : Etat du plateau de jeu "+plateauJeuEncours);
			System.out.println("\nMoteur IA : Demande de coup de la part du joueur ");

			// on formule la requete vers le moteur Prolog et on obtient une reponse

			if (couleurAdv.equals("non-defini")) {
				couleurAdv = "noir";
				couleurJoueur = "blanc";
			}

			resultat = requestProlog1(sp, "hive("+plateauJeuEncours+"," + couleurJoueur	+ ",Plateau,PieceJ,PieceP,Direc,TypCoup).");

			// renvoi de la reponse de prolog au processuJoueur C
			if (!resultat.equals(" ")) {

				PrintWriter pw;
				try {
					
					pw = new PrintWriter(sock.getOutputStream(), true);
					pw.println(resultat);
					pw.close();
					
				} catch (IOException e) {
					e.printStackTrace();
				}

				System.out.println("Moteur IA : Coup envoye au ProcessusJoueur C "+resultat); //TODO a desactiver
			}

			else
				System.out
						.println("Erreur moteur IA: aucun coup recupere a partir de Prolog");
			
		}

		// on integre le dernier coup genere par le moteur, au plateau de jeu
		else if (req.startsWith("OK_COUP")) {
			
			plateauJeuEncours = plateauJeuTmp;
			plateauJeuTmp = "";
			System.out
					.println("Moteur IA : Le dernier coup genere par le moteur a integre avec succes au plateau");

			System.out.println("Moteur IA : Etat du plateau de jeu "+plateauJeuEncours);
		}
		// on integre le coup de l'adversaire dans le plateau
		else if (req.startsWith("OK_ADV")) {
			
			if (!commandeAdv.equals("")) {

				resultat = requestProlog2(sp, commandeAdv);
				commandeAdv = "";
				
				if (resultat.length() < 14) {
					
					System.out
							.println("Erreur Moteur IA : Coup de l'adversaire non integré !\n");
					System.out.println("Moteur IA : Detail Coup "+req + "\n");
					
				} else {
					
					plateauJeuEncours = resultat;
					System.out
							.println("Moteur IA : Coup de l'adversaire bien integre dans le plateau");
					System.out.println("Moteur IA : Etat du plateau de jeu "+plateauJeuEncours);

				}

			} else
				System.out
						.println("Erreur Moteur IA : erreur d'integration du dernier coup de l'adversaire");
		}

		// cas ou on est suppose avoir recu le coup de l'adversaire a integrer
		// dans le jeu
		else {
			System.out.println("Moteur IA : Chaine brute recu du processusJoueur C: '"
					+ req+"'\n");
			// on reconstitue les arguments a passer au predicat a partir du
			// coup de l'adversaire
			String pieceJ, pieceRef, direc, typCoup;
			if (req.length() >= 17) {
				
				typCoup = req.substring(1, 2);
				pieceJ = req.substring(3, 7);
				pieceRef = req.substring(8, 12);
				direc = req.substring(13, 15);

				/*System.out.println("TypeCoupAdvers=" + typCoup + "\n");
				System.out.println("PieceJoueeAdvers=" + pieceJ + "\n");
				System.out.println("PieceRefAdvers=" + pieceRef + "\n");
				System.out.println("Direct Advers=" + direc + "\n");*/

				if (couleurAdv.equals("non-defini")) {

					if (pieceJ.endsWith("b")) {
						couleurAdv = "blanc";
						couleurJoueur = "noir";
					}

					else if (pieceJ.endsWith("n")) {
						couleurAdv = "noir";
						couleurJoueur = "blanc";
					}

				}

				if (typCoup.startsWith("e"))
					typCoup = "e";
				else if (typCoup.startsWith("p"))
					typCoup = "p";
				else if (typCoup.startsWith("d"))
					typCoup = "d";
				else if (typCoup.startsWith("b"))
					typCoup = "b";

				if (direc.equals("nd"))
					direc = "nd";
				else if (direc.equals("sd"))
					direc = "sd";
				else if (direc.equals("ne"))
					direc = "ne";
				else if (direc.equals("se"))
					direc = "se";
				else if (direc.equals("no"))
					direc = "no";
				else if (direc.equals("so"))
					direc = "so";

				// on prepare la commande a executer en attendant la validation
				// de l'arbitre
				
				commandeAdv = new String("recevoirAdversaire("+plateauJeuEncours+","+couleurAdv+",Plateau," + pieceJ + ","
						+ pieceRef+","+direc+","+typCoup+").");
				//System.out.println("cde = "+commandeAdv);
				System.out.println("Moteur IA : Mise en attente du coup adverse recu ["+pieceJ + ","
						+ pieceRef+","+direc+","+typCoup+"]\n");
				
				
			} else
				
				System.out.println("Erreur Moteur IA : Coup adversaire recu incorrect "
						+ req.length());
		}
		
		try {
			is.close();
			sock.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		

	}

	private static String formatPlateau(String brut) {
		
		String retour;
		retour = brut.replaceAll("\\)", "");
		retour = retour.replaceAll("\\.\\(", "");
		retour = retour.replaceAll(",\\[\\]", "\\]");
		retour = "[["+retour;
		retour = retour.replaceAll("\\],", "],[");
		retour.trim();
		System.out.println("formatte =" +retour);
		return retour;
		
	}
	
	
	public static void main(String[] arg) {
		int port = 7778;
		ServerSocket serv = null;
		sp = null;
		try {

			sp = new SICStus();
			sp.load("./hive.pl");

		} catch (SPException e2) {
			System.out.println("Erreur SICStus: " + e2);
			e2.printStackTrace();
			System.exit(0);
		}

		try {
			serv = new ServerSocket(port);
			System.out.println("serveur pret");
			System.out.println("7778");
			while (true) {

				sock = serv.accept();
				System.out.println("\n*******************Connection processusJoueur C************************");
				execute();

			}

		} catch (IOException e) {
			if (serv != null) {
				try {
					serv.close();
				} catch (IOException e1) {
					e1.printStackTrace();
				}
			}
		}
	}

}
