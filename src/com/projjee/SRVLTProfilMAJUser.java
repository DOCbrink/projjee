package com.projjee;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 * Servlet implementation class SRVLTProfilMAJUser
 */
@WebServlet("/SRVLTProfilMAJUser")
public class SRVLTProfilMAJUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SRVLTProfilMAJUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession sessionS = request.getSession();
		
		Session session = HibernateTools.currentSession();
		Transaction tx = session.beginTransaction();
		
		RequestDispatcher req = request.getRequestDispatcher("/index.jsp");
		
		String nom = request.getParameter("nom");
		String prenom = request.getParameter("prenom");
		String login = request.getParameter("login");
		String pwd = request.getParameter("pwd");
		
		if (sessionS.getAttribute("statusLogin") != null && sessionS.getAttribute("userco") != null)
		{
			if (sessionS.getAttribute("statusLogin") == "STATUS_OK")
			{
				User user = (User)sessionS.getAttribute("userco");
				int idUser = user.getIdUser();
				
				//pour rendre l'objet persistant
				user = (User)session.load("com.projjee.User", idUser);
				
				if (!nom.isEmpty())
					user.setUserNom(nom);
				if (!prenom.isEmpty())
					user.setUserPrenom(prenom);
				if (!login.isEmpty())
					user.setLoginUser(login);
				if (!pwd.isEmpty())
					user.setMdpUser(pwd);
				
				tx.commit();
				
				req = request.getRequestDispatcher("/JSPProfile.jsp");
				request.setAttribute("parametre", "profil");
				request.setAttribute("userInfo", user);
				
			}
			
			else
			{
				request.setAttribute("status", "FAIL");
				request.setAttribute("message", "Vous devez être connecté(e) pour acceder à cette partie du site.");
			}
		}
		
		else
		{
			request.setAttribute("status", "FAIL");
			request.setAttribute("message", "Vous devez être connecté(e) pour acceder à cette partie du site.");
		}
		
		req.forward(request, response);		
		
		HibernateTools.closeSession();
	}

}
