<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="bootstrap.jsp" %> 
<meta charset="ISO-8859-1">
<title>BearShip - Management</title>
<style>
link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

.cards {
    margin: 0 auto;
    max-width: 1000px;
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(225px, 1fr));
    grid-auto-rows: auto;
    gap: 20px;
    font-family: sans-serif;
    padding-top: 30px;
}

.cards * {
    box-sizing: border-box;
}

.card__image {
    width: 100%;
    height: 150px;
    object-fit: cover;
    display: block;
    border-top: 2px solid #333333;
    border-right: 2px solid #333333;
    border-left: 2px solid #333333;
}

.card__content {
    line-height: 1.5;
    font-size: 0.9em;
    padding: 15px;
    background: #fafafa;
    border-right: 2px solid #333333;
    border-left: 2px solid #333333;
}

.card__content > p:first-of-type {
    margin-top: 0;
}

.card__content > p:last-of-type {
    margin-bottom: 0;
}

.card__info {
    padding: 15px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    color: #555555;
    background: #eeeeee;
    font-size: 0.8em;
    border-bottom: 2px solid #333333;
    border-right: 2px solid #333333;
    border-left: 2px solid #333333;
}

.card__info i {
    font-size: 0.9em;
    margin-right: 8px;
}

.card__link {
    color: #64968c;
    text-decoration: none;
}

.card__link:hover {
    text-decoration: underline;
}

* {
  margin: 0;
  padding: 0;
  border: 0;
}
.title {
  text-align: center;
  color: #fff;
    font-size: 32px;
}
/* relevant styles */
.img__wrap {
  position: relative;
  height: 100%;
  width: 100%;
}

.img__description {
  position: absolute;
  height: 100%;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  background: rgba(29, 106, 154, 0.72);
  color: #fff;
  visibility: hidden;
  opacity: 0;

  /* transition effect. not necessary */
  transition: opacity .2s, visibility .2s;
}

.img__wrap:hover .img__description {
  ility: visible;
  opacity: 1;
  filter: brightness(30%);

}

h1 {
  color:  #010101;
}
p {
  text-align: center;
}
.image {
    position: relative;
    width: 100%;
}

.image__img {
    display: block;
    width: 100%;
}

.image__overlay {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.6);
    color: #ffffff;
    font-family: 'Quicksand', sans-serif;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    opacity: 0;
    transition: opacity 0.25s;
}

.image__overlay--blur {
    backdrop-filter: blur(5px);
}

.image__overlay--primary {
    background: #009578;
}

.image__overlay > * {
    transform: translateY(20px);
    transition: transform 0.25s;
}

.image__overlay:hover {
    opacity: 1;
}

.image__overlay:hover > * {
    transform: translateY(0);
}

.image__title {
    font-size: 2em;
    font-weight: bold;
}

.image__description {
    font-size: 1.25em;
    margin-top: 0.25em;
}
</style>

</head>
<body>
<%@ include file="navbar.jsp" %>
<%
	Connection con;
	Class.forName("com.mysql.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/loginschema","root","t0d33oRzoo3i2P");
	String sql="select * from loginschema.restaurants order by idrestaurants";
	Statement stat = null;
	ResultSet res = null;
	stat= con.createStatement();
	res = stat.executeQuery(sql); %>
<%
   while(res.next()){
	%>
<div class="cards">
  <div class="card">
<div class="img__wrap image">
    <img class="card__image img__img image__img" src="<%= res.getString("imagerestaurants") %>" alt="">
    <div class="image__overlay image__overlay--blur">
    <div class="image__title"><%= res.getString("namerestaurants") %></div>
        <p class="image__description">
            Offered by BearShip
        </p>
    </div>
    </div>
</div>
    <div class="card__content">
      <p>
        <%= res.getString("descrestaurants") %>
      </p>
    </div>
    <div class="card__info">
      <div>
        <i class="material-icons">Rating:</i>"<%= res.getString("ratingrestaurants") %>/10"
      </div>
      <div>
        <a href='menus.jsp?u=<%= res.getString("idrestaurants") %>' class="card__link btn">View Menu</a>
      </div>
    </div>
  </div>
  </div>
  <%} %>  
 <%@ include file="footer.jsp" %>
</body>
</html>
