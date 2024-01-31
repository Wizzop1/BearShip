<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>BearShip - Management</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<style>

/* Table Styles */
*{
    box-sizing: border-box;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
}
 .h2 {
 margin-top:50px;
 margin-bottom:50px;
 }

    .marginn {

margin-top:50px;
margin-bottom:50px;
width:100%;
}
h1 {text-align: center;}


 .fl-table{
 width:100%;
 }
</style>
</head>
<body>
	<%@ include file="navbar.jsp" %>
<%@ include file="bootstrap.jsp" %>
<div class="marginn">
<div class="gocenter">
<h1>Admin Management</h1>

</div>

<div class="table wrapper">
	<table class ="fl-table">
	<thead>
		<tr>
			<th>ID:</th>
			<th>Full Name:</th>
			<th>Username:</th>
			<th>Email:</th>
			<th>Password:</th>
			<th>Role:</th>	
			<th>Money: </th>
			<th>Gender:</th>
			<th>Phone Number: </th>
			<th>Address: </th>
			<th class="text-center">Action</th>				
		</tr>
	</thead>
	<tbody>
	<%
	Connection con;
	Class.forName("com.mysql.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/loginschema","root","t0d33oRzoo3i2P");
	String sql="select * from loginschema.register order by id";
	Statement stat = null;
	ResultSet res = null;
	stat= con.createStatement();
	res = stat.executeQuery(sql);
	if(Role.equals("admin")){
		%>
	<div class="col-md-6 mb-4">
		<a href="addnew.jsp" class="btn btn-primary">Add New Data</a>
	</div>

	<%while(res.next()){
	%>

	<tr>
		<td><%= res.getString("id") %></td>
		<td><%= res.getString("fullname") %></td>
		<td><%= res.getString("username") %></td>
		<td><%= res.getString("email") %></td>
		<td><%= res.getString("password") %></td>
		<td><%= res.getString("role") %></td>
		<td><%= res.getString("money") %></td>
		<td><%= res.getString("gender") %></td>
		<td><%= res.getString("phonenumber") %></td>
		<td><%= res.getString("address") %></td>
		<td class="text-center">
		<a href ='edit.jsp?u=<%=res.getString("id")%>' class="btn btn-warning">Edit</a>
		<a href ='delete.jsp?d=<%=res.getString("id")%>' class="btn btn-danger">Delete</a>
		</td>
		
	</tr>
	<%
	}
	%>
	<%
	}else{
	%>
	<%@ include file="access_denied.jsp" %>
	<%
	}
	%>
	</tbody>
</table>
</div>
</div>


 <%@ include file="footer.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</body>
</html>