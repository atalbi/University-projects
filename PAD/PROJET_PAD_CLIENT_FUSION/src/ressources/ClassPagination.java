package ressources;


import java.util.Vector;

public class ClassPagination {

    int NbrLigne;   //Nbr de ligne ds la table
    int NbrElePage; //Nbr d'element ds la page
    int PageCourante; //page courante

    public ClassPagination() {
    }

    public void Parametre(int NbrElePage, int PageCourante, int nbLignes) { // constructeur avec 3 paramétre la requete + Nbr d'element ds une page + la page courante
        
        this.NbrElePage = NbrElePage;
        this.PageCourante = PageCourante;
        this.NbrLigne = nbLignes;
        //this.NbrLigne = 70;
    }

    public Vector<Vector<String>> Pages() {
        Vector<Vector<String>> V = new Vector<Vector<String>>();
        Vector<String> V2;
        int VerPage = 0; // cette variable va nous permettre d'ajouter les element 1 seul foix
        int Point3 = 0; // se sont les 3 point;

        int NbrPage = (int) NbrLigne / NbrElePage ;
        if((NbrLigne % NbrElePage) != 0){
            NbrPage ++;
        }
        if (PageCourante > 0) {  //cette condition c'est pour tester si on va afficher "Précedente" car si on n'est ds la premiére page on va pa l'afficher
            V2 = new Vector<String>();
            int i = PageCourante ;
            V2.add(String.valueOf(i));
            V2.add("Prec");
            V.add(V2);
        }
        for (int Page = 1; Page <= NbrPage; Page++) { // bouclé sur le nombre de pages
            if (1 <= Page && Page <= 3) {    // on affiche toujour les 3 premiere page et les 3 derniére page
                VerPage = 1;
            }
            if (3 < Page && Page <= (NbrPage - 3)) {
                if (((PageCourante - 1) == Page) || (Page == (PageCourante)) || (Page == (PageCourante + 1))) {
                    //cette condiition elle va nous permettre d'avoir comme sa    1 - 2 - 3 ... 7 - 8 - 9 ... 70 - 71 - 72
                    VerPage = 1;
                    Point3 = 0;
                } else {
                    if (Point3 == 0) { // et maintenent Precedente il va s'afficher une seul voix
                        V2 = new Vector<String>();
                        V2.add("");
                        V2.add("...");
                        V.add(V2);
                        Point3 = 1;
                    }
                }
            }
            if ((NbrPage - 3) < Page && Page <= NbrPage) { // affiche les 3 derniére page
                VerPage = 1;
            }

            if (VerPage == 1) { // et voila cette variable de toute alors hhhh
                V2 = new Vector<String>();
                V2.add(String.valueOf(Page));
                V2.add(String.valueOf(Page));
                V.add(V2);
                VerPage = 0;
            }
        }
        if (PageCourante+1 < NbrPage) {  //cette condition c'est pour tester si on va afficher "Suivante" car si on n'est ds la derniére page on va pa l'afficher
            V2 = new Vector<String>();
            int i = PageCourante + 2;
            V2.add(String.valueOf(i));
            V2.add("Suiv");
            V.add(V2);
        }
        return V;
    }

}
