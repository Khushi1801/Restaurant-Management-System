<%@page import="project.connectionprovider"%>
<%@page import="java.sql.*"%>

<%
String email=(String)session.getAttribute("email");
String subject=request.getParameter("subject");
String body=request.getParameter("body");
try{
    Connection con=connectionprovider.getCon();
    PreparedStatement ps=con.prepareStatement("insert into message(email,subject,body) values(?,?,?)");
    ps.setString(1,email);
    ps.setString(2,subject);
    ps.setString(3,body);
    ps.executeUpdate();
    response.sendRedirect("messageUs.jsp?msg=valid");
}
catch(Exception e){
    System.out.println(e.getMessage());
    response.sendRedirect("messageUs.jsp?msg=invalid");

}
%>