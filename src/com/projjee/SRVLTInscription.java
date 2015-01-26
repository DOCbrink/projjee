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
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String login = request.getParameter("newLogin");
		String pwd = request.getParameter("newPwd");
		
		Session session = HibernateTools.currentSession();
		Transaction tx = session.beginTransaction();
		
		try {
			ArrayList<User> userco = (ArrayList<User>)session.createQuery("from User where loginUser='"+login+"' AND mdpUser='"+pwd+"'").list();
		
			if (userco.size() == 0)
			{
				User newUser = new User(login, pwd);
				session.save(newUser);
				request.setAttribute("status", "SUCCESS");
				request.setAttribute("message", "Vous êtes maintenant inscrit ! Bonne viste =)");
				tx.commit();
			}
			
			else
			{
				request.setAttribute("status", "FAIL");
				request.setAttribute("message", "Utilisateur déjà existant");
			}
			
		} catch (HibernateException e) {
			System.out.println("erreur hibernate");
			request.setAttribute("status", "FAIL");
			request.setAttribute("message", "erreur d'hibernate ou de BDD");
		}	
		
		HibernateTools.closeSession();
		
		RequestDispatcher req = request.getRequestDispatcher("/index.jsp");
		req.forward(request, response);
	}

}
