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
 * Servlet implementation class Useredit
 */
@WebServlet("/useredit")
public class Useredit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Useredit() {
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
		String username = request.getParameter("uname");
		String email = request.getParameter("email");
		String oldpassword = request.getParameter("oldpassword");
		String password = request.getParameter("newpassword");
		String cfnpassword = request.getParameter("confirmpassword");
		String phonenumber = request.getParameter("tel");
		String address = request.getParameter("address");
		String money = request.getParameter("money");
		String id=request.getParameter("id");
		System.out.println(passcheck);
		System.out.println(password);
		if(password.equals(cfnpassword) && passcheck.equals(oldpassword)) {
			String rightPassword = password;
			String oldmoney= Money;
		try {
			Connection con;
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/loginschema","root","t0d33oRzoo3i2P");
			System.out.println("Connected");
			if(username!=null && email!=null && password!=null && cfnpassword!=null&& phonenumber!=null &&address!=null&&money!=null){
				
				int sum = Integer.parseInt(oldmoney) + Integer.parseInt(money);
				String summoney = String.valueOf(sum);
				String sql="update loginschema.register set username=?, email=?, password=? , money=?,phonenumber=?,address=? where id='"+id+"'";
				PreparedStatement stmt = con.prepareStatement(sql);
				stmt.setString(1, username);
				stmt.setString(2, email);
				stmt.setString(3, rightPassword);
				stmt.setString(4, summoney);
				stmt.setString(5, phonenumber);
				stmt.setString(6, address);
				stmt.executeUpdate();
			RequestDispatcher rd = request.getRequestDispatcher("landing.jsp");
			rd.forward(request, response);
			}} catch (Exception e) {
		System.out.println("Error ::" + e.getMessage());
		}
		
		}
		else {
			RequestDispatcher rd = request.getRequestDispatcher("error.jsp");
			rd.forward(request, response);
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
