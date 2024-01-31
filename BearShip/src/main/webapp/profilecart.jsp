<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>BearShip - Orders</title>
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
.gocenter {
margin-left:200px
}

 h1 {
 margin-top:50px;
 margin-bottom:50px;
text-align: center;
 }
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


	<h1>Recent Orders</h1>
</div>
<a class="btn" href='profile.jsp?u=<%out.println(Id);%>'>Return</a>
<div class="table wrapper">
	<table class ="fl-table">
	<thead>
		<tr>
			<th>Product Name:</th>
			<th>Value: </th>
			<th>Quantity: </th>
			<th>Order Status: </th>
				</tr>
	</thead>
	<tbody>
	<tr>
	<%
	Connection con;
	Class.forName("com.mysql.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/loginschema","root","t0d33oRzoo3i2P");
	Statement stat = null;
	Statement stat3 = null;
	ResultSet res = null;
	ResultSet res3 = null;
	stat= con.createStatement();
	stat3= con.createStatement();
	String u = request.getParameter("u");
	int num = Integer.parseInt(u);		
	stat= con.createStatement();
	String sql="select * from loginschema.cart where user_id='"+num+"'";
	res = stat.executeQuery(sql);
	if(u.equals(Id)){
	while(res.next()){
		int productID = res.getInt("products_id");
	
	res3=stat3.executeQuery("select * from restaurantsmenu where id_menu='"+productID+"'");
		while(res3.next()){
	%>
	<tr>
		<td><%= res3.getString("food_name") %></td>
		<td><%= res.getString("total_amount") %> $</td>
		<td><%= res.getString("total_quantity") %></td>
		<td><%= res.getString("status") %></td>
		
	</tr>
	<%
	}
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