<%@page import="project.connectionprovider"%>
<%@page import="java.sql.*,java.io.*"%>
<%
String id=request.getParameter("id");
String name=request.getParameter("name");
String category=request.getParameter("category");
String serving=request.getParameter("serving");
String price=request.getParameter("price");
String active=request.getParameter("active");

try{
    Connection con=connectionprovider.getCon();
    Statement st=con.createStatement();
    st.executeUpdate("update menu set name='"+name+"',category='"+category+"',serving='"+serving+"',price='"+price+"',active='"+active+"' where id='"+id+"'");
    response.sendRedirect("allProductEditProduct.jsp?msg=done");
}
catch(Exception e){
    System.out.print(e.getMessage());
    response.sendRedirect("allProductEditProduct.jsp?msg=wrong");
}
%>