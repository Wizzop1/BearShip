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
<h1>All Orders</h1>
</div>

<div class="table wrapper">
	<table class ="fl-table">
	<thead>
		<tr>
			<th>Cart ID:</th>
			<th>User ID:</th>
			<th>Products ID:</th>
			<th>Value: </th>
			<th>Quantity: </th>
			<th>Order Status: </th>
			</tr>
	</thead>
	<tbody>
	<%
	Connection con;
	Class.forName("com.mysql.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/loginschema","root","t0d33oRzoo3i2P");
	String sql="select * from loginschema.cart order by cart_id";
	Statement stat = null;
	ResultSet res = null;
	stat= con.createStatement();
	res = stat.executeQuery(sql);
	while(res.next()){
	%>
	<tr>
		<td><%= res.getString("cart_id") %></td>
		<td><%= res.getString("user_id") %></td>
		<td><%= res.getString("products_id") %></td>
		<td><%= res.getString("total_amount") %></td>
		<td><%= res.getString("total_quantity") %></td>
		<td><%= res.getString("status") %></td>
	</tr>
	<%
	}
	%>
	</tbody>
</table>
</div>
</div>


 <%@ include file="footer.jsp" %>

</html>