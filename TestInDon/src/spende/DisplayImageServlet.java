package spende;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
 
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import benutzer.*;
import spende.*;
import datenbank.Datenbank;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DisplayImageServelet
 */
@WebServlet("/DisplayImageServlet")
public class DisplayImageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private String dbURL = "jdbc:mysql://server2.febas.net/InDon";
	private String dbUser = "InDonAdmin";
	private String dbPass = "InDon123";
	
	
    public DisplayImageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    private Spende getSpende(int id) throws SQLException {
    		return Datenbank.holeSpende(id);
    		
    		
        }
   

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = null;
	      try {
	          int id = 0;
	          try {
	              id = Integer.parseInt(request.getParameter("id"));
	          } catch (Exception e) {
	        	  	System.out.println("keine ID mitgegeben");
	          }
	          Spende spende = getSpende(id);
	 
	          if (spende.getBild().length == 0) {
	              // No record found, redirect to default image.
	              response.sendRedirect(request.getContextPath() + "/Images/noimage.gif");
	              return;
	          }
	        
	          // trump.jpg, putin.png
	          String imageFileName = "test.png";
	          System.out.println("File Name: "+ imageFileName);
	        
	          // image/jpg
	          // image/png
	          String contentType = this.getServletContext().getMimeType(imageFileName);
	          System.out.println("Content Type: "+ contentType);
	        
	          response.setHeader("Content-Type", contentType);
	        
	          response.setHeader("Content-Length", String.valueOf(spende.getBild().length));
	        
	          response.setHeader("Content-Disposition", "inline; filename=\"" + imageFileName + "\"");
	 
	          // Write image data to Response.
	          response.getOutputStream().write(spende.getBild());
	 
	      } catch (Exception e) {
	          throw new ServletException(e);
	      }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
