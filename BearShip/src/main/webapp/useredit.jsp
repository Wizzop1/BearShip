<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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
</head>
<body>        
<%@ include file="navbar.jsp" %> 
<%
Connection con;
Class.forName("com.mysql.jdbc.Driver");
con = DriverManager.getConnection("jdbc:mysql://localhost:3306/loginschema","root","t0d33oRzoo3i2P");
Statement stat = null;
ResultSet res = null;
%>
<div class="wrapper rounded bg-white">
  <div class="h3">Edit Profile</div>
   <div class="form">
    <form action="useredit" method="post">
    
    <% 	
	stat=con.createStatement();
	String u = request.getParameter("u");
	int num = Integer.parseInt(u);					
	String sql2 = "select * from loginschema.register where id='"+num+"'";
	res= stat.executeQuery(sql2);
	if(u.equals(Id)){
	while(res.next()){ 
	%>
	<input type="hidden" name="id" value="<%=res.getString("id")%>"/>
	<input type="hidden" name="oldmoney" value="<%=res.getString("money")%>"/>
    <div class="row">
            <div class="col-md-6 mt-md-0 mt-3"> <label>Username</label> <input type="text" class="form-control" name="uname" value="<%=res.getString("username")%>" required> </div>
        </div>
        <div class="row">
            <div class="col-md-6 mt-md-0 mt-3"> <label>Old Password</label> <input type="password" class="form-control" name="oldpassword" required> </div>
            <div class="col-md-6 mt-md-0 mt-3"> <label>New Password</label> <input type="password" class="form-control" name="newpassword" required> </div>
            <div class="col-md-6 mt-md-0 mt-3"> <label>Confirm Password</label> <input type="password" class="form-control" name="confirmpassword" required> </div>
        </div>

        <div class="row">
            <div class="col-md-6 mt-md-0 mt-3"> <label>Email</label> <input type="email" name="email" class="form-control" value="<%=res.getString("email")%>" required> </div>
            <div class="col-md-6 mt-md-0 mt-3"> <label>Phone Number</label> <input type="number" name="tel" class="form-control" value="<%=res.getString("phonenumber")%>" required> </div>
        </div>
        <div class="row">
            <div class="col-md-6 mt-md-0 mt-3"> <label>Deposit Money</label> <input type="number" name="money" class="form-control" required> </div>
            <div class="col-md-6 mt-md-0 mt-3"> <label>Address</label> <input type="text" name="address" class="form-control" value="<%=res.getString("address")%>"required> </div>       
        </div>
        <button class="btn btn-primary my-md-2 my-3" type="submit">Submit</button>
    	<a href='profile.jsp?u=<%out.println(Id);%>' class="btn btn-default my-md-2 my-3">Back</a>
     </form>
        </div>
    </div>
<%} %>
<%}else{ %>
<%@ include file="access_denied.jsp" %>
<%} %>
<%@ include file="footer.jsp" %> 
</body>
</html>