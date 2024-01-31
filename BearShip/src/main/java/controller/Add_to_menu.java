package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Add_to_menu
 */
@WebServlet("/add_to_menu")
public class Add_to_menu extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Add_to_menu() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String in1 = request.getParameter("in1");
		String typ1 = request.getParameter("typ1");
		String ii1 = request.getParameter("ii1");
		String p1 = request.getParameter("p1");
		String q1 = request.getParameter("q1");
		String rid = request.getParameter("rid");
		String weig1 = request.getParameter("we1");
		try {
			Connection con;
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/loginschema","root","t0d33oRzoo3i2P");
			System.out.println("Connected");
			String sql="insert into loginschema.restaurantsmenu(food_name,type,image,price,quantity,rest_iid,weight) values (?,?,?,?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, in1);
			ps.setString(2, typ1);
			ps.setString(3, ii1);
			ps.setString(4, p1);
			ps.setString(5, q1);
			ps.setString(6, rid);
			ps.setString(7, weig1);
			ps.executeUpdate(); 
			RequestDispatcher rd = request.getRequestDispatcher("restaurants.jsp");
			rd.forward(request, response);
		} catch (Exception e) {
		System.out.println("Error ::" + e.getMessage());
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
