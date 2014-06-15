/**************************************
 *
 * Programme : protocolArbitre.h
 *
 * Synopsis : entete du protocole d'acces à l'arbitre
 *            pour Hive
 *
 * Ecrit par : LP, 9 / 03 / 10
 * 
/***************************************/

#ifndef _protocolArbitre_h
#define _protocolArbitre_h

/* Taille des chaines */
#define TAIL_CHAIN 30

/* Identificateurs des requetes */
typedef enum { IDENTIFICATION, PARTIE, COUP, COUP_ADVERS } TypIdRequest;

/* Types d'erreur */
typedef enum { OK,             /* Validation de la requete */
	       ERR_NOM,        /* Nom inconnu */
	       ERR_JOUEUR,     /* Identificateur de joueur inconnu */
	       ERR_COUP,       /* Erreur sur le coup joue */
	       ERR_TYP         /* Erreur sur le type de requete */
} TypErreur;

/* 
 * Structures d'identification 
 */
typedef struct {

  TypIdRequest idRequest;         /* Identificateur de la requete */
  char nom[TAIL_CHAIN];           /* Nom du joueur */
  char nomMachine [TAIL_CHAIN];   /* Nom de la machine du joueur */
  short noPort;                   /* Numero de port du joueur */

} TypIdentificationReq;

typedef struct{

  TypErreur err;                  /* Code d'erreur */
  int joueur;                     /* Identificateur du joueur */

} TypIdentificationRep;

/* 
 * Structures demande de partie
 */
typedef enum { FAUX, VRAI } TypBooleen;

typedef struct{

  TypIdRequest idRequest;         /* Identificateur de la requete */
  int joueur;                     /* Identificateur du joueur */

} TypPartieReq;

typedef struct {

  TypErreur err;                  /* Code d'erreur */
  int adversaire;                 /* Identificateur de l'adversaire */
  char nomMachineAdv[TAIL_CHAIN]; /* Nom machine de l'adversaire */
  short noPortAdv;                /* Numero de port de l'aversaire */
  TypBooleen finTournoi;          /* Indicateur de fin */
  TypBooleen premier;             /* Pour savoir qui debute la partie */

} TypPartieRep;

/*
 * Definition d'une direction autour d'une pièce
 */
typedef enum { n, ne, se, s, so, no } TypDirection;

/* 
 * Type des pieces 
 */
typedef enum { AB1N, // Reine noire
	       AR1N, // Araignées noires
	       AR2N, 
	       FO1N, // Fourmis noires
	       FO2N, 
	       FO3N, 
	       SA1N, // Sautrelles noires
	       SA2N,
	       SA3N,
	       SC1N, // Scarabees noirs
	       SC2N, 
	       AB1B, // Reine blanche
	       AR1B, // Araignées blanches
	       AR2B, 
	       FO1B, // Fourmis blanches
	       FO2B, 
	       FO3B, 
	       SA1B, // Sautrelles blanches
	       SA2B,
	       SA3B,
	       SC1B, // Scarabees blancs
	       SC2B,
	       MPTY // Aucune piece pour les voisins
} TypPiece;

/* 
 * positionnement d'une piece
 */
typedef struct {

  TypPiece     piece;
  TypDirection direction;

} TypPosition ;

/* 
 * Structures coup du joueur pour l'arbitre et adversaire
 * et de l'adversaire pour l'arbitre
 */

/* Propriete des coups */
typedef enum { POSE, DEPLACE, BLOQUE, ENCERCLE, NULLE } TypPropCoup;

typedef struct {

  TypIdRequest idRequest;  /* Identificateur de la requete */
  TypPropCoup  propCoup;   /* Propriete du coup */
  TypPiece     piece;      /* Piece jouee */
  TypPosition  posePiece;  /* Position de la piece donnee */

} TypCoupReq;

/* Validite du coup */
typedef enum { VALID, TIMEOUT, TRICHE } TypValCoup;

/* Reponse a un coup */
typedef struct {

  TypErreur err;                  /* Code d'erreur */
  TypValCoup validCoup;           /* Validite du coup */

} TypCoupRep;

#endif
