package com.projjee;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 * Servlet implementation class SRVLTLinkToUploadImage
 */
@WebServlet("/SRVLTLinkToUploadImage")
public class SRVLTLinkToUploadImage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SRVLTLinkToUploadImage() {
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

		HibernateTools.closeSession();
		
		request.setAttribute("categories", categList);
		
		RequestDispatcher req = request.getRequestDispatcher("/JSPInsererImage.jsp");
		req.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Session session = HibernateTools.currentSession(); 
		Transaction tx = session.beginTransaction();
		   
		ArrayList <Categorie> categList = (ArrayList)session.createQuery("from Categorie").list();

		HibernateTools.closeSession();
		
		request.setAttribute("categories", categList);
		
		RequestDispatcher req = request.getRequestDispatcher("/JSPInsererImage.jsp");
		req.forward(request, response);
	}

}
