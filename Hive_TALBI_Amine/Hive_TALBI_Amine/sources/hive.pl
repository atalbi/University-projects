%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%% Programme PROLOG d'un joueur de Hive
%%% 
%%% Date : 2010/05/08
%%%
%%% Auteur : TALBI Amine, FAGNINOU Hugues
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%% Librairie de listes et Predicat du TP1 utilisé %%%%%%%%%%%%%%%%%%%

:- ensure_loaded(library(lists)).

ajout_debut(X,L,[X|L]).

ajout_fin(X,[],[X]).
ajout_fin(X,[Y|L1],[Y|L2]):-ajout_fin(X,L1,L2).


longueur([], 0).
longueur([A | S], N) :- longueur(S, P), N is P+1.

% nombre d'occurence de X dans N
occurrence([],_,0).
occurrence([X|L],X,N) :- occurrence(L,X,N1),N is N1+1.
occurrence([Y|L],X,N) :- X\==Y,occurrence(L,X,N).

premier(X,[X|_]).

dernier(X,[X]).
dernier(X,[_Y|L1]).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% cout1(Liste, Joueur, Cout1)/3
% Liste   : le plateau de jeu
% Joueur  : couleur du joueur
% Cout1   : nombre de piece autour de la reine du Joueur
% Renvoi 0, si la reine du Joueur n'est pas encore posée
cout1(Liste,Joueur,Cout1):- 	member(P,[ab1b,ab1n]),
								pieceDuJoueur(P,Joueur),
								coordonnes(Liste,P,[P,X,Y,Z]),!,
								voisin([X,Y,Z],Liste,[],R),
								longueur(R, Cout1).
cout1(Liste,Joueur,0).										
								

% cout2(Liste, Joueur, Cout1)/3
% Liste   : le plateau de jeu
% Joueur  : couleur du joueur
% Cout1   : nombre de piece autour de la reine du Joueur adverse
% Renvoi 0, si la reine du Joueur adverse n'est pas encore posée								
cout2(Liste,Joueur,Cout2):- 	member(P,[ab1b,ab1n]),
								\+pieceDuJoueur(P,Joueur),
								coordonnes(Liste,P,[P,X,Y,Z]),!,
								voisin([X,Y,Z],Liste,[],R),
								longueur(R, Cout2).
cout2(Liste,Joueur,0).								


% rucheCasser(Liste, Acc1, Acc2)/3
% Liste   : le plateau de jeu
% Acc1    : La liste des pieces avec les voisins non exploité
% Acc2    : La liste des pieces avec les voisins exploité
% le predicat reussie si le nombre de pieces visitées à partir de
% la premiére liste du plateau est = nombre de pieces dans le plateau de jeu								
rucheCasser([[P,X,Y,Z]|Liste],_,_):-	verifEmpil(Liste,[X,Y,Z]),!.
rucheCasser(Liste,Acc1,Acc2):-  		premier([E,X,Y,Z],Liste),
										voisin([X,Y,Z],Liste,[],R),																	  	
								  		rucheCasser(Liste,R,[[X,Y,0]],Res),
									  	longueur(Res, R1),
									  	nbrPieceNoEmpil(Liste,0,R2),		  	
									  	R1=:=R2.
									  									  								  	
% rucheCasser(Liste, Acc1, Acc2,Res)/4
% Liste   : le plateau de jeu
% Acc1    : La liste des pieces avec les voisins non exploité
% Acc2    : La liste des pieces avec les voisins exploité
% Res	  : Liste de tous les pieces visitées
% parcours en profondeur de notre plateau de jeu
rucheCasser(Liste,[],Acc2,Acc2).		
rucheCasser(Liste,[E|Acc1],Acc2,Res):- 	voisin(E,Liste,[],R),
										subtract(R, Acc2,Rest),										
									   	union(Acc1,Rest,RAcc1),
									   	rucheCasser(Liste,RAcc1,[E|Acc2],Res).

% voisin(Piece, Liste, Acc, R)/4
% Piece   : Coordonnée de la piéce dans le plateau dont on veut chercher les voisins
% Liste   : Le plateau de jeu
% Acc     : accumulateur pour stocker l'accumulation des voisins
% R 	  : Liste de tous voisins de la piece Piece
% retourne tous les pieces autour de la piece de coordonee [X1,Y1,Z1]
voisin([X1,Y1,Z1],Liste,Acc,R):-     
									  choisirDirection1(Liste,[X1,Y1],[X,Y,0],D),
									   \+member([X,Y,0],Acc),
									   occupe(Liste,[X,Y]),!,
									   voisin([X1,Y1,Z1],Liste,[[X,Y,0]|Acc],R).									   
