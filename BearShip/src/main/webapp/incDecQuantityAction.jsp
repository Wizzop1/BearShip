<%@page import="java.sql.*"%>
<%@ include file="navbar.jsp" %>
<% 
	
	
	try{
		Connection con;
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/loginschema","root","t0d33oRzoo3i2P");
		Statement stat = null;
		ResultSet res = null;
		stat= con.createStatement();
		String id=request.getParameter("id");
		String incdec=request.getParameter("quantity");
		int price=0;
		int total=0;
		int quantity=0;
		int final_total=0;
		res=stat.executeQuery("select * from cart where user_id='"+Id+"' and products_id='"+id+"' and status='"+"pending"+"'");
		while(res.next()){
			price=res.getInt(4);
			quantity=res.getInt(5);
			total=price;
			
		}if(quantity==1 && incdec.equals("dec"))
			response.sendRedirect("cart.jsp?id="+Id);
		else if(quantity!=1 && incdec.equals("dec"))
		{
			
			total=price;
			quantity=quantity-1;
					stat.executeUpdate("update cart set total_quantity='"+quantity+"',total_amount='"+total+"' where user_id='"+Id+"' and products_id='"+id+"' and status='"+"pending"+"'");
					response.sendRedirect("cart.jsp?id="+Id);
		}
		else{
			total=price;
			quantity=quantity+1;
					stat.executeUpdate("update cart set total_quantity='"+quantity+"',total_amount='"+total+"' where user_id='"+Id+"' and products_id='"+id+"' and status='"+"pending"+"'");
					response.sendRedirect("cart.jsp?id="+Id);
		}
		
	}catch(Exception e){
		out.println(e);
	}
	%>