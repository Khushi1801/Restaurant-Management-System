<%@page import="project.connectionprovider"%>
<%@page import="java.sql.*"%>
<%
String email=(String)session.getAttribute("email");
String paymentmethod=request.getParameter("paymentmethod");
String transactionid="";
transactionid=request.getParameter("transactionid");
String status="bill";
long millis=System.currentTimeMillis();  
java.sql.Date date=new java.sql.Date(millis);  
try{
    Connection con=connectionprovider.getCon();
    PreparedStatement ps=con.prepareStatement("update cart set payment_method=?,transaction_id=?,status=? where email=? and address is not NULL and order_status='delivered' and order_date=?");
    ps.setString(1,paymentmethod);
    ps.setString(2,transactionid);
    ps.setString(3,status);
    ps.setString(4,email);
    ps.setDate(5,date);
    ps.executeUpdate();
    response.sendRedirect("bill.jsp");
}
catch(Exception e){
    System.out.print(e.getMessage());
}
%>