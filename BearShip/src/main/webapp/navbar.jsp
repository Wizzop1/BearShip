<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@ include file="bootstrap.jsp" %> 
<style>
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&display=swap');
 * {
     margin: 0;
     padding: 0;
     box-sizing: border-box;
     font-family: 'Poppins', sans-serif
 }
/*==================== 
Widgets 
====================== */
.widget{padding: 20px;margin-bottom: 40px;}
.widget.widget-last{margin-bottom: 0px;}
.widget.no-box{padding: 0;background-color: transparent;margin-bottom: 40px;
box-shadow: none; -webkit-box-shadow: none; -moz-box-shadow: none; -ms-box-shadow: none; -o-box-shadow: none;}
.widget.subscribe p{margin-bottom: 18px;}	
.widget li a{color: #ba1010;}
.widget li a:hover{color:#c76262 ;}
.widget-title {margin-bottom: 20px;}
.widget-title span {background: #839FAD none repeat scroll 0 0;display: block; height: 1px;margin-top: 25px;position: relative;width: 20%;}
.widget-title span::after {background: inherit;content: "";height: inherit;    position: absolute;top: -4px;width: 50%;}
.widget-title.text-center span,.widget-title.text-center span::after {margin-left: auto;margin-right:auto;left: 0;right: 0;}
.widget .badge{float: right;background: #7f7f7f;}

.typo-light h1, 
.typo-light h2, 
.typo-light h3, 
.typo-light h4, 
.typo-light h5, 
.typo-light h6,
.typo-light p,
.typo-light div,
.typo-light span,
.typo-light small{color: #fff;}


.btn{background-color: #ba1010; color:#fff;}
.btn:hover, .btn:focus, .btn.active {background: #c76262;color: #fff;
-webkit-box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
-moz-box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
-ms-box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
-o-box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
-webkit-transition: all 250ms ease-in-out 0s;
-moz-transition: all 250ms ease-in-out 0s;
-ms-transition: all 250ms ease-in-out 0s;
-o-transition: all 250ms ease-in-out 0s;
transition: all 250ms ease-in-out 0s;

}
.navbar {
background: rgb(0,0,0);
background: linear-gradient(270deg, rgba(0,0,0,1) 84%, rgba(255,255,255,1) 100%);
}

.nav-item:not(:last-child) {
	margin-right: 35px;
	margin-bottom: 5px;
}

.dropdown-toggle::after {
	transition: transform 0.15s linear;
}

.show.dropdown .dropdown-toggle::after {
	transform: translateY(3px);
}

.dropdown-menu {
	margin-top: 0;
}

</style>
</head>
<body>
<%
Connection con5;
Class.forName("com.mysql.jdbc.Driver");
con5 = DriverManager.getConnection("jdbc:mysql://localhost:3306/loginschema","root","t0d33oRzoo3i2P");
String Role = (String) session.getAttribute("role"); 
String Name = (String) session.getAttribute("username");
String Money = (String) session.getAttribute("money2");
String Id = (String) session.getAttribute("id");
String sql4="select * from loginschema.restaurants order by idrestaurants";	
String sql5="select * from loginschema.restaurants where owner_id='"+Id+"'";
String sql6="select * from loginschema.restaurants order by idrestaurants";	
ResultSet res5 = null;;
Statement stat5 = null;
stat5= con5.createStatement();
res5= stat5.executeQuery(sql5);
Statement stat4 = null;
ResultSet res4 = null;
ResultSet res6 = null;;
Statement stat6 = null;
stat4= con5.createStatement();
res4 = stat4.executeQuery(sql4);
stat6= con5.createStatement();
res6 = stat6.executeQuery(sql6);

if(Name == null || Role == null){	
%>
<nav class="navbar navbar-expand-md navbar-dark  sticky-top">
		<div class="container-fluid">
			<a class="navbar-brand" href="landing.jsp"> <img width="60" height="60"
				class="logo horizontal-logo" src="https://i.ibb.co/jJ2BLYH/logo.png"
				alt="forecastr logo">

			</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ml-auto">	
					
					<li class="nav-item"><a class="nav-link" href="contacts.jsp">Contact Us</a></li>
					<li class="nav-item"><a class="nav-link" href="about.jsp">About</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="restaurants.jsp" id="navbarDropdown3"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> Restaurants </a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown3">
							<a class="dropdown-item" href="restaurants.jsp">Catalog</a>
							<div class="dropdown-divider"></div> 
							<%while(res6.next()){
						%>
							<a class="dropdown-item" href='menus.jsp?u=<%= res6.getString("idrestaurants") %>'><%= res6.getString("namerestaurants") %></a>
							<%} %>
								</div>
					</li>
								<li class="nav-item"><a class="nav-link" href="register.jsp">Sign Up</a></li>
						<li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
								</ul>
			</div>
		</div>
	</nav>
	
<%}else if(Role.equals("admin")){
%>	
	
	<nav class="navbar navbar-expand-md navbar-dark bg-dark sticky-top">
		<div class="container-fluid">
			<a class="navbar-brand" href="landing.jsp"> <img width="60" height="60"
				class="logo horizontal-logo" src="https://i.ibb.co/jJ2BLYH/logo.png"
				alt="forecastr logo">

			</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ml-auto">	
					
				
					<li class="nav-item"><a class="nav-link" href='contacts.jsp?u=<%out.println(Id);%>'>Contact Us</a></li>
					<li class="nav-item"><a class="nav-link" href="about.jsp">About</a></li>
					<%while(res4.next()){ 
						while(res5.next()){
								String owner_id=res5.getString("owner_id");
								String rest_id = res5.getString("idrestaurants");
								
								if(owner_id.equals(Id)){ %>
								<li class="nav-item">
								<a class="nav-link" href='menus.jsp?u=<%=res5.getString("idrestaurants")%>'>Manage Restaurant</a>
								
								</li>
							
								<% }%>
								<% }%>
								<% }%>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="restaurants.jsp" id="navbarDropdown3"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> Restaurants </a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown3">
							<a class="dropdown-item" href="restaurants.jsp">Catalog</a>
							<div class="dropdown-divider"></div> 
								<%while(res6.next()){
						%>
							<a class="dropdown-item" href='menus.jsp?u=<%= res6.getString("idrestaurants") %>'><%= res6.getString("namerestaurants") %></a>
							<%} %>
								</div>
					</li>
					<li class="nav-item dropdown"> <a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown2"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> Management </a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown2">
							<a class="dropdown-item" href="management.jsp">User Management</a> <a
								class="dropdown-item" href="resmanagement.jsp">Restaurant Management</a>
								<a class="dropdown-item" href="allorders.jsp">All Orders</a> <a
								class="dropdown-item" href='profile.jsp?u=<%out.println(Id);%>'>Personal Information</a>

						</div>
						<li class="nav-item"><a class="btn btn-disabled"><%out.println(Money); %>$</a></li>
						<a class="navbar-brand" href="cart.jsp?u=<%out.println(Id);%>"> <img width="35" height="35"
				class="logo horizontal-logo" src="https://icon-library.com/images/white-shopping-cart-icon/white-shopping-cart-icon-9.jpg"
				alt="forecastr logo"></a>
						<li class="nav-item"><a class="nav-link" href="logout.jsp">Log Out</a></li>
								</ul>
			</div>
		</div>
	</nav>
	<%}else if(Role.equals("restaurant owner")){
%>
	<nav class="navbar navbar-expand-md navbar-dark bg-dark sticky-top">
		<div class="container-fluid">
			<a class="navbar-brand" href="landing.jsp"> <img width="60" height="60"
				class="logo horizontal-logo" src="https://i.ibb.co/jJ2BLYH/logo.png"
				alt="forecastr logo">

			</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ml-auto">	
				
					<li class="nav-item"><a class="nav-link" href='contacts.jsp?u=<%out.println(Id);%>' >Contact Us</a></li>
					<li class="nav-item"><a class="nav-link" href="about.jsp">About</a></li>
					<%while(res4.next()){ 
						
						while(res5.next()){
								String owner_id=res5.getString("owner_id");
								String rest_id = res5.getString("idrestaurants");

								if(owner_id.equals(Id)){ %>
								<li class="nav-item">
								<a class="nav-link" href='menus.jsp?u=<%=res5.getString("idrestaurants")%>'>Manage Restaurant
								</a>
								</li>
								
								
								<% }%>
								<% }%>
								<% }%>

			
								
							
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="restaurants.jsp" id="navbarDropdown3"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> Restaurants </a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown3">
							<a class="dropdown-item" href="restaurants.jsp">Catalog</a>
					<div class="dropdown-divider"></div> 	
	
								<a class="dropdown-item" href="addnewrestaurant.jsp">Add your Restaurant
								</a>

								<div class="dropdown-divider"></div> 
							<%while(res6.next()){
						%>
							<a class="dropdown-item" href='menus.jsp?u=<%= res6.getString("idrestaurants") %>'><%= res6.getString("namerestaurants") %></a>
							<%} %>
								</div>
					</li>
					
					
								<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#." id="navbarDropdown1"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> My Profile </a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown1">
							 <a
								class="dropdown-item" href='profile.jsp?u=<%out.println(Id);%>'>Personal Information</a>
							
							
								
						</div>
					</li>
								<li class="nav-item"><a class="btn btn-disabled"><%out.println(Money); %>$</a></li>
								<a class="navbar-brand" href="cart.jsp?u=<%out.println(Id);%>"> <img width="35" height="35"
				class="logo horizontal-logo" src="https://icon-library.com/images/white-shopping-cart-icon/white-shopping-cart-icon-9.jpg"
				alt="forecastr logo"></a>
								<li class="nav-item"><a class="nav-link" href="logout.jsp">Log Out</a></li>
						
								</ul>
			</div>
		</div>
	</nav>
<%}	else if(Name != null){%>
<nav class="navbar navbar-expand-md navbar-dark bg-dark sticky-top">
<div class="container-fluid">
	<a class="navbar-brand" href="landing.jsp"> <img width="60" height="60"
		class="logo horizontal-logo" src="https://i.ibb.co/jJ2BLYH/logo.png"
		alt="forecastr logo">

	</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav ml-auto">	
			
			<li class="nav-item"><a class="nav-link" href='contacts.jsp?u=<%out.println(Id);%>'>Contact Us</a></li>
			<li class="nav-item"><a class="nav-link" href="about.jsp">About</a></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="restaurants.jsp" id="navbarDropdown3"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> Restaurants </a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdown3">
					<a class="dropdown-item" href="restaurants.jsp">Catalog</a>
					<div class="dropdown-divider"></div><div class="dropdown-divider"></div>
					<%while(res6.next()){ %>
							<a class="dropdown-item" href='menus.jsp?u=<%= res6.getString("idrestaurants") %>'><%= res6.getString("namerestaurants") %></a>
				<%} %>
				</div>
			</li>
						<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#." id="navbarDropdown1"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> My Profile </a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdown3">
					<a class="dropdown-item" href="profilecart.jsp">My Cart</a> <a
						class="dropdown-item" href='profile.jsp?u=<%out.println(Id);%>'>Personal Information</a>
				</div>
			</li>
						<li class="nav-item"><a class="btn btn-disabled"><%out.println(Money); %>$</a></li>
						<a class="navbar-brand" href="cart.jsp"> <img width="35" height="35"
				class="logo horizontal-logo" src="https://icon-library.com/images/white-shopping-cart-icon/white-shopping-cart-icon-9.jpg"
				alt="forecastr logo"></a>
						<li class="nav-item"><a class="nav-link" href="logout.jsp">Log Out</a></li>
				
						</ul>
	</div>
</div>
</nav>
<%} %>

	<script>
		const $dropdown = $(".dropdown");
		const $dropdownToggle = $(".dropdown-toggle");
		const $dropdownMenu = $(".dropdown-menu");
		const showClass = "show";

		$(window).on("load resize", function() {
			if (this.matchMedia("(min-width: 768px)").matches) {
				$dropdown.hover(function() {
					const $this = $(this);
					$this.addClass(showClass);
					$this.find($dropdownToggle).attr("aria-expanded", "true");
					$this.find($dropdownMenu).addClass(showClass);
				}, function() {
					const $this = $(this);
					$this.removeClass(showClass);
					$this.find($dropdownToggle).attr("aria-expanded", "false");
					$this.find($dropdownMenu).removeClass(showClass);
				});
			} else {
				$dropdown.off("mouseenter mouseleave");
			}
		});
	</script>
</body>
</html>