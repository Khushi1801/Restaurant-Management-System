<%@page import="project.connectionprovider"%>
<%@page import="java.sql.*"%>

<%
String id=request.getParameter("id");
String email=request.getParameter("email");
String status="delivered";
try{
    Connection con=connectionprovider.getCon();
    Statement st=con.createStatement();
    st.executeUpdate("update cart set order_status='"+status+"' where item_id='"+id+"' and email='"+email+"' and address is not NULL");
    response.sendRedirect("ordersReceived.jsp?msg=delivered");
}
catch(Exception e){
    System.out.print(e);
    response.sendRedirect("ordersReceived.jsp?msg=invalid");
}
%>