voisin(_,Liste,Acc,Acc).


% verifEmpil(Liste, Coord)/2
% Liste   : Le plateau de jeu
% Coord   : coordonne de la piece en dessous
% reussit si les pieces dans le plateau sont empiler
% au dessus d'une seul piéce
verifEmpil([[P,X,Y,Z1]|Liste],[X,Y,Z2]):-verifEmpil(Liste,[X,Y,Z2]).
verifEmpil([],_).


% nbrPieceNoEmpil(Liste, C1, C2)/3
% Liste   : Le plateau de jeu
% C1      : compteur de piece empiler
% C2      : nbre de piece empiler dans tous le plateau de jeu
nbrPieceNoEmpil([],C1,C1).
nbrPieceNoEmpil([[P,X,Y,0]|Liste],C1,C2):-	C is C1+1,
											nbrPieceNoEmpil(Liste,C,C2).
nbrPieceNoEmpil([[P,X,Y,1]|Liste],C1,C2):-	nbrPieceNoEmpil(Liste,C1,C2).

%% Definition des pieces noirs et des pieces Blanche
pieceNoire([sc1n,ab1n,ar1n,ar2n,fo1n,fo2n,fo3n,sa1n,sa2n,sa3n,sc2n]).
pieceBlanche([ab1b,ar1b,ar2b,fo1b,fo2b,fo3b,sa1b,sa2b,sa3b,sc1b,sc2b]).

%% Definition des 6 directions possible pour deplacer une piéce
direction([n,ne,se,s,so,no]).


%% Predicats pour verifier la couleur de la piece             
estNoire(X):- pieceNoire(M1),
              member(X,M1).
            
estBlanche(X):-pieceBlanche(M2),
              member(X,M2).            
                       
%% Verifie que la PieceJ est bien celle du Joueur
pieceDuJoueur(PieceJ,noir):-estNoire(PieceJ).
pieceDuJoueur(PieceJ,blanc):-estBlanche(PieceJ).

% retirerPiece(Liste1,PieceJ,Liste2)/3
% Liste1   : Le plateau de jeu avant de retirer la piéce
% PieceJ   : L'identifiant de la piéce à retirer
% Liste2   : Le plateau de jeu aprés avoir retirer la piéce
% retire la piece si elle existe et change rien si elle n'existe pas
retirerPiece(Liste1,PieceJ,Liste2):-	coordonnesDiff(Liste1,PieceJ,_,Liste2).
retirerPiece(Liste1,PieceJ,Liste1):-	\+coordonnesDiff(Liste1,PieceJ,_,_).


% parcoursSuivant(Liste,Joueur,Temp,Acc,R)/5
% Liste   : Le plateau de jeu
% Joueur  : la couleur du joueur Joueur
% Temp    : le meilleur coup à jouer jusqu'a l'itération courante
% Acc     :	accumulateur de tous les coups possible à jouer
% R       :	le meilleur coup à jouer parmi tous les coups possible
% appel l'heuristique pour chosir entre le coup courant avec le meilleur jusqu'à
% l'itération courante
parcoursSuivant(Liste,Joueur,[],Acc,R):-	deplacer(Liste,Joueur,PieceJ,Res,Cout),
											parcoursSuivant(Liste,Joueur,[Cout,PieceJ,Res],[[Cout,PieceJ,Res]],R).								
parcoursSuivant(Liste,Joueur,Temp,Acc,R):-	deplacer(Liste,Joueur,PieceJ,Res,Cout),
											\+member([Cout,PieceJ,Res],Acc),!,
											heuristique([Cout,PieceJ,Res],Temp,Temp2),											
											parcoursSuivant(Liste,Joueur,Temp2,[[Cout,PieceJ,Res]|Acc],R).										
parcoursSuivant(_,Joueur,Temp,Acc,Temp).


% heuristique(Cout1,Cout2,MeilleurCoup)/3
% Coup1           : Le coup courant à comparer
% Coup2           : le meilleur coup à jouer jusqu'a l'itération courante
% MeilleurCoup    : le meilleur coup à jouer parmi les 2 coups à comparer suivant notre heuristique
% on choisit le coup à moindre cout si les 2 coup ont le meme cout on choisit celui 
% qui garde le meme nombre de piece dans notre plateau de jeu.
heuristique([Cout1,PieceJ1,Res1],[Cout2,PieceJ2,Res2],[Cout2,PieceJ2,Res2]):-	Cout1>Cout2,!.
heuristique([Cout1,PieceJ1,Res1],[Cout2,PieceJ2,Res2],[Cout1,PieceJ1,Res1]):-	Cout2>Cout1,!.
heuristique([Cout1,PieceJ1,Res1],[Cout1,PieceJ2,Res2],[Cout1,PieceJ1,Res1]):-	longueur(Res1, N1),
																				longueur(Res2, N2),
																				N1=<N2,!.
