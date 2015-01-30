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

/**
 * Servlet implementation class SRVLTLinkToProfile
 */
@WebServlet("/SRVLTLinkToProfile")
public class SRVLTLinkToProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SRVLTLinkToProfile() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Session session = HibernateTools.currentSession(); 
		String idUser = (String)request.getParameter("idUser");
		
		if (isNumeric(idUser))
		{
			User user = (User)session.load("com.projjee.User", Integer.parseInt(idUser));
			ArrayList <Image> imgUser = (ArrayList)session.createQuery("from Image where user.idUser="+idUser+" ORDER BY imageDateAjout").list();
					
			if (imgUser.size()==0)
			{
				request.setAttribute("status", "FAIL");
				request.setAttribute("message", "L'utilisateur "+user.getLoginUser()+" n'a pas encore ajout�(e) d'image");
			}
			
			else
			{
				request.setAttribute("imgUser", imgUser);
				request.setAttribute("userprofile", user);
			}
		}
		
		else
		{
			request.setAttribute("status", "FAIL");
			request.setAttribute("message", "Faites pas nimp avec l'url !");
		}
		
		RequestDispatcher req = request.getRequestDispatcher("/JSPAfficherProfile.jsp");
		req.forward(request, response);
		
		HibernateTools.closeSession();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Session session = HibernateTools.currentSession(); 
		String idUser = (String)request.getParameter("idUser");
		
		if (isNumeric(idUser))
		{
			User user = (User)session.load("com.projjee.User", Integer.parseInt(idUser));
			ArrayList <Image> imgUser = (ArrayList)session.createQuery("from Image where user.idUser="+idUser+" ORDER BY imageDateAjout").list();
					
			if (imgUser.size()==0)
			{
				request.setAttribute("status", "FAIL");
				request.setAttribute("message", "L'utilisateur "+user.getLoginUser()+" n'a pas encore ajouté(e) d'image");
			}
			
			else
			{
				request.setAttribute("imgUser", imgUser);
				request.setAttribute("userprofile", user);
			}
		}
		
		else
		{
			request.setAttribute("status", "FAIL");
			request.setAttribute("message", "Faites pas nimp avec l'url !");
		}
		
		RequestDispatcher req = request.getRequestDispatcher("/JSPAfficherProfile.jsp");
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
