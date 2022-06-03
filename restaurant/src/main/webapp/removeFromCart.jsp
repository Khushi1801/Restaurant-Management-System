<%@page import="project.connectionprovider"%>
<%@page import="java.sql.*"%>
<%
String email=(String)session.getAttribute("email");
String id=request.getParameter("id");
try{
    Connection con=connectionprovider.getCon();
    Statement st=con.createStatement();
    st.executeUpdate("delete from cart where email='"+email+"' and item_id='"+id+"' and address is NULL");
    response.sendRedirect("myCart.jsp?msg=removed");
}
catch(Exception e){
    System.out.print(e.getMessage());
} 
%>