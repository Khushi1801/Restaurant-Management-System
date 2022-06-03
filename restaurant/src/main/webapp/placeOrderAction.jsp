<%@page import="project.connectionprovider"%>
<%@page import="java.sql.*"%>

<%
String email=(String)session.getAttribute("email");
String table=request.getParameter("address");
String status="preparing";
long millis=System.currentTimeMillis();  
java.sql.Date date=new java.sql.Date(millis);  
try{
    Connection con=connectionprovider.getCon();
    PreparedStatement ps=con.prepareStatement("update cart set address=?,order_status=?,order_date=? where email=? and address is NULL");
    ps.setString(1,table);
    ps.setString(2,status);
    ps.setDate(3,date);
    ps.setString(4,email);
    ps.executeUpdate();
    response.sendRedirect("addressPaymentForOrder.jsp?msg=valid");
}
catch(Exception e){
    System.out.print(e.getMessage());
}
%>