heuristique([Cout1,PieceJ1,Res1],[Cout1,PieceJ2,Res2],[Cout2,PieceJ2,Res2]):-	longueur(Res1, N1),
																				longueur(Res2, N2),
																				N1>N2,!.													


% envoiTypCoup(Liste,Res,Joueur,encercle)/3
% Liste         : Le plateau de jeu avant le dernier coup
% Res           : Le plateau de jeu après le dernier coup
% Joueur        : La couleur du joueur
% TypCoup       : le type du dernier coup joué
%%% encercle ==> la reine adverse est encercler
%%% blocke   ==> placer un scarabet au dessus d'une autre piece
%%% pose     ==> ajouter une piece dans le plateau de jeu
%%% deplacer ==> deplacer une piece dans le plateau
envoiTypCoup(Liste,Res,Joueur,e)          :-		cout2(Res,Joueur,Cout2),
												        Cout2=:=6,!.
envoiTypCoup(Liste,[[P,X,Y,1]|Res],Joueur,b):-!.
envoiTypCoup(Liste,[[P,X,Y,Z]|Res],Joueur,p)	 :-		\+member([P,X2,Y2,Z2],Liste),!.
envoiTypCoup(Liste,[[P,X,Y,Z]|Res],Joueur,d).




% hive(Liste,Joueur,Res,PieceJ,PieceP,Direc,TypCoup)/7
% Liste         : Le plateau de jeu avant le dernier coup
% Joueur		: La couleur du joueur
% Res           : Le plateau de jeu après le dernier coup
% PieceJ        : la piece a jouer
% PieceP        : la piece par rapport auquel on situe le nouvel emplacement de PieceJ
% Direc         : la direction par rapport a PieceP ou se trouve PieceJ
% TypCoup       : le type du dernier coup joué
% c'est le predicat principal qui permettera de generer des coups
hive(Liste,Joueur,Res,PieceJ,PieceP,Direc,TypCoup):-	parcoursSuivant(Liste,Joueur,[],[],[Cout,PieceJ,Res]),
														envoiDirection(Res,PieceP,Direc),
														envoiTypCoup(Liste,Res,Joueur,TypCoup).

% recevoirAdversaire(Liste1,Joueur,Res,PieceJ,PieceP,Direc,TypCoup)/7
% Liste1        : Le plateau de jeu avant le dernier coup de l'adversaire
% Joueur        : La couleur du joueur adverse
% Res           : 
% PieceJ        : La piece poser ou deplacer par l'adversaire
% PieceP        : La piece par rapport auquel on localisera le nouvel emplacement
%                 de PieceJ
% Direc         : La direc par rapport a PieceP ou se trouvera PieceJ
% TypCoup       : Le type du coup de l'adversaire
% predicat qui sert a integrer le coup de l'adversaire en tenant compte de l'adversaire.
recevoirAdversaire([],Joueur,[[PieceJ,0,0,0]],PieceJ,----,--,TypCoup).

recevoirAdversaire(Liste1,Joueur,Res,PieceJ,PieceP,Direc,TypCoup):-	retirerPiece(Liste1,PieceJ,Liste2),
																	coordonnes(Liste2,PieceP,[PieceP,X1,Y1,Z1]),
																	choisirDirection1(Liste2,[X1,Y1],[X2,Y2,0],Direc),					
																	hauteurPiece(Liste2,[X2,Y2],-1,H),
																	Z2 is H+1,
																	ajout_debut([PieceJ,X2,Y2,Z2],Liste2,Res).
																	
																	
																	


% envoiDirection(Res,PieceP,Direc)/3
% Res    : le plateau de jeu
% PieceP : piece par rapport auquel on cherche une direction
% Direc  : la direction par rapport a PieceP ou se trouve la derniere piece jouer
% si le plateau de jeu contient la sel piece qu'on a jouer le predicat renvoie - 
% pour PieceP et Direc
envoiDirection([[P,X,Y,Z]],----,--).														
envoiDirection([[P,X,Y,Z]|Res],PieceP,Direc):-	voisin([X,Y,Z],Res,[],R),
												premier([X2,Y2,Z2],R),
												coordonnes([[P,X,Y,Z]|Res],PieceP,[PieceP,X2,Y2,Z2]),
												choisirDirection1(Res,[X2,Y2],[X,Y,0],Direc).			


