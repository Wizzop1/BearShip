package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Addnewrestaurant
 */
@WebServlet("/addNewRestaurant")
public class Addnewrestaurant extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Addnewrestaurant() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
	response.getWriter().append("Served at: ").append(request.getContextPath());
	String resname=request.getParameter("rn");
	String resdesc=request.getParameter("rd");
	String resaddress=request.getParameter("ra");
	String resimage=request.getParameter("ri");
	String resrating=request.getParameter("rr");
	String owner_id=request.getParameter("roi");
	try {
	Connection con;
	Class.forName("com.mysql.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/loginschema","root","t0d33oRzoo3i2P");
	Statement stat=null;
	ResultSet res=null;
	PreparedStatement stmt=null;				
		stat=con.createStatement();
	if(resname!=null && resdesc!=null && resaddress!=null && resimage!=null && resrating!=null&& owner_id!=null){
		String sql="insert into loginschema.restaurants(namerestaurants,descrestaurants,addressrestaurants,imagerestaurants,ratingrestaurants, owner_id) values (?,?,?,?,?,?)";
		PreparedStatement ps;
			ps = con.prepareStatement(sql);
			ps.setString(1, resname);
			ps.setString(2, resdesc);
			ps.setString(3, resaddress);
			ps.setString(4, resimage);
			ps.setString(5, resrating);
			ps.setString(6, owner_id);
			ps.executeUpdate();
			RequestDispatcher rd = request.getRequestDispatcher("restaurants.jsp");
			rd.forward(request, response);
	}
	}
	 catch (Exception e) {
		 System.out.println("Error ::" + e.getMessage());
			e.printStackTrace();
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
