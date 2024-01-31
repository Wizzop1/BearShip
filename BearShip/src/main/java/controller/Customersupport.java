package controller;

import java.io.IOException;
import java.io.PrintWriter;
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
 * Servlet implementation class Customersupport
 */
@WebServlet("/contacts")
public class Customersupport extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Customersupport() {
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
		
		String supportfullname = request.getParameter("supportfullname1");
		String supportemail = request.getParameter("supportemail1");
		String supportpnumber = request.getParameter("supportpnumber1");
		String supportmessage = request.getParameter("supportmessage1");

		
		try {
			Connection con;
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/loginschema","root","t0d33oRzoo3i2P");
			System.out.println("Connected");
			String sql="insert into loginschema.customersupport(supportfullname, supportemail, supportpnumber, supportmessage) values (?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, supportfullname);
			ps.setString(2, supportemail);
			ps.setString(3, supportpnumber);
			ps.setString(4, supportmessage);
			ps.executeUpdate();
			RequestDispatcher rd = request.getRequestDispatcher("landing.jsp");
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
