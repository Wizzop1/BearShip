package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/addNew")
public class Addnew extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public Addnew() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String fullname = request.getParameter("fname");
		String username = request.getParameter("uname");
		String email = request.getParameter("email");
		String password = request.getParameter("psw");
		String cfnpassword = request.getParameter("cnfpsw");
		if(password.equals(cfnpassword)) {
			String rightPassword = password;
		
		String role = request.getParameter("role");
		String money = request.getParameter("money");
		String phonenumber = request.getParameter("tel");
		String address = request.getParameter("address");
		String gender = request.getParameter("gender");
		System.out.println(rightPassword);
		try {
			Connection con;
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/loginschema","root","t0d33oRzoo3i2P");
			System.out.println("Connected");
			String sql="insert into loginschema.register(fullname,username,email,password,role,money,phonenumber,address,gender) values (?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, fullname);
			ps.setString(2, username);
			ps.setString(3, email);
			ps.setString(4, rightPassword);
			ps.setString(5, role);
			ps.setString(6, money);
			ps.setString(7, phonenumber);
			ps.setString(8, address);
			ps.setString(9, gender);
			ps.executeUpdate();
			RequestDispatcher rd = request.getRequestDispatcher("management.jsp");
			rd.forward(request, response);
		} catch (Exception e) {
		System.out.println("Error ::" + e.getMessage());
		}
		
		}
		else {
			RequestDispatcher rd = request.getRequestDispatcher("error.jsp");
			rd.forward(request, response);
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);		
	}

}
