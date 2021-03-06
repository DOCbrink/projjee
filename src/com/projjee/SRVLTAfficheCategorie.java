package com.projjee;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

/**
 * Servlet implementation class AfficheCategorie
 */
@WebServlet("/SRVLTAfficheCategorie")
public class SRVLTAfficheCategorie extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SRVLTAfficheCategorie() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Session session = HibernateTools.currentSession(); 
		Transaction tx = session.beginTransaction();
		   
		ArrayList <Categorie> categList = (ArrayList)session.createQuery("from Categorie").list();
		ArrayList <Image> imgList = (ArrayList)session.createQuery("from Image").list();

		request.setAttribute("categories", categList);
		request.setAttribute("images", imgList);
		
		RequestDispatcher req = request.getRequestDispatcher("/JSPafficheCategorie.jsp");
		req.forward(request, response);
		
		HibernateTools.closeSession();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Session session = HibernateTools.currentSession(); 
		Transaction tx = session.beginTransaction();
		   
		ArrayList <Categorie> categList = (ArrayList)session.createQuery("from Categorie").list();
		ArrayList <Image> imgList = (ArrayList)session.createQuery("from Image").list();

		request.setAttribute("categories", categList);
		request.setAttribute("images", imgList);
		
		RequestDispatcher req = request.getRequestDispatcher("/JSPafficheCategorie.jsp");
		req.forward(request, response);
		
		HibernateTools.closeSession();

	}

}