% deplacer(Liste1,Joueur,PieceJ,Res,Cout)/5
% Liste1  : le plateau de jeu
% Joueur  : la couleur du joueur
% PieceJ  : la piece a jouer
% Res     : le plateau apres le coup jouer
% Cout    : le Cout du dernier coup
%% deplacement de toutes les pieces et changement de l'etat du plateau de jeu
deplacer(Liste1,Joueur,PieceJ,Res,Cout):-
												visite(Liste1,Joueur,PieceJ,[X,Y,Z]),												
												member(Z,[0,1,2,3,4]),
												retirerPiece(Liste1,PieceJ,Liste2),
												ajout_debut([PieceJ,X,Y,Z],Liste2,Res),
												rucheCasser(Res,[],[]),
												cout1(Res,Joueur,Cout1),
												cout2(Res,Joueur,Cout2),
												Cout is Cout1-Cout2.
												

% testerOccupe(Liste,PieceJ,Coord)/3
% Liste   : le plateau de jeu
% PieceJ  : la piece a jouer 
% Coord   : coordonnees du nouvel emplacement de la piece a jouer
%% on verifie si la piece a jouer est differente du scarabet que le nouvel emplacement
% de pieceJ n'est pas occupé.
testerOccupe(Liste,PieceJ,[X2,Y2]):-    \+member(PieceJ,[sc1n,sc2n,sc1b,sc2b]),!,
										\+occupe(Liste,[X2,Y2]).										
testerOccupe(Liste,PieceJ,[X2,Y2]):-    member(PieceJ,[sc1n,sc2n,sc1b,sc2b]),!.


% visite(Liste,Joueur,PieceJ,Coord)/4
% Liste      :	le plateau de jeu
% Joueur     :  la couleur du joueur
% PieceJ     :	la piece jouer
% Coord      :  coordonnes du nouvel emplacement  
%% poser une nouvelle piéce dans le plateau de jeu 										
visite(Liste,Joueur,PieceJ,[X,Y,0]):-	choisirPiece2(Liste,Joueur,PieceJ),
										choisirDirection2(Liste,Joueur,[X,Y]).										
																								
%% deplacement de tous les pieces autour du plateau
visite(Liste,Joueur,PieceJ,[X2,Y2,Z2]):- member(P,[ab1b,ab1n]),
										pieceDuJoueur(P,Joueur),
										coordonnes(Liste,P,_),
										member([PieceJ,X1,Y1,Z1],Liste),										
										pieceDuJoueur(PieceJ,Joueur),
										\+pieceAuDessus(Liste,[X1,Y1,Z1]),
										choisirCoup(Liste,Joueur,PieceJ,[PieceJ,X1,Y1,Z1],[X2,Y2,Z2]),									
										testerOccupe(Liste,PieceJ,[X2,Y2]).																				



% choisirCoup(Liste,Joueur,PieceJ,Coord1,Coord2)/5
% Liste   :  Le plateau de jeu
% PieceJ  :  la piece a jouer
% Coord1  :  coordonnes de la piece avant le deplacement
% Coord2  :  coordonnes de la piece apres le deplacement
%% choix de la piece a jouer ainsi que le nouvel emplacement en fonction
%% de la piece choisie
% il s'agit d'un deplacement de la reine
choisirCoup(Liste,Joueur,PieceJ,[PieceJ,X1,Y1,Z1],[X2,Y2,Z2]):-	
												choisirPiece1(Liste,Joueur,PieceJ),
												choisirDirection1(Liste,[X1,Y1],[X2,Y2,Z2],D),												
												deplacementCorrect(Liste,[X1,Y1],[X2,Y2],D).
% il s'agit d'un deplacement de l'arraigné							
choisirCoup(Liste,Joueur,PieceJ,[PieceJ,X1,Y1,Z1],[X2,Y2,Z2]):-	
												choisirPiece3(Liste,Joueur,PieceJ),
												choisirDirection3(Liste,[X1,Y1],[X1,Y1],[X1,Y1],[X2,Y2,Z2],0).
% il s'agit d'un deplacement de la sauterelle											
choisirCoup(Liste,Joueur,PieceJ,[PieceJ,X1,Y1,Z1],[X2,Y2,Z2]):-	
												choisirPiece4(Liste,Joueur,PieceJ),
												choisirDirection1(Liste,[X1,Y1],[X,Y,Z],D),
												occupe(Liste,[X,Y]),
												choisirDirection4(Liste,[X,Y],[X2,Y2,Z2],D).												
												
% il s'agit d'un deplacement de la fourmi
choisirCoup(Liste,Joueur,PieceJ,[PieceJ,X1,Y1,Z1],[X2,Y2,0]):-	
												choisirPiece5(Liste,Joueur,PieceJ),
												choisirDirection5(Liste,[X1,Y1],[X1,Y1],[X1,Y1],[X2,Y2,Z2]).
																								
