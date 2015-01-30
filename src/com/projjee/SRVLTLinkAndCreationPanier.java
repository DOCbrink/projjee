package com.projjee;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.PrintWriter;

import static java.lang.System.in;

import java.util.ArrayList;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.servlet.RequestDispatcher;

import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 * Servlet implementation class SRVLTLinkAndCreationPanier
 */
@WebServlet("/SRVLTLinkAndCreationPanier")
public class SRVLTLinkAndCreationPanier extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SRVLTLinkAndCreationPanier() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession sessionS = request.getSession();
		
		Session session = HibernateTools.currentSession();
		Transaction tx = session.beginTransaction();
		
		ArrayList<Image> listImage = new ArrayList<Image>();
		
		String UPLOAD_DIRECTORY = "C:\\Users\\lfaviere\\workspace2\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\projjee\\download\\";
		String IMAGE_DIRECTORY = "C:\\Users\\lfaviere\\workspace2\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\projjee\\image\\";
		
		if (sessionS.getAttribute("panier")!=null)
		{
			ArrayList<Integer> idImg = (ArrayList<Integer>)sessionS.getAttribute("panier");
			
			if (idImg.size()==0)
			{
				request.setAttribute("status", "FAIL");
				request.setAttribute("message", "Pas d'image dans le panier !");
			}
			
			else
			{
				try {
					listImage = new ArrayList<Image>();
					
					for (int temp : idImg)
					{
						Image tempImg = (Image)session.load("com.projjee.Image", temp);
						
						if (isNumeric(tempImg.getImageNbDl()+""))
							tempImg.setImageNbDl(tempImg.getImageNbDl()+1);
						else
							tempImg.setImageNbDl(1);
						
						listImage.add(tempImg);
						
						
					}
					
					tx.commit();
					
					List<FileInputStream> streamImg = new ArrayList<FileInputStream>();
			        ZipOutputStream zipArchive = new ZipOutputStream(new FileOutputStream(UPLOAD_DIRECTORY + "myImage"+sessionS.getCreationTime()+".zip"));
			        
			        for(Image imgTemp : listImage)
			        {
			        	streamImg.add(new FileInputStream(IMAGE_DIRECTORY + imgTemp.getUrlImage()));
			        	zipArchive.putNextEntry(new ZipEntry(imgTemp.getUrlImage()));

			        	byte[] b = new byte[1024];
				        int count;
				
				        for(FileInputStream in : streamImg)
				        {
				            while ((count = in.read(b)) > 0) {
				            	zipArchive.write(b, 0, count);
				            }
				        }
			        }
			        
			        zipArchive.close();
			        in.close(); 
			        
			        request.setAttribute("link", "myImage"+sessionS.getCreationTime()+".zip");
					request.setAttribute("imgchoosen", listImage);
				} catch (Exception e)
				{
					request.setAttribute("status", "FAIL");
					request.setAttribute("message", "La création de l'archive a échouée");
					
					System.out.println("erreur "+e);
				}
			}
		}
		
		else
		{
			request.setAttribute("status", "FAIL");
			request.setAttribute("message", "Pas d'image dans le panier !");
		}
		
		
		
		RequestDispatcher req = request.getRequestDispatcher("/JSPPanier.jsp");
		req.forward(request, response);
		
		HibernateTools.closeSession();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
HttpSession sessionS = request.getSession();
		
		Session session = HibernateTools.currentSession();
		Transaction tx = session.beginTransaction();
		
		ArrayList<Image> listImage = new ArrayList<Image>();
		
		String UPLOAD_DIRECTORY = "C:\\Users\\lfaviere\\workspace2\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\projjee\\download\\";
		String IMAGE_DIRECTORY = "C:\\Users\\lfaviere\\workspace2\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\projjee\\image\\";
		
		if (sessionS.getAttribute("panier")!=null)
		{
			ArrayList<Integer> idImg = (ArrayList<Integer>)sessionS.getAttribute("panier");
			
			if (idImg.size()==0)
			{
				request.setAttribute("status", "FAIL");
				request.setAttribute("message", "Pas d'image dans le panier !");
			}
			
			else
			{
				try {
					listImage = new ArrayList<Image>();
					
					for (int temp : idImg)
					{
						Image tempImg = (Image)session.load("com.projjee.Image", temp);
						
						if (isNumeric(tempImg.getImageNbDl()+""))
							tempImg.setImageNbDl(tempImg.getImageNbDl()+1);
						else
							tempImg.setImageNbDl(1);
						
						listImage.add(tempImg);
						
						
					}
					
					tx.commit();
					
					List<FileInputStream> streamImg = new ArrayList<FileInputStream>();
			        ZipOutputStream zipArchive = new ZipOutputStream(new FileOutputStream(UPLOAD_DIRECTORY + "myImage"+sessionS.getCreationTime()+".zip"));
			        
			        for(Image imgTemp : listImage)
			        {
			        	streamImg.add(new FileInputStream(IMAGE_DIRECTORY + imgTemp.getUrlImage()));
			        	zipArchive.putNextEntry(new ZipEntry(imgTemp.getUrlImage()));

			        	byte[] b = new byte[1024];
				        int count;
				
				        for(FileInputStream in : streamImg)
				        {
				            while ((count = in.read(b)) > 0) {
				            	zipArchive.write(b, 0, count);
				            }
				        }
			        }
			        
			        zipArchive.close();
			        in.close(); 
			        
			        request.setAttribute("link", "myImage"+sessionS.getCreationTime()+".zip");
					request.setAttribute("imgchoosen", listImage);
				} catch (Exception e)
				{
					request.setAttribute("status", "FAIL");
					request.setAttribute("message", "La création de l'archive a échouée");
					
					System.out.println("erreur "+e);
				}
			}
		}
		
		else
		{
			request.setAttribute("status", "FAIL");
			request.setAttribute("message", "Pas d'image dans le panier !");
		}
		
		
		
		RequestDispatcher req = request.getRequestDispatcher("/JSPPanier.jsp");
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
