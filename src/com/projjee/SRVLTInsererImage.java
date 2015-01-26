package com.projjee;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.*;
import java.util.*;

import javax.servlet.ServletConfig;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.output.*;
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
	private int maxFileSize = 1024 * 1024;
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
		// Check that we have a file upload request		
		Session session = HibernateTools.currentSession(); 
		
		String idcategorie = "null";
		String nomImage = "Pas de titre";
		String descImage = "Pas de description";
		String urlImage = "nullurl";
		
		isMultipart = ServletFileUpload.isMultipartContent(request);
		response.setContentType("text/html");
		java.io.PrintWriter out = response.getWriter( );
		if( !isMultipart ){
			//redirection vers jsp de "pas d'upload"
			
			out.println("<html>");
			out.println("<head>");
			out.println("<title>Servlet upload</title>");  
			out.println("</head>");
			out.println("<body>");
			out.println("<p>No file uploaded</p>"); 
			out.println("</body>");
			out.println("</html>");
			return;
		}
		DiskFileItemFactory factory = new DiskFileItemFactory();
		// maximum size that will be stored in memory
		factory.setSizeThreshold(maxMemSize);
		// Location to save data that is larger than maxMemSize.
		factory.setRepository(new File("c:\\temp"));

		// Create a new file upload handler
		ServletFileUpload upload = new ServletFileUpload(factory);
		// maximum file size to be uploaded.
		upload.setSizeMax( maxFileSize );

		try{ 
			// Parse the request to get file items.
			List fileItems = upload.parseRequest(request);
		
			// Process the uploaded file items
			Iterator i = fileItems.iterator();
			

			while ( i.hasNext () ) 
			{
				FileItem fi = (FileItem)i.next();
				if ( !fi.isFormField () )	
				{
					// Get the uploaded file parameters
					String fieldName = fi.getFieldName();
					String fileName = fi.getName();
					String contentType = fi.getContentType();
					boolean isInMemory = fi.isInMemory();
					long sizeInBytes = fi.getSize();
					// Write the file
					if( fileName.lastIndexOf("\\") >= 0 ){
						file = new File( filePath + fileName.substring( fileName.lastIndexOf("\\"))) ;
					}else{
						file = new File( filePath + fileName.substring(fileName.lastIndexOf("\\")+1)) ;
					}
					urlImage = file.getName();
					fi.write( file ) ;
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
			
			File source = new File("C:\\Users\\lfaviere\\workspace2\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\projjee\\image\\"+urlImage);
	        File dest = new File("C:\\Users\\lfaviere\\workspace2\\projjee\\WebContent\\image\\"+urlImage);
	        
	        try {
	            FileUtils.copyFile(source, dest);
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
			
			Transaction tx = session.beginTransaction();
			
			Image temp = new Image((User)session.get("com.projjee.User", 1), 
									(Categorie)session.get("com.projjee.Categorie", Integer.parseInt(idcategorie)), 
									urlImage, 
									nomImage, 
									descImage);
			
			session.save(temp);
			
			tx.commit();
			
			HibernateTools.closeSession();
			
			RequestDispatcher req = request.getRequestDispatcher("/index.jsp");
			req.forward(request, response);
			
		}catch(Exception ex) {
			System.out.println(ex);
		}
	}
}
