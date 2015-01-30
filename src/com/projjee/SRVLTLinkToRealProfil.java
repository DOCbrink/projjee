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

import org.hibernate.Session;

/**
 * Servlet implementation class SRVLTLinkToRealProfil
 */
@WebServlet("/SRVLTLinkToRealProfil")
public class SRVLTLinkToRealProfil extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SRVLTLinkToRealProfil() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession sessionS = request.getSession();
		
		Session session = HibernateTools.currentSession();
		session.beginTransaction();
		
		String parametre = request.getParameter("parametre");
		String parametre2 = request.getParameter("parametre");
		
		RequestDispatcher req = request.getRequestDispatcher("/index.jsp");
		
		if (sessionS.getAttribute("statusLogin") != null && sessionS.getAttribute("userco") != null)
		{
			if (sessionS.getAttribute("statusLogin") == "STATUS_OK")
			{
				User usertemp = (User)sessionS.getAttribute("userco");
				
				//pour rendre l'objet persistant
				User user = (User)session.load("com.projjee.User", usertemp.getIdUser());
				
				if (parametre==null)
				{
					request.setAttribute("parametre", "profil");
					parametre2 = "profil";
				}
				
				else if (parametre.equals("ImagesModif"))
				{
					if (isNumeric(request.getParameter("imgModif")))
					{
						Image img = (Image)session.load("com.projjee.Image", Integer.parseInt(request.getParameter("imgModif")));
						ArrayList<Categorie> categ = (ArrayList<Categorie>)session.createQuery("from Categorie").list();
						
						request.setAttribute("img", img);
						request.setAttribute("categ", categ);
						parametre2 = "imagesModif";
					}
					
					else
					{
						request.setAttribute("status", "FAIL");
						request.setAttribute("message", "ne joue pas avec l'url !");
						req = request.getRequestDispatcher("/index.jsp");
					}					
				}
				
				else if (parametre.equals("CategoriesModif"))
				{
					if (isNumeric(request.getParameter("categModif")))
					{
						Categorie categous = (Categorie)session.load("com.projjee.Categorie", Integer.parseInt(request.getParameter("categModif")));
						
						request.setAttribute("categ", categous);
						parametre2 = "categoriesModif";
					}
					
					else
					{
						request.setAttribute("status", "FAIL");
						request.setAttribute("message", "ne joue pas avec l'url !");
						req = request.getRequestDispatcher("/index.jsp");
					}					
				}
				
				else if (parametre.equals("CommentairesModif"))
				{
					if (isNumeric(request.getParameter("comModif")))
					{
						Commentaire coms = (Commentaire)session.load("com.projjee.Commentaire", Integer.parseInt(request.getParameter("comModif")));
						
						request.setAttribute("coms", coms);
						parametre2 = "commentairesModif";
					}
					
					else
					{
						request.setAttribute("status", "FAIL");
						request.setAttribute("message", "ne joue pas avec l'url !");
						req = request.getRequestDispatcher("/index.jsp");
					}					
				}
				
				else
				{
					parametre2 = request.getParameter("parametre");
				}
					

				request.setAttribute("userInfo", user);
				request.setAttribute("parametre", parametre2);
				
				req = request.getRequestDispatcher("/JSPProfile.jsp");
			}
			
			else
			{
				request.setAttribute("status", "FAIL");
				request.setAttribute("message", "Vous devez être connecté(e) pour acceder à cette partie du site.");
				System.out.println("pb1");
			}
		}
		
		else
		{
			request.setAttribute("status", "FAIL");
			request.setAttribute("message", "Vous devez être connecté(e) pour acceder à cette partie du site.");
			System.out.println("pb2");
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
