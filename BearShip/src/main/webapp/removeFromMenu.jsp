<%@page import="java.sql.*"%>
<%@ include file="navbar.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%

try{
	Connection con;
	Class.forName("com.mysql.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/loginschema","root","t0d33oRzoo3i2P");
	Statement stat = null;
	ResultSet res = null;
	String u = request.getParameter("u");
	int num = Integer.parseInt(u);	
	stat= con.createStatement();
	stat.executeUpdate("delete from restaurantsmenu where id_menu='"+num+"'");
	response.sendRedirect("restaurants.jsp");

}catch(Exception e){
	out.println(e);
}

%>
</body>
</html>