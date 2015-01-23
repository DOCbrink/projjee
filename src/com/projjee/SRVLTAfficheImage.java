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
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

/**
 * Servlet implementation class AfficheImage
 */
@WebServlet("/SRVLTAfficheImage")
public class SRVLTAfficheImage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SRVLTAfficheImage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList <Image> categImage;
		
		System.out.println("Id (get) de la catégorie choisis : all");
		
		Session session = HibernateTools.currentSession(); 

		categImage = (ArrayList)session.createQuery("from Image").list();
		
		HibernateTools.closeSession();
		request.setAttribute("images", categImage);/**/
		
		RequestDispatcher req = request.getRequestDispatcher("/JSPafficheImage.jsp");
		req.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idcategorie = request.getParameter("choosenCategorie");
		ArrayList <Image> categImage;
		
		System.out.println("Id (post) de la catégorie choisis : "+idcategorie);
		
		Session session = HibernateTools.currentSession(); 
		
		if (idcategorie.equals("all"))
			categImage = (ArrayList)session.createQuery("from Image").list();
		else
			categImage = (ArrayList)session.createQuery("from Image where categorie.idCategorie="+idcategorie).list();
		
		HibernateTools.closeSession();
		request.setAttribute("images", categImage);/**/
		
		RequestDispatcher req = request.getRequestDispatcher("/JSPafficheImage.jsp");
		req.forward(request, response);
	}

}
