package com.projjee;

import java.io.IOException;
import java.text.DecimalFormat;
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
		String idImg = (String)request.getParameter("img");
		
		Session session = HibernateTools.currentSession();
		Transaction tx = session.beginTransaction();
		
		RequestDispatcher req;
		
		double decimal = 0;
		DecimalFormat sizeImgDecimal = new DecimalFormat("#.00");
		
		if (isNumeric(idImg))
		{
			Image img = (Image)session.load("com.projjee.Image", Integer.parseInt(idImg));
			
			ArrayList<Commentaire> tabCom = (ArrayList<Commentaire>)session.createQuery("From Commentaire where image.idImage="+idImg+" ORDER BY comDateAjout DESC").list();
			
			if (isNumeric(img.getImageNbView()+""))
				img.setImageNbView(img.getImageNbView()+1);
			else
				img.setImageNbView(1);
			
			if (img.getImageSize() < 1024)
				request.setAttribute("size", img.getImageSize()+"octets");
			else if (img.getImageSize() > 1024 && img.getImageSize() < 1048576)
			{
				decimal = img.getImageSize()/1024;
				request.setAttribute("size", sizeImgDecimal.format(decimal)+"Ko");
			}
			else if (img.getImageSize() > 1048576 && img.getImageSize() < 1073741824)
			{
				decimal = img.getImageSize()/1048576;
				request.setAttribute("size", sizeImgDecimal.format(decimal)+"Mo");
			}	
			else if (img.getImageSize() > 1073741824)
			{
				decimal = img.getImageSize()/1073741824;
				request.setAttribute("size", sizeImgDecimal.format(decimal)+"Go");
			}	
			
			request.setAttribute("nbComm", img.getCommentaires().size()+"");
			request.setAttribute("img", img);
			request.setAttribute("com", tabCom);
			
			
			req = request.getRequestDispatcher("/JSPAfficheImage.jsp");
		}
		
		else
		{
			request.setAttribute("status", "FAIL");
			request.setAttribute("message", "erreur load image");
			req = request.getRequestDispatcher("/accueil.jsp");
		}
		
		req.forward(request, response);
		
		tx.commit();
		HibernateTools.closeSession();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
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
