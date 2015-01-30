package com.projjee;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 * Servlet implementation class SRVLTInscription
 */
@WebServlet("/SRVLTInscription")
public class SRVLTInscription extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SRVLTInscription() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession sessionS = request.getSession();
		
		RequestDispatcher req = request.getRequestDispatcher("/index.jsp");
		
		String login = request.getParameter("newLogin");
		String pwd = request.getParameter("newPwd");
		
		Session session = HibernateTools.currentSession();
		Transaction tx = session.beginTransaction();
		
		Query q = session.createQuery("from Image Order by imageDateAjout DESC");
		q.setMaxResults(16);
		ArrayList<Image> imgList = (ArrayList<Image>)q.list();

		request.setAttribute("imgList", imgList);
		
		try {
			ArrayList<User> userco = (ArrayList<User>)session.createQuery("from User where loginUser='"+login+"' AND mdpUser='"+pwd+"'").list();
		
			if (userco.size() == 0)
			{
				User newUser = new User(login, pwd);
				session.save(newUser);
				request.setAttribute("status", "SUCCESS");
				request.setAttribute("message", "Vous êtes maintenant inscrit ! Bonne viste =)");
				tx.commit();
				
				sessionS.setAttribute("statusLogin", "STATUS_OK");
				sessionS.setAttribute( "userco", newUser);
				
				req = request.getRequestDispatcher("/accueil.jsp");
			}
			
			else
			{
				request.setAttribute("status", "FAIL");
				request.setAttribute("message", "Utilisateur déjà existant");
			}
			
		} catch (HibernateException e) {
			System.out.println("erreur hibernate : "+e);
			request.setAttribute("status", "FAIL");
			request.setAttribute("message", "erreur d'hibernate ou de BDD");
		}	
		
		req.forward(request, response);
		
		HibernateTools.closeSession();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession sessionS = request.getSession();
		
		RequestDispatcher req = request.getRequestDispatcher("/index.jsp");
		
		String login = request.getParameter("newLogin");
		String pwd = request.getParameter("newPwd");
		
		Session session = HibernateTools.currentSession();
		Transaction tx = session.beginTransaction();
		
		Query q = session.createQuery("from Image Order by imageDateAjout DESC");
		q.setMaxResults(16);
		ArrayList<Image> imgList = (ArrayList<Image>)q.list();

		request.setAttribute("imgList", imgList);
		
		try {
			ArrayList<User> userco = (ArrayList<User>)session.createQuery("from User where loginUser='"+login+"' AND mdpUser='"+pwd+"'").list();
		
			if (userco.size() == 0)
			{
				User newUser = new User(login, pwd);
				session.save(newUser);
				request.setAttribute("status", "SUCCESS");
				request.setAttribute("message", "Vous êtes maintenant inscrit ! Bonne viste =)");
				tx.commit();
				
				sessionS.setAttribute("statusLogin", "STATUS_OK");
				sessionS.setAttribute( "userco", newUser);
				
				req = request.getRequestDispatcher("/accueil.jsp");
			}
			
			else
			{
				request.setAttribute("status", "FAIL");
				request.setAttribute("message", "Utilisateur déjà existant");
			}
			
		} catch (HibernateException e) {
			System.out.println("erreur hibernate : "+e);
			request.setAttribute("status", "FAIL");
			request.setAttribute("message", "erreur d'hibernate ou de BDD");
		}	
		
		req.forward(request, response);
		
		HibernateTools.closeSession();
	}

}
