<%@page import="project.connectionprovider"%>
<%@page import="java.sql.*"%>
<%
String email=request.getParameter("email");
String password=request.getParameter("password");

int var=0;
try{
    Connection con=connectionprovider.getCon();
    Statement st=con.createStatement();
    ResultSet rs=st.executeQuery("select * from users where email='"+email+"'");
    while(rs.next()){
        var=1;
        st.executeUpdate("update users set password='"+password+"' where email='"+email+"'");
        response.sendRedirect("forgotPassword.jsp?msg=done");
    }
    if(var==0){
        response.sendRedirect("forgotPassword.jsp?msg=invalid");
    }
}
catch(Exception e){
    System.out.print(e.getMessage());
}
%>