% il s'agit d'un deplacement du scarabet
choisirCoup(Liste,Joueur,PieceJ,[PieceJ,X1,Y1,Z1],[X2,Y2,Z2]):-	
												choisirPiece6(Liste,Joueur,PieceJ),
												choisirDirection6(Liste,[X1,Y1],[X2,Y2,Z2]).

% choisirPiece6(Liste,Joueur,PieceJ)/3
% Liste    :  Le plateau de jeu
% Joueur   :  La couleur du joueur
% PieceJ   :  La piece à jouer
% selection d'un scarabet du Joueur
choisirPiece6(Liste,Joueur,PieceJ):- 
									member(PieceJ,[sc1n,sc2n,sc1b,sc2b]).

% choisirDirection6(Liste,Coordonnes1,Coordonnes2)/3
% Liste        : Le plateau de jeu
% Coordonnes1  : les coordonnées du scarabet avant le deplacement
% Coordonnes2  : les coordonnées du scarabet apres le deplacement
% dans le deplacement du scarabet on tient compte qu'au maximum il y'a 4 pieces
% empilées
choisirDirection6(Liste,[X1,Y1],[X,Y,HT]):-
											choisirDirection1(Liste,[X1,Y1],[X,Y,Z],Dir),											
											hauteurPiece(Liste,[X,Y],-1,H),											
											H=<4,
											test(Liste,[X1,Y1],[X,Y,Z],H,HT,Dir).
													
% test(Liste,Coord1,Coord2,Hauteur1,HauTeur2,Direction)/6							
% Liste     : Le plateau de Jeu
% Coord1    : Les coordonnées du scarabet avant le deplacement
% Coord2    : Les coordonnées du scarabet apres le deplacement
% Hauteur1  : hauteur de la piece à l'emplacement Coord2
% Hauteur2  : hauteur du scarabet à l'emplacement Coord2
% Direction : direction du deplacement
test(Liste,[X1,Y1],[X,Y,Z],H,HT,D):-		H=:= -1,
											deplacementCorrect(Liste,[X1,Y1],[X,Y],D),											
											!,
											HT is H+1.
											
											
test(Liste,[X1,Y1],[X,Y,Z],H,HT,D):-			H > -1,							
												!,
												HT is H+1.
												              

% hauteurPiece(Liste,Coordonnes,HauteurTemp,HauteurFin)/4
% Liste       : Le plateau de jeu
% Coordonnes  : coordonnes de la piece dont on veut calculer la hauteur
% HauteurTemp : accumulateur des hauteurs
% HauteurFin  : la hauteur de la piece la plus élevée dans Coordonnes
hauteurPiece([],_,H1,H1):-!.
hauteurPiece([E|Liste],[X2,Y2],H1,H2):- 	
										nth1( 2,E , A),
										nth1( 3,E , B),
										nth1( 4,E , C),
										A=:=X2,
										B=:=Y2,
										H1<C,!,
										hauteurPiece(Liste,[X2,Y2],C,H2).
hauteurPiece([_|Liste],[X2,Y2],H1,H2):-	hauteurPiece(Liste,[X2,Y2],H1,H2).

% choisirPiece5(Liste,Joueur,PieceJ)/3
% Liste  : Le plateau de jeu 
% Joueur : La couleur du joueur
% PieceJ : La fourmi a deplacer															
%% choix d'une fourmi du joueur
choisirPiece5(Liste,Joueur,PieceJ):-	
									member(PieceJ,[fo1n,fo2n,fo3n,fo1b,fo2b,fo3b]).

% choisirDirection5(Liste,CoordAvt,CoordDepart,CoordApres,CoordFin)/5
% Liste	         : le plateau de jeu
% CoordAvt       :  Coord de l'emplacement de la fourmi à l'iteration d'avant
% CoordDepart    :  Coord de depart de la fourmi avant tout deplacement
% CoordApres     :  Coord de l'emplacement de la fourmi après l'iteration courante
% CoordFin       :  Dernier emplacement possible pour la fourmit
%% on avance a chaque iteration la fourmit a un pas on verifiant qu'elle reste bien 
%% accrocher a la ruche. La terminaison est determiner par 
%% le retour à l'emplacement de depart de la fourmi.
choisirDirection5(Liste,[A,B],[C,D],[X1,Y1],[X1,Y1,0]):-coupleDiff([X1,Y1],[C,D]).
choisirDirection5(Liste,[A,B],[C,D],[X1,Y1],[X2,Y2,Z2]) :-	
														choisirDirection1(Liste,[X1,Y1],[X,Y,Z],Dir),
														deplacementCorrect(Liste,[X1,Y1],[X,Y],Dir),
														\+occupe(Liste,[X,Y]),
														accroche(Liste,[C,D],[X,Y,Z]),
														coupleDiff([X,Y],[A,B]),
														coupleDiff([X,Y],[C,D]),
														choisirDirection5(Liste,[X1,Y1],[C,D],[X,Y],[X2,Y2,Z2]).									
																		

