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
 * Servlet implementation class SRVLTCreerCategorie
 */
@WebServlet("/SRVLTCreerCategorie")
public class SRVLTCreerCategorie extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SRVLTCreerCategorie() {
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
		String newCateg = request.getParameter("newCateg");
		
		HttpSession sessionS = request.getSession();
		
		Session session = HibernateTools.currentSession();
		Transaction tx = session.beginTransaction();
		
		if (sessionS.getAttribute("statusLogin").equals("STATUS_OK"))
		{
		
			try {
				User userco = (User)sessionS.getAttribute("userco");
				ArrayList<User> categ = (ArrayList<User>)session.createQuery("from Categorie where nomCategorie='"+newCateg+"'").list();
			
				if (categ.size() == 0)
				{
					Categorie categNew = new Categorie(userco, newCateg);
					session.save(categNew);
					request.setAttribute("status", "SUCCESS");
					request.setAttribute("message", "Catégorie \""+newCateg+"\" ajoutée !");
					tx.commit();
				}
				
				else
				{
					request.setAttribute("status", "FAIL");
					request.setAttribute("message", "Catégorie déjà existante !");
				}
				
			} catch (HibernateException e) {
				System.out.println("erreur hibernate");
				request.setAttribute("status", "FAIL");
				request.setAttribute("message", "erreur d'hibernate ou de BDD");
			}	
		}
		
		else
		{
			request.setAttribute("status", "FAIL");
			request.setAttribute("message", "Vous devez être connecté(e) pour ajouter une catégorie.");
		}
		
		HibernateTools.closeSession();
		
		RequestDispatcher req = request.getRequestDispatcher("/index.jsp");
		req.forward(request, response);
	}

}
