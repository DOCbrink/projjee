package com.projjee;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class SRVLTRemoveImagePanier
 */
@WebServlet("/SRVLTRemoveImagePanier")
public class SRVLTRemoveImagePanier extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SRVLTRemoveImagePanier() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession sessionS = request.getSession();
		String redirection = "";
		
		if (request.getParameter("idImg")==null)
		{
			request.setAttribute("status", "FAIL");
			request.setAttribute("message", "Ne jouez pas avec l'url !");	
			redirection = "http://localhost:8080/projjee/SRVLTAfficheImageParTrie?categ=new";
		}
		
		else
		{
			String idImg = request.getParameter("idImg");
			
			ArrayList<Integer> panier;
			int enleveImage = 0;
			int indexImg = 0;
			
			if (isNumeric(idImg))
			{
				enleveImage = Integer.parseInt(idImg);
				
				if(null == sessionS.getAttribute("panier"))
				{
					request.setAttribute("status", "FAIL");
					request.setAttribute("message", "Panier inexistant, donc pas de suppression d'image dans celui ci.");	
				}
				
				else 
				{
					panier = (ArrayList<Integer>)sessionS.getAttribute("panier");
					
					if (panier.contains(enleveImage)) 
					{
						indexImg = panier.indexOf(enleveImage);
						panier.remove(indexImg);
						
						if (panier.size()==0)
							sessionS.removeAttribute("panier");
					}
					
					else
					{
						request.setAttribute("status", "FAIL");
						request.setAttribute("message", "L'image n'existe pas dans ce panier");	
					}				
					
					redirection = "http://localhost:8080/projjee/SRVLTLinkAndCreationPanier";
				}
			}
			else
			{
				request.setAttribute("status", "FAIL");
				request.setAttribute("message", "Ne jouez pas avec l'url !");	
				redirection = "http://localhost:8080/projjee/SRVLTAfficheImageParTrie?categ=new";
			}
			
			//System.out.println(toString((ArrayList<Integer>)sessionS.getAttribute("panier")));
		}

		response.sendRedirect(redirection);
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
