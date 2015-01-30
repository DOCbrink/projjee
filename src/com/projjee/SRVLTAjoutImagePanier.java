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

/**
 * Servlet implementation class SRVLTAjoutImagePanier
 */
@WebServlet("/SRVLTAjoutImagePanier")
public class SRVLTAjoutImagePanier extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SRVLTAjoutImagePanier() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession sessionS = request.getSession();
		String idImg = request.getParameter("idImg");
		String redirection = "";
		
		ArrayList<Integer> panier;
		int newAjout = 0;
		
		if (isNumeric(idImg))
		{
			newAjout = Integer.parseInt(idImg);
			
			if(null == sessionS.getAttribute("panier"))
			{
				panier = new ArrayList<Integer>();
				sessionS.setAttribute("panier", panier);
			}
			
			panier = (ArrayList<Integer>)sessionS.getAttribute("panier");
			
			if (panier.contains(newAjout)) {
				request.setAttribute("status", "FAIL");
				request.setAttribute("message", "Le panier contient déjà cette image !");	
			}
			
			else
			{
				panier.add(newAjout);
				request.setAttribute("status", "SUCCESS");
				request.setAttribute("message", "Image ajoutée !");	
				sessionS.setAttribute("panier", panier);
			}
			
			redirection = "http://localhost:8080/projjee/SRVLTAfficheImage?img="+idImg;
		}
		else
		{
			request.setAttribute("status", "FAIL");
			request.setAttribute("message", "Ne jouez pas avec l'url !");	
			redirection = "http://localhost:8080/projjee/SRVLTAfficheImageParTrie?categ=new";
		}
		
		System.out.println(toString((ArrayList<Integer>)sessionS.getAttribute("panier")));
		
		response.sendRedirect(redirection);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession sessionS = request.getSession();
		String idImg = request.getParameter("idImg");
		String redirection = "";
		
		ArrayList<Integer> panier;
		int newAjout = 0;
		
		if (isNumeric(idImg))
		{
			newAjout = Integer.parseInt(idImg);
			
			if(null == sessionS.getAttribute("panier"))
			{
				panier = new ArrayList<Integer>();
				sessionS.setAttribute("panier", panier);
			}
			
			panier = (ArrayList<Integer>)sessionS.getAttribute("panier");
			
			if (panier.contains(newAjout)) {
				request.setAttribute("status", "FAIL");
				request.setAttribute("message", "Le panier contient déjà cette image !");	
			}
			
			else
			{
				panier.add(newAjout);
				request.setAttribute("status", "SUCCESS");
				request.setAttribute("message", "Image ajoutée !");	
				sessionS.setAttribute("panier", panier);
			}
			
			redirection = "http://localhost:8080/projjee/SRVLTAfficheImage?img="+idImg;
		}
		else
		{
			request.setAttribute("status", "FAIL");
			request.setAttribute("message", "Ne jouez pas avec l'url !");	
			redirection = "http://localhost:8080/projjee/SRVLTAfficheImageParTrie?categ=new";
		}
		
		System.out.println(toString((ArrayList<Integer>)sessionS.getAttribute("panier")));
		
		response.sendRedirect(redirection);
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
	
	public String toString(ArrayList<Integer> test)
	{
		String chaine = "";
		for (int pt : test)
		{
			chaine = chaine+" "+pt;
		}
		
		return chaine;
	}

}
