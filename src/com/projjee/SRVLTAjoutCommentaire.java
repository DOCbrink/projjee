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
 * Servlet implementation class SRVLTAjoutCommentaire
 */
@WebServlet("/SRVLTAjoutCommentaire")
public class SRVLTAjoutCommentaire extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SRVLTAjoutCommentaire() {
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
		
//		RequestDispatcher req;
		
		String idImg = (String)request.getParameter("image");
		String contentCom = (String)request.getParameter("com");
		
		Commentaire newCom = new Commentaire((Image)session.load("com.projjee.Image", Integer.parseInt(idImg)),
				(User)sessionS.getAttribute("userco"),												
				contentCom
				);
		
		session.save(newCom);
		tx.commit();
		
//		req = request.getRequestDispatcher("index.jsp");
//		req.forward(request, response);
		
		response.sendRedirect("http://localhost:8080/projjee/SRVLTAfficheImage?img="+idImg);
		
		HibernateTools.closeSession();
	}
}