% choisirPiece4(Liste,Joueur,PieceJ)/3
% Liste  : Le plateau de jeu
% Joueur : La couleur du joueur
% PieceJ : La sauterelle à deplacer
%% choix d'une sauterelle du joueur
choisirPiece4(Liste,Joueur,PieceJ):-	member(PieceJ,[sa1n,sa2n,sa3n,sa1b,sa2b,sa3b]). 			


% choisirDirection4(Liste,Coordonnes1,Coordonnes2,Direc)/4
% Liste       : Le plateau de jeu
% Coordonnes1 : emplacement de la sauterelle avant le deplacement
% Coordonnes2 : emplacement de la sauterelle à la fin du deplacement
% Direc       : la direction du deplacement
% deplacement d'une sauterelle
choisirDirection4(Liste,[X1,Y1],[X2,Y2,Z2],D):-		choisirDirection1(Liste,[X1,Y1],[X,Y,Z],D),
													sautOuPas(Liste,[X,Y],[X2,Y2,Z2],D).
													
% sautOuPas(Liste,CoordTemp1,CoordTemp2,Direction)
% Liste      : Le plateau de jeu
% CoordTemp1 : emplacement à testé si occupé
% CoordTemp2 : nouvel emplacement à testé si occupé
% Direction  : la direction du saut
%% on continue le saut tant qu'on a pas trouvé un emplacement libre
%% dans la direction du saut
sautOuPas(Liste,[X,Y],[X,Y,0],D):-	\+occupe(Liste,[X,Y]).
sautOuPas(Liste,[X,Y],[X2,Y2,Z2],D):-	occupe(Liste,[X,Y]),
										choisirDirection4(Liste,[X,Y],[X2,Y2,Z2],D).


% choisirPiece3(Liste,Joueur,PieceJ)/3
% Liste  : Le plateau de jeu
% Joueur : La couleur du joueur
% PieceJ : L'arraigné à deplacer
%% choix d'un arraigné du joueur		
choisirPiece3(Liste,Joueur,PieceJ):-	member(PieceJ,[ar1n,ar2n,ar1b,ar2b]).												

% choisirDirection3(Liste,CoordonnesPA,CoordonnesDep,CoordonnesCour,CoordonnesFin,compteur)/6
% Liste          : Le plateau de jeu
% CoordonnesPA   : emplacement de l'arraigné au pas d'avant
% CoordonnesDep  : emplacement de l'arraigné au depart
% CoordonnesCour : emplacement de l'arraigné au pas Courant
% CoordonnesFin  : emplacement de l'arraigné en fin de deplacement
% compteur       : compteur de pas de deplacement
% deplacement d'un arraigné
choisirDirection3(Liste,[A,B],[C,D],[X1,Y1],[X1,Y1,0],3).								
choisirDirection3(Liste,[A,B],[C,D],[X1,Y1],[X2,Y2,Z2],C1) :-	
														C1=\=3,
														choisirDirection1(Liste,[X1,Y1],[X,Y,Z],Dir),
														deplacementCorrect(Liste,[X1,Y1],[X,Y],Dir),
														accroche(Liste,[C,D],[X,Y,Z]),
														coupleDiff([A,B],[X,Y]),
														C2 is C1+1,
														choisirDirection3(Liste,[X1,Y1],[C,D],[X,Y],[X2,Y2,Z2],C2).
% accroche(Liste,Coord1,Coord2)/3
% Liste  : Le plateau de jeu
% Coord1 : les coordonnees de l'emplacement de la piece avt deplacement 
% Coord2 : l'emplacement qu'on veut verifier qu'il est bien accroché à la ruche
%% on veut verifier que la piece de Coord2 est accroché à au moins une piece
%% sauf l'emplacement de depart
accroche(Liste,[X1,Y1],[X2,Y2,Z2]):-   	choisirDirection1(Liste,[X2,Y2],[A,B,C],D),
										coupleDiff([A,B],[X1,Y1]),									
										occupe(Liste,[A,B]).


% coupleDiff(Coord1,Coord2)/2
% Coord1  : Coordonnes de l'emplacement 1 à comparer
% Coord2  : Coordonnes de l'emplacement 2 à comparer
% réussit si les deux emplacement sont différentes								
coupleDiff([A,B],[X1,X2]):-A=\=X1,!.
coupleDiff([A,B],[X1,X2]):-B=\=X2.
 										
