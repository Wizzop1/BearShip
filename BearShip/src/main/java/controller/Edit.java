package controller;

import java.io.IOException;
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
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Edit
 */
@WebServlet("/edit")
public class Edit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Edit() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		String Money = (String) session.getAttribute("money2");
		String OldPass = (String) session.getAttribute("password2");
		String passcheck=OldPass;
		System.out.println(Money);
		Statement stat = null;
		ResultSet res = null;
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String fname = request.getParameter("fname");
		String username = request.getParameter("uname");
		String email = request.getParameter("email");
		String gender = request.getParameter("gender");
		String password = request.getParameter("newpassword");
		String phonenumber = request.getParameter("tel");
		String address = request.getParameter("address");
		String money = request.getParameter("money");
		String role = request.getParameter("role");
		String id=request.getParameter("id");
		System.out.println(passcheck);
		System.out.println(password);
		try {
			Connection con;
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/loginschema","root","t0d33oRzoo3i2P");
			System.out.println("Connected");
			if(username!=null && email!=null && password!=null && phonenumber!=null &&address!=null&&money!=null){
				String sql="update loginschema.register set fullname=?, username=?, gender=?, email=?, password=? , money=?,phonenumber=?,address=?, role=? where id='"+id+"'";
				PreparedStatement stmt = con.prepareStatement(sql);
				stmt.setString(1, fname);
				stmt.setString(2, username);
				stmt.setString(3, gender);
				stmt.setString(4, email);
				stmt.setString(5, password);
				stmt.setString(6, money);
				stmt.setString(7, phonenumber);
				stmt.setString(8, address);
				stmt.setString(9, role);
				stmt.executeUpdate();
			RequestDispatcher rd = request.getRequestDispatcher("management.jsp");
			rd.forward(request, response);
			}} catch (Exception e) {
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
