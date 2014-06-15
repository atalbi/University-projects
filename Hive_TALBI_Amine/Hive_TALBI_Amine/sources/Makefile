

processusJoueur : processusJoueur.c processusJoueur.h protocolArbitre.h fonctionsSocket.o
	gcc  processusJoueur.c processusJoueur.h protocolArbitre.h fonctionsSocket.o -o processusJoueur

fonctionsSocket.o: fonctionsSocket.c fonctionsSocket.h
	gcc -c  fonctionsSocket.h fonctionsSocket.c


clean :
	rm *.o;
	rm *~;

