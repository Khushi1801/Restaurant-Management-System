<%@page import="project.connectionprovider"%>
<%@page import="java.sql.*,java.io.*"%>
<%
int id=0;
String name=request.getParameter("name");
String category=request.getParameter("category");
String serving=request.getParameter("serving");
String price=request.getParameter("price");
String active=request.getParameter("active");
try{
    Connection con=connectionprovider.getCon();
    Statement st=con.createStatement();
    ResultSet rs=st.executeQuery("select max(id) from menu");
    while(rs.next()){
        id=rs.getInt(1);
        id=id+1;
    }
    PreparedStatement ps=con.prepareStatement("insert into menu values(?,?,?,?,?,?)");
    ps.setInt(1,id);
    ps.setString(2,name);
    ps.setString(3,category);
    ps.setString(4,serving);
    ps.setString(5,price);
    ps.setString(6,active);
    ps.executeUpdate();
    response.sendRedirect("addNewProduct.jsp?msg=done");
}
catch(Exception e){
    System.out.print(e.getMessage());
    response.sendRedirect("addNewProduct.jsp?msg=wrong");
}
%>