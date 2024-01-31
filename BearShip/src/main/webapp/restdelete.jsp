<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
String id = request.getParameter("d");
int no = Integer.parseInt(id);
Connection con;
Class.forName("com.mysql.jdbc.Driver");
con = DriverManager.getConnection("jdbc:mysql://localhost:3306/loginschema","root","t0d33oRzoo3i2P");

Statement stat= con.createStatement();
stat.executeUpdate("delete from loginschema.restaurants where idrestaurants='"+no+"'");
response.sendRedirect("resmanagement.jsp");

%>