<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
        <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<!DOCTYPE html>
<html>
<style>
 * {
     margin: 0;
     padding: 0;
     box-sizing: border-box;
     font-family: 'Poppins', sans-serif
 }

 body {
     background: #ffffff;
     min-height: 100vh
 }

 body::-webkit-scrollbar {
     display: none
 }

 .wrapper {
     max-width: 800px;
     margin: 80px auto;
     padding: 30px 45px;
     box-shadow: 5px 25px 35px #3535356b
 }

 .wrapper label {
     display: block;
     padding-bottom: 0.2rem
 }

 .wrapper .form .row {
     padding: 0.6rem 0
 }

 .wrapper .form .row .form-control {
     box-shadow: none
 }

 .wrapper .form .option {
     position: relative;
     padding-left: 20px;
     cursor: pointer
 }

 .wrapper .form .option input {
     opacity: 0
 }

 .wrapper .form .checkmark {
     position: absolute;
     top: 1px;
     left: 0;
     height: 20px;
     width: 20px;
     border: 1px solid #bbb;
     border-radius: 50%
 }

 .wrapper .form .option input:checked~.checkmark:after {
     display: block
 }

 .wrapper .form .option:hover .checkmark {
     background: #f3f3f3
 }

 .wrapper .form .option .checkmark:after {
     content: "";
     width: 10px;
     height: 10px;
     display: block;
     background: linear-gradient(45deg, #ce1e53, #8f00c7);
     position: absolute;
     top: 50%;
     left: 50%;
     border-radius: 50%;
     transform: translate(-50%, -50%) scale(0);
     transition: 300ms ease-in-out 0s
 }

 .wrapper .form .option input[type="radio"]:checked~.checkmark {
     background: #fff;
     transition: 300ms ease-in-out 0s
 }

 .wrapper .form .option input[type="radio"]:checked~.checkmark:after {
     transform: translate(-50%, -50%) scale(1)
 }

 #sub {
     display: block;
     width: 100%;
     border: 1px solid #ddd;
     padding: 10px;
     border-radius: 5px;
     color: #333
 }

 #sub:focus {
     outline: none
 }

 @media(max-width: 768.5px) {
     .wrapper {
         margin: 30px
     }

     .wrapper .form .row {
         padding: 0
     }
 }

 @media(max-width: 400px) {
     .wrapper {
         padding: 25px;
         margin: 20px
     }
 }
	

}
li {
float: left;
text-decoration:none;
list-style:none;
padding: 11px 11px 11px;
}
li a{
color:#ADADAD;
text-decoration: none;
}

</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<%@ include file="navbar.jsp" %>
<%@ include file="bootstrap.jsp" %>
<% 
Connection con6;
Class.forName("com.mysql.jdbc.Driver");
con6 = DriverManager.getConnection("jdbc:mysql://localhost:3306/loginschema","root","t0d33oRzoo3i2P");
while(res5.next()){
	String owner_id=res5.getString("owner_id");
	String rest_id = res5.getString("idrestaurants");
	
	if(owner_id != Id && Role.equals("restaurant owner") && Role != "user"){ %>
	<h1> you already own a restaurant.</h1>
	<a href="landing.jsp" class="btn">Return</a>
	<% }%>
<% }%>


	<div class="wrapper rounded bg-white">
  <div class="h3">Add Your Restaurant</div>
<div class="form">
<form action="addNewRestaurant" method="post">
    <div class="row">
            <div class="col-md-6 mt-md-0 mt-3"> <label>Restaurant Name</label> 
            <input type="text" class="form-control" name="rn"required> </div>
        </div>
        <div class="row">
            <div class="col-md-6 mt-md-0 mt-3"> <label>Restaurant Description</label> 
            <input type="text" class="form-control" name="rd" required> </div>
            <div class="col-md-6 mt-md-0 mt-3"> <label>Restaurant Address</label> 
            <input type="text" class="form-control" name="ra" required> </div>           
        </div>
        <div class="row">
            <div class="col-md-6 mt-md-0 mt-3"> <label>Restaurant Rating</label> 
            <input type="number" min="0" max="10"placeholder="x/10" name="rr" class="form-control"required> </div>
            <input type="hidden" name="roi" class="form-control" value=<%out.println(Id);%> required> </div>
        </div>
        <div class="row">
            <div class="col-md-6 mt-md-0 mt-3"> <label>Restaurant Image</label> 
            <input type="text" placeholder="Image Link" class="form-control" name="ri"required> </div>
        </div>
        <button class="btn btn-primary my-md-2 my-3" type="submit">Submit</button>
        <a href="restaurants.jsp" class="btn btn-default my-md-2 my-3">Back</a>
    </form>
        </div>
    </div>

<%@ include file="footer.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</html>
