<%@page import="java.sql.*"%>
<%@page import="java.util.Random"%>
<%@page import="java.security.*"%>
<%@ include file="navbar.jsp" %>
<style>
h1 {text-align: center;}
a {text-align: center;}
.center_allign{
margin-top:200px;
margin-bottom:200px;

}
.center {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 200px;

}
.margin-top{
margin-top:150px;

}

</style>
<% 
	
String moneySubstractString="";
int moneySubstract=0;
int total=0;
int finalMoney=0;
String id="";
String voucher_name;
String used_voucher_name= request.getParameter("voucher");
SecureRandom random;
int user_vouch_id;
int sale_percent=0;
boolean used_voucher=false;
	try{
		Connection con;
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/loginschema","root","t0d33oRzoo3i2P");
		Statement stat = null;
		PreparedStatement ps = null;
		PreparedStatement ps2 = null;
		PreparedStatement ps4 = null;
		id=request.getParameter("id");
		moneySubstractString=id;
		Statement stat1 = null;
		ResultSet res = null;

		moneySubstract= Integer.parseInt(moneySubstractString);
		total=Integer.parseInt(Money);
		user_vouch_id = Integer.parseInt(Id);
		stat= con.createStatement();
		 char[] chars = "abcdefghijklmnopqrstuvwxyz1234567890".toCharArray();
		 int codeLength=8;
	        StringBuilder sb = new StringBuilder();
	        Random random2 = new SecureRandom();
	        for (int i = 0; i < codeLength; i++) {
	            char c = chars[random2.nextInt(chars.length)];
	            sb.append(c);
	        }
	        voucher_name = sb.toString();
		res = stat.executeQuery("select * from loginschema.vouchers where id='"+Id+"' and voucher_status='"+"available"+"' and voucher_name='"+used_voucher_name+"'");
		while(res.next()){
			sale_percent=20/100;
			used_voucher=true;
		}
		if(used_voucher) 
			{
			finalMoney= total-(moneySubstract - (moneySubstract*(20/100)));
			String sql10="update loginschema.vouchers set voucher_status='"+"unavailable"+"' where id='"+Id+"' and voucher_name='"+used_voucher_name+"'";
			ps4 = con.prepareStatement(sql10);
			ps4.executeUpdate();
			}
		else 
			{
			finalMoney=total-moneySubstract;
			}
		if(finalMoney>0){
		String sql="update loginschema.cart set status=? where user_id='"+Id+"'";
		ps = con.prepareStatement(sql);
		ps.setString(1, "complete");
		ps.executeUpdate();
		String sql2="update loginschema.register set money=? where id='"+Id+"'";
		ps2 = con.prepareStatement(sql2);
		ps2.setInt(1,finalMoney);
		ps2.executeUpdate();
	%>
	<div class="center_allign">
	<h1>Purchase completed!</h1>
	<h1>Expect a call on the phone you've input.</h1>
	<div class="center">
	<a class="btn" href="restaurants.jsp">Continue Shopping</a>
	</div>
	<%if(moneySubstract>25){ %>
	
	<%PreparedStatement ps3 = con.prepareStatement("insert into loginschema.vouchers(voucher_status,voucher_percent,voucher_name,id) values (?,?,?,?)");
	ps3.setString(1, "available");
	ps3.setInt(2, 20);
	ps3.setString(3, voucher_name);
	ps3.setInt(4, user_vouch_id);
	ps3.executeUpdate();
	%>
	<h1>You've spent over 25$ voucher added in your vouchers page!</h1>
	<%}else{ %>
	<br><h1>Make a purchase for over 25$ to get a voucher!</h1>
	</div>
	<%}
	
		}else {%>
			<div class="margin-top">
			<h1>Not enough Credits!</h1>
			</div>
			<div class="center">
	<a class="btn" href="landing.jsp">Return to Main Page.</a>
	
	</div>
		<%}
		}catch(Exception e){
		out.println(e);
		}
	%>
	<%@ include file="footer.jsp" %>