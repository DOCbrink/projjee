package com.projjee;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class SRVLTDeconnexion
 */
@WebServlet("/SRVLTDeconnexion")
public class SRVLTDeconnexion extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SRVLTDeconnexion() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession sessionS = request.getSession();
		
		try {
			sessionS.removeAttribute("statusLogin");
			sessionS.removeAttribute("userco");
			
			request.setAttribute("status", "SUCCESS");
			request.setAttribute("message", "Déconnecté(e)");
		} catch (Exception ex) {
			request.setAttribute("status", "FAIL");
			request.setAttribute("message", "La deconnexion à échoué. Contactez un admin.");
		}
		
		RequestDispatcher rqd = request.getRequestDispatcher("/index.jsp");
		rqd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession sessionS = request.getSession();
		
		try {
			sessionS.removeAttribute("statusLogin");
			sessionS.removeAttribute("userco");
			
			request.setAttribute("status", "SUCCESS");
			request.setAttribute("message", "Déconnecté(e)");
		} catch (Exception ex) {
			request.setAttribute("status", "FAIL");
			request.setAttribute("message", "La deconnexion à échoué. Contactez un admin.");
		}
		
		RequestDispatcher rqd = request.getRequestDispatcher("/index.jsp");
		rqd.forward(request, response);
	}

}