%% choisi une reine du joueur Joueur

% choisirPiece1(Liste,Joueur,PieceJ)/3
% Liste  : Le plateau de jeu
% Joueur : La couleur du joueur
% PieceJ : L'abeille à deplacer
%% choix d'une abeille du joueur		
choisirPiece1(Liste,Joueur,PieceJ):-	
										member(PieceJ,[ab1n,ab1b]).									

% choisirDirection1(Liste,Coord1,Coord2,Direc)
% Liste  : Le plateau de jeu
% Coord1 : coordonnes avant deplacement
% Coord2 : coordonnes après deplacement	
% Direc  : direction du deplacement							
% deplacement de la reine vers le nord
choisirDirection1(Liste,[X1,Y1],[X2,Y2,0],nd):-	
											X2 is X1+1,
											Y2 is Y1-1.																						
											
%deplacement de la reine vers le nord est
choisirDirection1(Liste,[X1,Y1],[X2,Y2,0],ne):-	
											X2 is X1,
											Y2 is Y1-1.											
%deplacement de la reine vers le sud est
choisirDirection1(Liste,[X1,Y1],[X2,Y2,0],se):-	
											X2 is X1-1,
											Y2 is Y1.											
											
%deplacement de la reine vers le sud
choisirDirection1(Liste,[X1,Y1],[X2,Y2,0],sd):-	
											X2 is X1-1,
											Y2 is Y1+1.

%deplacement de la reine vers le sud ouest
choisirDirection1(Liste,[X1,Y1],[X2,Y2,0],so):-	
											X2 is X1,
											Y2 is Y1+1.
%deplacement de la reine vers le nord ouest
choisirDirection1(Liste,[X1,Y1],[X2,Y2,0],no):-	
											X2 is X1+1,
											Y2 is Y1.											
% deplacementCorrect(Liste,Coord1,Coord2,nd)/4
% Liste     : Le plateau de jeu 
% Coord1    : coordonnes avant deplacement
% Coord2    : coordonnes après deplacement
% Direction : direction du deplacement
%% verifie bien que le deplacement est autorisé 				
deplacementCorrect(Liste,[X1,Y1],[X2,Y2],nd):-	\+vide(Liste,[X1,Y2],[X2,Y1]).
deplacementCorrect(Liste,[X1,Y1],[X2,Y2],ne):-
											A is X1+1,
											C is X1-1,							
											\+vide(Liste,[A,Y2],[C,Y1]).
deplacementCorrect(Liste,[X1,Y1],[X2,Y2],se):-											
											A is Y1-1,
											C is Y1+1,
											\+vide(Liste,[X1,A],[X2,C]).
deplacementCorrect(Liste,[X1,Y1],[X2,Y2],sd):-	\+vide(Liste,[X2,Y1],[X1,Y2]).			
deplacementCorrect(Liste,[X1,Y1],[X2,Y2],so):- 			
											A is X1-1,
											C is X1+1,
											\+vide(Liste,[A,Y2],[C,Y1]).								
deplacementCorrect(Liste,[X1,Y1],[X2,Y2],no):-
											A is Y1+1,
											C is Y1-1,
											\+vide(Liste,[X1,A],[X2,C]).

% vide(Liste,Coord1,Coord2)/3																						
% Liste     : Le plateau de jeu 
% Coord1    : coordonnes avant deplacement
% Coord2    : coordonnes après deplacement
%% test si le deplacement est possible
vide(Liste,[X1,Y1],[X2,Y2]):-	occupe(Liste,[X1,Y1]),
								occupe(Liste,[X2,Y2]).
% pieceAuDessus(Liste,Coord)/2
% Liste : Le plateau de jeu
% Coord : coordonnes d'une piece 
%% reussit si la piece est en dessous de d'autre piéce											
pieceAuDessus([],_):-!,fail.
pieceAuDessus([E|Liste],[X,Y,Z]):-		nth1( 2,E , A),
										nth1( 3,E , B),
										nth1( 4,E , C),
										A=:=X,
										B=:=Y,										
										C>Z.										
pieceAuDessus([E|Liste],[X,Y,Z]):-		pieceAuDessus(Liste,[X,Y,Z]).

% occupe(Liste,Coord)/2
% Liste : Le plateau de jeu
% Coord : coordonnees de l'emplacement à verifié
%% verifie si la case de coord [X2,Y2] est occupée
occupe([],_):-					!,fail.
occupe([E|Liste],[X2,Y2]):- 	
								nth1( 2,E , A),
								nth1( 3,E , B),
								A=:=X2,
								B=:=Y2.
