<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.*"%>
<%@ include file="navbar.jsp" %>
<%@ include file="bootstrap.jsp" %>
<%

try{
	Connection con;
	Class.forName("com.mysql.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/loginschema","root","t0d33oRzoo3i2P");
	Statement stat = null;

	stat= con.createStatement();

	String id_menu=request.getParameter("id");

	int quantity=1;
	int product_price=0;
	int product_total=0;
	int cart_total=0;
	String u = request.getParameter("u");
	int num = Integer.parseInt(u);			
	int z=0;
	ResultSet res =stat.executeQuery("select * from loginschema.restaurantsmenu where id_menu='"+num+"'");
	while(res.next()){
		
		product_price=res.getInt(4);
		product_total=product_price;
	}
	ResultSet res2=stat.executeQuery("select * from loginschema.cart where products_id='"+num+"' and user_id='"+Id+"'");
	while(res2.next()){
		cart_total=res2.getInt(4);
		cart_total=cart_total+product_total;
		quantity=res2.getInt(5);
		quantity=quantity+1;
		z=1;
	}
	if(z==1){
		stat.executeUpdate("update cart set total_quantity = '"+cart_total+"', total_quantity='"+quantity+"', status='"+"pending"+"' where products_id='"+num+"' and user_id='"+Id+"'");
		response.sendRedirect("restaurants.jsp");
	}
	if(z==0){
		PreparedStatement ps=con.prepareStatement("insert into cart(user_id,products_id,total_amount,total_quantity) values(?,?,?,?)");
		ps.setString(1, Id);
		ps.setInt(2,num);
		ps.setInt(3,product_price);
		ps.setInt(4,quantity);
		ps.executeUpdate();
		response.sendRedirect("restaurants.jsp");
		
	}
	
	
}catch(Exception e){
	
	out.println(e);
}

%>
<%@ include file="footer.jsp"%>