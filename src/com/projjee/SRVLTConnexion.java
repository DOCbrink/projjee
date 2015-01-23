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

/**
 * Servlet implementation class SRVLTConnexion
 */
@WebServlet("/SRVLTConnexion")
public class SRVLTConnexion extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SRVLTConnexion() {
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
		String login = request.getParameter("login");
		String pwd = request.getParameter("pwd");
		
		HttpSession sessionS = request.getSession();
		
		Session session = HibernateTools.currentSession();
		session.beginTransaction();
		
		try {
			ArrayList<User> userco = (ArrayList<User>)session.createQuery("from User where loginUser='"+login+"' AND mdpUser='"+pwd+"'").list();
		
			if (userco.size() == 0)
				sessionS.setAttribute("statusLogin", "NO_USER");
			
			else if (userco.size() == 1)
			{
				sessionS.setAttribute("statusLogin", "STATUS_OK");
				sessionS.setAttribute( "userco", userco.get(0));
			}
			
			else
				sessionS.setAttribute("statusLogin", "TOO_MUCH_USER");
			
		} catch (HibernateException e) {
			System.out.println("erreur de connexion");
			sessionS.setAttribute("statusLogin", "ERROR_CONNEXION");
		}	
		
		HibernateTools.closeSession();
		
		RequestDispatcher req = request.getRequestDispatcher("/index.jsp");
		req.forward(request, response);
	}

}
