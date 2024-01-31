<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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


<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<%
	Connection con;
	Class.forName("com.mysql.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/loginschema","root","t0d33oRzoo3i2P");
	Statement stat = null;
	ResultSet res8 = null;
	stat= con.createStatement();
	String u = request.getParameter("u");
	int num = Integer.parseInt(u);					
	String sql8 = "select * from loginschema.restaurants where idrestaurants='"+num+"'";
	res8 = stat.executeQuery(sql8); %>
<div class="wrapper rounded bg-white">
  <div class="h3">Add to Menu</div>
<div class="form">
<form action="add_to_menu" method="post">
    <div class="row">
            <div class="col-md-6 mt-md-0 mt-3"> <label>Item name</label> 
            <input type="text" class="form-control" name="in1"required> </div>
            <div class="col-md-6 mt-md-0 mt-3"> <label>Type of Food</label> 
            <select name = "typ1" id="typ1">
  <option value="salad">Salad</option>
  <option value="meat">Meat</option>
  <option value="seafood">Seafood</option>
  <option value="dessert">Dessert</option>
    <option value="beverage">Beverage</option>
        <option value="asian">Asian</option>
        <option value="other">Other</option>
        </select>
        </div>
        <div class="row">
        <div class="col-md-6 mt-md-0 mt-3"> <label>Item Image</label>
            <input type="text" placeholder="Image Link" class="form-control" name="ii1"required> </div>
        </div>
        </div>
        <div class="row">
            <div class="col-md-6 mt-md-0 mt-3"> <label>Price </label> 
            <input type="number" class="form-control" name="p1"required> </div>
            <div class="col-md-6 mt-md-0 mt-3"> <label>Total Amount of the Product </label> 
             <input type="number" class="form-control" name="q1"required> </div>
             <div class="col-md-6 mt-md-0 mt-3"> <label>Weight in grams</label> 
             <input type="number" class="form-control" name="we1"required> </div>
        </div>
		<%while(res8.next()){ %>
            <input type="hidden" name="rid"  class="form-control" value= <%out.println(num); %> > </div>
        <%} %>
        <button class="btn btn-primary my-md-2 my-3" type="submit">Submit</button>
        <a href="restaurants.jsp" class="btn btn-default my-md-2 my-3">Back</a>
    </form>
        </div>
    </div>


<%@ include file="footer.jsp" %>
</body>
<script>


$(document).ready(function() {
    var max      = 15; //maximum input boxes allowed
    var container         = $(".wraper");  
    var add      = $(".add_icon"); //Plus sign id
   
    var x = 1; //input field count intially
    $(add).click(function(e){         e.preventDefault();
        if(x < max){ //maximum number of input field allowed
            x++; //input field increment
            $(container).append
            ('<div><input type="text" name="text[]"/><a href="#" class="delete btn-sm">delete</a></div>
            + 'ssdd''); //adding new input field
        
        }
    });
   
    $(container).on("click",".delete", function(e){ //user click on remove text
        e.preventDefault(); $(this).parent('div').remove(); x--;
    })
});
</script>
</html>