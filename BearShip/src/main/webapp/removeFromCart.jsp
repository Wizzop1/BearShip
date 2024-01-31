<%@page import="java.sql.*"%>
<%@ include file="navbar.jsp" %>
<% String user_id=Id;
String product_id=request.getParameter("id");
try{
	Connection con;
	Class.forName("com.mysql.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/loginschema","root","t0d33oRzoo3i2P");
	Statement stat = null;
	ResultSet res = null;
	stat= con.createStatement();
	stat.executeUpdate("delete from cart where user_id='"+Id+"' and products_id='"+product_id+"'");
	response.sendRedirect("cart.jsp?id="+Id);

}catch(Exception e){
	out.println(e);
}
%>