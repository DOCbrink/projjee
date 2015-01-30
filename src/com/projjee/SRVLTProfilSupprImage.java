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
 * Servlet implementation class SRVLTProfilSupprImage
 */
@WebServlet("/SRVLTProfilSupprImage")
public class SRVLTProfilSupprImage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SRVLTProfilSupprImage() {
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
		
		String idImg = request.getParameter("idImg");
		
		System.out.println(idImg);
		System.out.println("coucou");
		
		if (sessionS.getAttribute("statusLogin") != null && sessionS.getAttribute("userco") != null)
		{
			if (sessionS.getAttribute("statusLogin") == "STATUS_OK")
			{
				Image curImg = (Image)session.load("com.projjee.Image", Integer.parseInt(idImg));
				
				User user = (User)sessionS.getAttribute("userco");
				int idUser = user.getIdUser();
				
				//pour rendre persistant
				user = (User)session.load("com.projjee.User", idUser);
				
				session.delete(curImg);
				
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
