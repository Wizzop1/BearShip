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
*{
    padding: 0;
    margin: 0;
    box-sizing: border-box;
}
body{
    background-color: #f3f3f3;
    font-family: 'Poppins',sans-serif;
}
.menu{
    padding: 0;
    display: grid;
    grid-template-columns: repeat( auto-fit, minmax(350px,1fr));
    grid-gap: 20px 40px;
}
.heading{
    background-color: #cb202d;
    color: #ffffff;
    margin-bottom: 30px;
    padding: 120px 0 30px 0;
    grid-column: 1/-1;
    text-align: center;
}
.heading>h1{
    font-weight: 400;
    font-size: 30px;
    letter-spacing: 10px;
    margin-bottom: 10px;
}
.heading>h3{
    font-weight: 600;
    font-size: 22px;
    letter-spacing: 5px;
}
.food-items{
    display: grid;
    position: relative;
    grid-template-rows: auto 1fr;
    border-radius: 15px;
    box-shadow: 0 0 15px rgba(0,0,0,0.1);
    margin: 0 20px;
}
.food-items img{
    position: relative;
    width: 100%;
    border-radius: 15px 15px 0 0;
}

.details{
    padding: 20px 10px;
    display: grid;
    grid-template-rows: auto 1fr 50px;
    grid-row-gap: 15px;
}
.details-sub{
    display: grid;
    grid-template-columns: auto auto;
}
.details-sub>h5{
    font-weight: 600;
    font-size: 18px;
}
.price{
    text-align: right;
}
.details>p{
    color: #6f6f6f;
    font-size: 15px;
    line-height: 28px;
    font-weight: 400;
    align-self: stretch;
}
.details>button{
    background-color: #cb202d;
    border: none;
    color: #ffffff;
    font-size: 16px;
    font-weight: 600;
    border-radius: 5px;
    width: 180px;
}
.details>a{
    background-color: #cb202d;
    border: none;
    color: #ffffff;
    font-size: 16px;
    font-weight: 600;
    border-radius: 5px;
    width: 180px;
}
img{
max-width:100%;
max-height:250px;
}

</style>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
</head>
<body>
<%@ include file="navbar.jsp" %>
<%@ include file="bootstrap.jsp" %>
<%
	Connection con;
	Class.forName("com.mysql.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/loginschema","root","t0d33oRzoo3i2P");
	Statement stat = null;
	ResultSet res = null;
	ResultSet res2 = null;
	stat= con.createStatement();
	String u = request.getParameter("u");
	int num = Integer.parseInt(u);					
	Statement stat10 = null;
	stat10= con.createStatement();
	Statement stat19 = null;
	stat19= con.createStatement();
	res = stat.executeQuery("select * from loginschema.restaurants where idrestaurants='"+num+"'");  

   while(res.next()){
	%>
<div class="menu">

        <div class="heading">
            <h1><%= res.getString("namerestaurants")%></h1>
            <h3>&mdash; MENU &mdash; </h3>
        </div>
   <%} %>
   <%
	res = stat.executeQuery("select * from loginschema.restaurantsmenu where rest_iid='"+num+"'");
   while(res.next()){ %>
        <div class="food-items">
            <img src="<%= res.getString("image") %>">
            <div class="details">
                <div class="details-sub">
                    <h5><%= res.getString("food_name") %></h5>
                    <h5 class="price"><%= res.getInt("price") %>$</h5>
                    
                </div>
                <h5 class="price"><%= res.getInt("weight") %> grams</h5>
                <a class="btn" href='addToCart.jsp?u=<%= res.getString("id_menu") %>'>Add To Cart</a>
                <a class="btn" href='removeFromMenu.jsp?u=<%= res.getString("id_menu") %>'>Remove from Menu</a>
            </div>
        </div>
        <%} %>
        
        
</div>
<% res = stat.executeQuery("select * from loginschema.restaurants where idrestaurants='"+num+"'");%>
  <%while(res.next()){
	  String owner_id = res.getString("owner_id");
				if(owner_id.equals(Id)){ %>
				<br>
				<a href='add_to_menu.jsp?u=<%out.println(num); %>' class="card__link btn">Add to menu</a>
				<% }else{%>
				<% }%>
				<% }%>
<%@ include file="footer.jsp" %>
</body>
</html>