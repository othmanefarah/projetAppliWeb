package projet.servlets;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import projet.beans.MesuresGouvernementales;
import projet.beans.Utilisateur;
import projet.forms.AjouterMesureGouvForm;

/**
 * Servlet implementation class AjouterVaccin
 */
@WebServlet("/AjouterMesureGouv")
public class AjouterMesureGouv extends HttpServlet {
	@EJB
	private Facade facade;
	
    public static final String ATT_SESSION_USER = "sessionUtilisateur";
    public static final String ATT_FORM = "form";
    public static final String VUE = "/appli/AjoutMesureGouv.jsp";
    public static final String CONNEXION = "/appli/gouvern.jsp";
    public static final String ATT_CONNECTED = "connected";
    public static final String ATT_AJOUTMESURE = "ajoutmesure";



    public void doGet( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException{
        
        /* R�cup�ration de la session depuis la requ�te */
        HttpSession session = request.getSession();
        if (session.getAttribute(ATT_SESSION_USER) != null) {
            request.setAttribute( ATT_CONNECTED, "<a class=\"nav-link\" href=\"/projet/Profile\">Profile</a>" );
        } else {
            request.setAttribute( ATT_CONNECTED, "<a class=\"nav-link\" href=\"/projet/Connexion\">Connexion/Inscription</a>" );	
        }      
        /* Affichage de la page d'inscription */
        this.getServletContext().getRequestDispatcher( VUE ).forward( request, response );
    }
	
    public void doPost( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
        /* Cr�ation du formulaire */
        AjouterMesureGouvForm form = new AjouterMesureGouvForm();
		
        /* Appel au traitement et � la validation de la requ�te, et r�cup�ration du bean en r�sultant */
        MesuresGouvernementales mesure = form.ajoutermesure(request,facade);
        
		
        /* Stockage du formulaire et du bean dans l'objet request */
        request.setAttribute( ATT_FORM, form );
        

        /* R�cup�ration de la session depuis la requ�te */
        HttpSession session = request.getSession();
    	
		if (session.getAttribute(ATT_SESSION_USER) != null) {
            request.setAttribute( ATT_CONNECTED, "<a class=\"nav-link\" href=\"/projet/Profile\">Profile</a>" );
            if ( ((Utilisateur) session.getAttribute(ATT_SESSION_USER)).isAdmin()) {
            	request.setAttribute( ATT_AJOUTMESURE, "<a class=\"nav-link center\" href=\"/projet/AjouterMesureGouv\">Ajouter mesure</a>" );
            }
        } else {
            request.setAttribute( ATT_CONNECTED, "<a class=\"nav-link\" href=\"/projet/Connexion\">Connexion/Inscription</a>" );	
        }        
        if (form.getErreurs().isEmpty()) {
            this.getServletContext().getRequestDispatcher( CONNEXION ).forward( request, response );       	
        } else {
            this.getServletContext().getRequestDispatcher( VUE ).forward( request, response );
        }        
    }
    

}
