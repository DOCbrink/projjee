package com.projjee;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Query;
import org.hibernate.Session;

/**
 * Servlet implementation class SRVLTLinkToAccueil
 */
@WebServlet("/SRVLTLinkToAccueil")
public class SRVLTLinkToAccueil extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SRVLTLinkToAccueil() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Session session = HibernateTools.currentSession();
		session.beginTransaction();
		
		Query q = session.createQuery("from Image Order by imageDateAjout DESC");
		q.setMaxResults(16);
		ArrayList<Image> imgList = (ArrayList<Image>)q.list();

		HibernateTools.closeSession();
		
		request.setAttribute("imgList", imgList);
		
		RequestDispatcher req = request.getRequestDispatcher("/accueil.jsp");
		req.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Session session = HibernateTools.currentSession();
		session.beginTransaction();
		
		Query q = session.createQuery("from Image Order by imageDateAjout DESC");
		q.setMaxResults(16);
		ArrayList<Image> imgList = (ArrayList<Image>)q.list();

		request.setAttribute("imgList", imgList);
		
		HibernateTools.closeSession();
		
		RequestDispatcher req = request.getRequestDispatcher("/accueil.jsp");
		req.forward(request, response);
	
	}

}
