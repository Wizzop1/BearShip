<%@page import="javax.imageio.metadata.IIOMetadataFormatImpl"%>
<%@page import ="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://use.fontawesome.com/a16f019e26.js"></script>
<title>My Cart</title>
<style>
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
	<%
	Connection con;
	Class.forName("com.mysql.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/loginschema","root","t0d33oRzoo3i2P");
	String sql="select * from loginschema.cart where user_id='"+Id+"' and status='"+"pending"+"' order by cart_id ";
	Statement stat = null;
	Statement stat2 = null;
	Statement stat3 = null;
	Statement stat1 = null;
	ResultSet res = null;
	ResultSet res2 = null;
	ResultSet res3 = null;
	ResultSet res1 = null;
	stat= con.createStatement();
	stat2=con.createStatement();
	res = stat.executeQuery(sql);
	res2=stat2.executeQuery("select * from register where id='"+Id+"'");
	stat3= con.createStatement();
	if (Id != null){ 
 %>
<div class="table wrapper">
	<table class ="fl-table">
	<thead>
		<tr>
			<th>Product/s:</th>
			<th>Price:</th>
			<th>Quantity:</th>
			<th>Sub Total:</th>
			<th class="text-center">Action</th>				
		</tr>
	</thead>
	<tbody>
	<%int count=0;
		int totalPrice=0;
		int total=0;
	%>
	<% 
	while(res.next()){
		int item_amount=Integer.parseInt(res.getString("total_amount"));
		int quantity=Integer.parseInt(res.getString("total_quantity"));
		 total=item_amount * quantity;
		count++;
			totalPrice=totalPrice+total;
		int productID = res.getInt("products_id");
		res3=stat3.executeQuery("select * from restaurantsmenu where id_menu='"+productID+"'");
		while(res3.next()){
	%>
	<tr>
		<td><%= res3.getString("food_name") %></td>
		<td><%= res.getString("total_amount") %>$</td>
		<td><a href="incDecQuantityAction.jsp?id=<%=res.getString("products_id")%>&quantity=dec"><i class='fas fa-plus-circle'></i></a><%= res.getString("total_quantity") %><a href="incDecQuantityAction.jsp?id=<%=res.getString("products_id")%>&quantity=inc"><i class='fas fa-minus-circle'></i></a></td>
		<td name="moner"><%out.println(total);%>$</td>
		<td class="text-center">
		<a href ='removeFromCart.jsp?id=<%=res.getString("products_id") %>' class="btn btn-danger">Remove</a>
		</td>
		
	</tr>
	<%
	
		}
	}
	%>
	</tbody>
</table>
  <form action='purchaseComplete.jsp?id=<%out.println(totalPrice);%>' method="post">
<div class="row">
                <div class="col-md-6 mt-md-0 mt-3 ml-3"> <label>Vaucher : </label> <input type="text" class="form-control" name="voucher" > </div>
                <div class="col-md-6 mt-md-0 mt-3 ml-3"> <label>Total price : <%out.println(totalPrice); %></label></div>
                <div class="marginn">
<div class="row">
	<div class="col-md-6 mb-4">
		<button class="btn btn-primary my-md-2 my-3 ml-3" type="submit">Purchase</button>
	</div>
</div>

                </div>
</div>
</form>
<%}else{ %>
<%@ include file="access_denied.jsp" %>
<%} %>
</div>


 <%@ include file="footer.jsp" %>

</body>
</html>