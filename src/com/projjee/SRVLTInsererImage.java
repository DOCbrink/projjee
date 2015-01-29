package com.projjee;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.util.*;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FileUtils;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 * Servlet implementation class SRVLTInsererImage
 */
@WebServlet("/SRVLTInsererImage")
public class SRVLTInsererImage extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private boolean isMultipart;
	private String filePath;
	private int maxFileSize = 1080 * 1920;
	private int maxMemSize = 4 * 1024;
	private File file ;

	public void init( ){
		// Get the file location where it would be stored.
		filePath = getServletContext().getInitParameter("file-upload"); 
	}
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SRVLTInsererImage() {
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
		String userstatus = (String)sessionS.getAttribute("statusLogin");
		
		Session session = HibernateTools.currentSession(); 
		
		Transaction tx = session.beginTransaction();
		
		Query q = session.createQuery("from Image Order by imageDateAjout DESC");
		q.setMaxResults(16);
		ArrayList<Image> imgList = (ArrayList<Image>)q.list();

		request.setAttribute("imgList", imgList);
		
		String idcategorie = "null";
		String nomImage = "Pas de titre";
		String descImage = "Pas de description";
		String urlImage = "nullurl";
		String dimensionImage = "nulldim";
		
		String ThefileName = "";
		long ThefileSize = 0;
		FileItem fi_sauv = null;
		
		isMultipart = ServletFileUpload.isMultipartContent(request);
		response.setContentType("text/html");
		
		if( !isMultipart ){
			request.setAttribute("status", "FAIL");
			request.setAttribute("message", "Veuillez ne pas changer le type du formulaire. Cimer gros.");
		}
		
		else
		{
			DiskFileItemFactory factory = new DiskFileItemFactory();
			factory.setSizeThreshold(maxMemSize);
			factory.setRepository(new File("c:\\temp"));
	
			ServletFileUpload upload = new ServletFileUpload(factory);
			upload.setSizeMax( maxFileSize );
	
			try{ 
				List fileItems = upload.parseRequest(request);
				Iterator i = fileItems.iterator();
				
				while ( i.hasNext () ) 
				{
					FileItem fi = (FileItem)i.next();
					if ( !fi.isFormField () )
					{
						ThefileName = fi.getName();
						ThefileSize = fi.getSize();
						fi_sauv = fi;
					}
					
					else 
					{
						String fieldname = fi.getFieldName();
				        String fieldvalue = fi.getString();

						if (fieldname.equals("id_categorie"))
							idcategorie = fieldvalue;
						else if (fieldname.equals("nom_image"))
							nomImage = fieldvalue;
						else if (fieldname.equals("desc_image"))
							descImage = fieldvalue;	
						
					}	
				}
				
				//Test si l'image existe déjà
				ArrayList<Image> testimg = (ArrayList<Image>)session.createQuery("from Image where urlImage='"+ThefileName+"'").list();

				if (testimg.size() == 0)
				{
					//Si l'image n'existe pas
					if (userstatus.equals("STATUS_OK"))
					{
						BufferedImage bimg;
						//Ecriture physique 
						if( ThefileName.lastIndexOf("\\") >= 0 ){
							file = new File( filePath + ThefileName.substring( ThefileName.lastIndexOf("\\"))) ;
						}else{
							file = new File( filePath + ThefileName.substring(ThefileName.lastIndexOf("\\")+1)) ;
						}
						
						urlImage = file.getName();
						fi_sauv.write( file ) ;
						
						bimg = ImageIO.read(file);	
						int width = bimg.getWidth();
						int height = bimg.getHeight();
						
						dimensionImage = ""+width+"x"+height+"";
	
						//Ajout en BDD					
						User user = (User)sessionS.getAttribute("userco");
						
						Image tempImg = new Image(user,
							(Categorie)session.get("com.projjee.Categorie", Integer.parseInt(idcategorie)), 
							urlImage, 
							nomImage, 
							descImage,
							ThefileSize,
							dimensionImage);
						
						session.save(tempImg);
						
						tx.commit();
						
						//Copie de l'image dans le dossier du projet
						File source = new File("C:\\Users\\lfaviere\\workspace2\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\projjee\\image\\"+urlImage);
				        File dest = new File("C:\\Users\\lfaviere\\workspace2\\projjee\\WebContent\\image\\"+urlImage);
				        
				        try {
				            FileUtils.copyFile(source, dest);
				        } catch (IOException e) {
				            e.printStackTrace();
				        }
						
						
						//message de SUCCESS
						request.setAttribute("status", "SUCCESS");
						request.setAttribute("message", "Image Ajoutée !");
					}	
					
					else
					{
						//message de SUCCESS
						request.setAttribute("status", "FAIL");
						request.setAttribute("message", "Vous devez être connecté(e) pour ajouter une image !");
					}
				}
				
				else 
				{
					request.setAttribute("status", "FAIL");
					request.setAttribute("message", "Une image de ce nom à déjà été ajoutée");
				}
				
				HibernateTools.closeSession();
				
			} catch(Exception ex) {
				System.out.println(ex);
				request.setAttribute("status", "FAIL");
				request.setAttribute("message", "Erreur veuillez recommencer.");
				
				tx.rollback();
			} 
		}
		
		RequestDispatcher req = request.getRequestDispatcher("/accueil.jsp");
		req.forward(request, response);
	}
}