occupe([_|Liste],[X2,Y2]):-		occupe(Liste,[X2,Y2]).
									
% choisirPiece2(Liste,Joueur,PieceJ)
% Liste  : Le plateau de jeu
% Joueur : La couleur du joueur
% PieceJ : La piece à poser
%%renvoie une piece du Joueur pas encore placé au plateau
%% si c'est le 4éme tour et que la reine n'est pas encore placée dans le plateau
%% la piece jouée sera la reine.
choisirPiece2(Liste,Joueur,PieceJ):-	member(PieceJ,[ab1b,ab1n]),
										pieceDuJoueur(PieceJ,Joueur),
										\+coordonnes(Liste,PieceJ,_),																				
										nbrpieceAMoi(Liste,Joueur,0,3),!.										

choisirPiece2(Liste,Joueur,PieceJ):-	pieceDuJoueur(PieceJ,Joueur),
										\+coordonnes(Liste,PieceJ,_).

% choisirDirection2(Liste,Joueur,Coord)
% Liste  : Le plateau de jeu
% Joueur : La couleur du joueur
% Coord : coordonnes de l'emplacement ou on va poser la piece	
% selection d'un emplacement vide qui a en voisin aucune piece de l'adversaire
choisirDirection2(Liste,Joueur,[X,Y]):- pieceDuJoueur(PieceP,Joueur),
										coordonnes(Liste,PieceP,[PieceP,A,B,C]),
										choisirDirection1(Liste,[A,B],[X,Y,0],D),
										\+occupe(Liste,[X,Y]),
										voisin([X,Y,0],Liste,[],R),
										diffPieceAdversaire(Liste,Joueur,R).
																						

choisirDirection2([[PieceP,A,B,C]],Joueur,[X,Y]):-	
													
													\+pieceDuJoueur(PieceP,Joueur),													
													choisirDirection1([[PieceP,A,B,C]],[A,B],[X,Y,0],D).

choisirDirection2([],Joueur,[0,0]).


										
% diffPieceAdversaire(Liste,Joueur,R)/3
% Liste  : Le plateau de jeu
% Joueur : La couleur du joueur
% R      : Liste des pieces à verifier
%% reussit si aucune piece de R n'est celle de l'adversaire
diffPieceAdversaire(Liste,Joueur,[]).
diffPieceAdversaire(Liste,Joueur,[[X,Y,Z]|R]):- coordonnes(Liste,P,[P,X,Y,Z]),
												\+pieceDuJoueur(P,Joueur),
												fail.
diffPieceAdversaire(Liste,Joueur,[[X,Y,Z]|R]):- coordonnes(Liste,P,[P,X,Y,Z]),
												pieceDuJoueur(P,Joueur),
												diffPieceAdversaire(Liste,Joueur,R).
																						
% coordonnes(Liste,Piece,Coordones)/3
% Liste     : Le plateau de jeu 
% Piece     : La piece dont on cherche les coordonnes
% Coordones : coordonnes de la piece dans le plateau de jeu
coordonnes([],_,_):-!,fail.
coordonnes([X|L],P,X):-premier(P,X).
coordonnes([_|L],P,R):-coordonnes(L,P,R).					    

% coordonnesDiff(Liste,Piece,Coordones,Res)/4
% Liste     : Le plateau de jeu 
% Piece     : La piece dont on cherche les coordonnes
% Coordones : coordonnes de la piece dans le plateau de jeu
% Res       : le plateau de jeu sans la piece piece
% recuperer la liste correspondant au info d'un pion et le soustrait de la liste
coordonnesDiff([],_,_,_):-!,fail.
coordonnesDiff([X|L],P,X,L):-premier(P,X).
coordonnesDiff([Y|L],P,R,[Y|Res]):-coordonnesDiff(L,P,R,Res).			


% nbrpieceAMoi(Liste,Joueur,Compteur,nbrPiece)/4
% Liste     : Le plateau de jeu 
% Joueur    : La couleur du joueur
% Compteur  : compteur à incrémenter chaque pas qu'on rencontre une piece du joueur
% nbrPiece  : nbre de piece total du joueur dans le plateau de jeu
nbrpieceAMoi([],Joueur,C1,C1).										
nbrpieceAMoi([[P,X,Y,Z]|Liste],Joueur,C1,C2):-			pieceDuJoueur(P,Joueur),
														C is C1+1,
														nbrpieceAMoi(Liste,Joueur,C,C2),!.
nbrpieceAMoi([[P,X,Y,Z]|Liste],Joueur,C1,C2):-															
														nbrpieceAMoi(Liste,Joueur,C1,C2).
