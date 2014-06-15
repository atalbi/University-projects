#include "protocolArbitre.h"

#ifndef processusJoueur
#define processusJoueur

#define PORT_MOTEUR 7778
#define PREMIER 1
typedef struct _JoueurHive JoueurHive;

struct _JoueurHive {
	int	ident,
		portArbitre,
		sock_Adverse,
		sockEcout_Adverse,
		sock_Arbitre,
		prochainTourJeu;
		
	short	port,
			noPortAdv;
	
	TypBooleen	finPartie,
				premierTourJeu;
		
	char machine[TAIL_CHAIN],
		 machineArbitre[TAIL_CHAIN],
		 nomMachineAdv[TAIL_CHAIN];
		
};


void formatCoupRecuDuMoteur(TypCoupReq *reqCoup, char *chaine);

int getDirection(char* direction);

TypPiece getPiece(char *piece);

TypPropCoup getTypCoup(char type);

char switchTypCoup(TypPropCoup type);

char* switchPiece(TypPiece *piece);

char* switchDirection(TypDirection *direction);

void switchArbitre (JoueurHive *joueur, TypCoupReq *reqCoup, TypCoupRep *respCoup);

void switchPartie (TypErreur err);

void switchIdent(JoueurHive *joueur, TypIdentificationRep *respIdent);

void jouer_coup (JoueurHive *joueur);

#endif
