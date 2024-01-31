<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>BearShip - Contacts</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<%@ include file="bootstrap.jsp" %>
<style>
.container {
    max-width: 400px;
    width: 100%;
    margin: 0 auto;
    position: relative
}

#contactus {
    font: 400 12px/16px "Roboto", Helvetica, Arial, sans-serif;
    background: #F9F9F9;
    padding: 25px;
    margin: 150px 0;
    box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24)
}

#contactus {}

#contactus h3 {
    display: block;
    font-size: 30px;
    font-weight: 300;
    margin-bottom: 10px
}

#contactus h4 {
    margin: 5px 0 15px;
    display: block;
    font-size: 13px;
    font-weight: 400
}

fieldset {
    border: medium none !important;
    margin: 0 0 10px;
    min-width: 100%;
    padding: 0;
    width: 100%
}

#contactus input[type="text"],
#contactus input[type="number"],
#contactus input[type="email"],
#contactus input[type="tel"],
#contactus input[type="url"],
#contactus textarea {
    width: 100%;
    border: 1px solid #ccc;
    background: #FFF;
    margin: 0 0 5px;
    padding: 10px
}

#contactus input[type="text"]:hover,
#contactus input[type="email"]:hover,
#contactus input[type="tel"]:hover,
#contactus input[type="url"]:hover,
#contactus textarea:hover {
    -webkit-transition: border-color 0.3s ease-in-out;
    -moz-transition: border-color 0.3s ease-in-out;
    transition: border-color 0.3s ease-in-out;
    border: 1px solid #aaa
}

#contactus textarea {
    height: 100px;
    max-width: 100%;
    resize: none
}

#contactus button[type="submit"] {
    cursor: pointer;
    width: 100%;
    border: none;
    background: #f0715f;
    color: #FFF;
    margin: 0 0 5px;
    padding: 10px;
    font-size: 15px
}

#contactus button[type="submit"]:hover {
    background: #f07150;
    -webkit-transition: background 0.3s ease-in-out;
    -moz-transition: background 0.3s ease-in-out;
    transition: background-color 0.3s ease-in-out
}

#contactus button[type="submit"]:active {
    box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.5)
}

#contactus input:focus,
#contactus textarea:focus {
    outline: 0;
    border: 1px solid #aaa
}

::-webkit-input-placeholder {
    color: #888
}

:-moz-placeholder {
    color: #888
}

::-moz-placeholder {
    color: #888
}

:-ms-input-placeholder {
    color: #888
}

</style>
</head>
<body>
<%@ include file="navbar.jsp" %>
<%
if(Name != null){
Connection con;
Class.forName("com.mysql.jdbc.Driver");
con = DriverManager.getConnection("jdbc:mysql://localhost:3306/loginschema","root","t0d33oRzoo3i2P");
String u = request.getParameter("u");
int num = Integer.parseInt(u);
String sql = "select * from loginschema.register where id='"+num+"'";
Statement stat = null;
ResultSet res = null;
stat= con.createStatement();
res = stat.executeQuery(sql);
	
	while(res.next()){
	%>
<div class="container">
<form id="contactus" action="contacts" method="post">
        <h3>Contact us form</h3>
        <fieldset> <input placeholder="Full Name" name ="supportfullname1" type="text" tabindex="1" value="<%=res.getString("fullname")%>" required autofocus> </fieldset>
        <fieldset> <input placeholder="Email Address" name="supportemail1" type="email" tabindex="2" value="<%=res.getString("email")%>"required> </fieldset>
        <fieldset> <input placeholder="Phone Number" name="supportpnumber1" type="text" tabindex="3" value="<%=res.getString("phonenumber")%>"required> </fieldset>
        <fieldset> <textarea placeholder="Type your message here... (Up to 1000 characters)" name = "supportmessage1" tabindex="5" required></textarea> </fieldset>
        <fieldset> <button name="submit" type="submit" id="contactus-submit" class ="btn"data-submit="...Sending">Send Now</button> </fieldset>	
   <%} %>

    </form>
</div>
<%}else if(Name == null) {%> 
<div class="container">
<form id="contactus" action="contacts" method="post">
<h3>Contact us form</h3>
        <fieldset> <input placeholder="Full Name" name ="supportfullname" type="text" tabindex="1"  required autofocus> </fieldset>
        <fieldset> <input placeholder="Email Address" name="supportemail" type="email" tabindex="2" required> </fieldset>
        <fieldset> <input placeholder="Phone Number" name="supportpnumber" type="number" tabindex="3" required> </fieldset>
        <fieldset> <textarea placeholder="Type your message here... (Up to 1000 characters)"  name = "supportmessage"tabindex="5" required></textarea> </fieldset>
        <fieldset> <button name="submit" type="submit" id="contactus-submit" class ="btn"data-submit="...Sending">Send Now</button> </fieldset>	
    </form>
</div>

<%} %>
<%@ include file="footer.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>