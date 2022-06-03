<%@page import="project.connectionprovider"%>
<%@page import="java.sql.*"%>

<%
String id=request.getParameter("id");
String email=request.getParameter("email");
String status="cancel";
try{
    Connection con=connectionprovider.getCon();
    Statement st=con.createStatement();
    st.executeUpdate("update cart set status='"+status+"',order_status='"+status+"' where item_id='"+id+"' and email='"+email+"' and address is not NULL");
    response.sendRedirect("ordersReceived.jsp?msg=cancel");
}
catch(Exception e){
    System.out.print(e);
    response.sendRedirect("ordersReceived.jsp?msg=invalid");
}
%>