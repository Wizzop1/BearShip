package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.Session;

@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("uname");
		String password = request.getParameter("psw");
		String role = request.getParameter("role");
		String money = request.getParameter("money");
		String id = request.getParameter("id");
		
		doGet(request, response);
		try {
			Connection con;
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/loginschema","root","t0d33oRzoo3i2P");
			System.out.println("Connected Login part");

			String sql = "select * from loginschema.register where username=? and password=? and role=?";
			String sql2 = "select * from loginschema.register where money=?";
			String sql3 = "select * from loginschema.register where id=?";
			PreparedStatement ps2 = con.prepareStatement(sql2);
			ps2.setString(1, money);
			PreparedStatement ps3 = con.prepareStatement(sql3);
			ps3.setString(1, id);
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, username);
			ps.setString(2, password);
			ps.setString(3, role);
			String unameDB="";
			String passDB="";
			String roleDB="";
			String moneyDB="";
			String idDB="";
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				unameDB = rs.getString("username");
				passDB = rs.getString("password");
				roleDB= rs.getString("role");
				moneyDB = rs.getString("money");
				idDB = rs.getString("id");
			}
			if(username.equals(unameDB) && password.equals(passDB) && role.equals(roleDB)) {
				System.out.println("we in boi");
				HttpSession session = request.getSession();
				session.setAttribute("username", username);
				session.setAttribute("role", role);
				session.setAttribute("money2", moneyDB);
				session.setAttribute("password2", passDB);
				session.setAttribute("id", idDB);
				RequestDispatcher rd = request.getRequestDispatcher("landing.jsp");
				rd.forward(request, response);
			}else {
				System.out.println("failure");
				RequestDispatcher rd = request.getRequestDispatcher("error.jsp");
				rd.forward(request, response);
			}			
			
		
		} catch (Exception e) {
			System.out.println("ERROR FROM LOGIN PART ::" + e.getMessage());
		}
	}

}
