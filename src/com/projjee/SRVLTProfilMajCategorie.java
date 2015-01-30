package com.projjee;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 * Servlet implementation class SRVLTProfilMajCategorie
 */
@WebServlet("/SRVLTProfilMajCategorie")
public class SRVLTProfilMajCategorie extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SRVLTProfilMajCategorie() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher req = request.getRequestDispatcher("/index.jsp");
		
		Session session = HibernateTools.currentSession();
		Transaction tx = session.beginTransaction();
		
		if (isNumeric(request.getParameter("categModif")))
		{
			Categorie categus = (Categorie)session.load("com.projjee.Categorie", request.getParameter("categModif"));
			
			request.setAttribute("categories", categus);
			req = request.getRequestDispatcher("/JSPProfile.jsp");
		}
		
		else
		{
			request.setAttribute("status", "FAIL");
			request.setAttribute("message", "ne joue pas avec l'url !");
			req = request.getRequestDispatcher("/index.jsp");
		}
		
		req.forward(request, response);
		
		HibernateTools.closeSession();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}
	
	public static boolean isNumeric(String str)  
	{  
		try  
		{  
			double d = Double.parseDouble(str);  
		} catch(NumberFormatException nfe) {  
			return false;  
		}  
		return true;  
	}

}
