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
import org.hibernate.Transaction;

/**
 * Servlet implementation class SRVLTAfficheImageParTrie
 */
@WebServlet("/SRVLTAfficheImageParTrie")
public class SRVLTAfficheImageParTrie extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SRVLTAfficheImageParTrie() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Session session = HibernateTools.currentSession();
		Transaction tx = session.beginTransaction();
		
		ArrayList<Image> imgList;
		ArrayList <Categorie> categList = (ArrayList)session.createQuery("from Categorie").list();
		
		String typeTrie = (String)request.getParameter("categ");
		
		if (isNumeric(typeTrie))
		{
			imgList = (ArrayList<Image>)session.createQuery("from Image where categorie.idCategorie="+Integer.parseInt(typeTrie)+"").list();
		}
		
		else if (typeTrie.equals("new"))
			imgList = (ArrayList<Image>)session.createQuery("from Image ORDER BY imageDateAjout DESC").list();
		else if (typeTrie.equals("nom"))
			imgList = (ArrayList<Image>)session.createQuery("from Image ORDER BY nomImage ASC").list();
		else if (typeTrie.equals("taille"))
			imgList = (ArrayList<Image>)session.createQuery("from Image ORDER BY imageSize ASC").list();		
		else
			imgList = (ArrayList<Image>)session.createQuery("from Image where user.loginUser like '%"+typeTrie+"%' or nomImage like '%"+typeTrie+"%' or descriptionImage like '%"+typeTrie+"%'").list();
		
		
		if (imgList.size() == 0)
		{
			request.setAttribute("status", "FAIL");
			request.setAttribute("message", "Aucune image à afficher");
		}
		
		else
		{
			request.setAttribute("images", imgList);
		}
		
		request.setAttribute("categories", categList);
		
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
		
		ArrayList<Image> imgList;
		ArrayList <Categorie> categList = (ArrayList)session.createQuery("from Categorie").list();
		
		String typeTrie = (String)request.getParameter("categ");
		
		if (isNumeric(typeTrie))
		{
			imgList = (ArrayList<Image>)session.createQuery("from Image where categorie.idCategorie="+Integer.parseInt(typeTrie)+"").list();
		}
		
		else if (typeTrie.equals("new"))
			imgList = (ArrayList<Image>)session.createQuery("from Image ORDER BY imageDateAjout DESC").list();
		else if (typeTrie.equals("nom"))
			imgList = (ArrayList<Image>)session.createQuery("from Image ORDER BY nomImage ASC").list();
		else if (typeTrie.equals("taille"))
			imgList = (ArrayList<Image>)session.createQuery("from Image ORDER BY imageSize ASC").list();		
		else
			imgList = (ArrayList<Image>)session.createQuery("from Image where nomImage like '%"+typeTrie+"%' or descriptionImage like '%"+typeTrie+"%'").list();
		
		
		if (imgList.size() == 0)
		{
			request.setAttribute("status", "FAIL");
			request.setAttribute("message", "Aucune image à afficher");
		}
		
		else
		{
			request.setAttribute("categories", categList);
			request.setAttribute("images", imgList);
		}
		
		RequestDispatcher req = request.getRequestDispatcher("/JSPafficheCategorie.jsp");
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
