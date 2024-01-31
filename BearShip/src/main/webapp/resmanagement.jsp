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
<title>Insert title here</title>
<style>
.marginn {
margin-left: 200px;
margin-top:50px;
margin-bottom:50px;
}
 h1 {
 margin-top:50px;
 margin-bottom:50px;

 }
 .fl-table{
 width:100%;
 }
h1 {text-align: center;}
 </style>


</head>
<body>
<%@ include file="navbar.jsp" %>
<%@ include file="bootstrap.jsp" %>


<div class="gocenter">
<h1>Admin Management</h1>

</div>

<div class="table wrapper">
	<table class ="fl-table">
	
	<thead>
		<tr>
			<th>Restaurant Owner:</th>
			<th>Restaurant ID:</th>
			<th>Restaurant Name:</th>
			<th>Restaurant Description:</th>
			<th>Restaurant Rating:</th>
			<th>Restaurant Address:</th>
			<th class="text-center">Action</th>				
		</tr>
	</thead>
	<tbody>
	<%
	Connection con;
	Class.forName("com.mysql.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/loginschema","root","t0d33oRzoo3i2P");
	String sql="select * from loginschema.restaurants order by idrestaurants";	
	Statement stat = null;
	ResultSet res = null;;
	stat= con.createStatement();
	res = stat.executeQuery(sql);
	if(Role.equals("admin")){
		%>
			<div class="col-md-6 mb-3 mt-3">
		<a href="addnewrestaurant.jsp" class="btn btn-primary">Add New Restaurant</a>
	</div>
		<%
	while(res.next()){
	%>
	<tr>
		<td><%= res.getString("owner_id") %></td>
		<td><%= res.getString("idrestaurants") %></td>
		<td><%= res.getString("namerestaurants") %></td>
		<td><%= res.getString("descrestaurants") %></td>
		<td><%= res.getString("ratingrestaurants") %></td>
		<td><%= res.getString("addressrestaurants") %></td>
		<td class="text-center">
		<a href ='restdelete.jsp?d=<%=res.getString("idrestaurants")%>' class="btn btn-danger">Delete</a>
		</td>
		
	</tr>
	<%
	}
	%>
	
	</tbody>
	<%}else{ %>
	<%@ include file="access_denied.jsp" %>
	<%} %>
</table>
</div>
</div>


 <%@ include file="footer.jsp" %>
</body>
</html>