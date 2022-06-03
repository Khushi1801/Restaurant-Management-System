<%@page import="project.connectionprovider"%>
<%@page import="java.sql.*"%>
<%
String uname=request.getParameter("uname");
String email=request.getParameter("email");
String tel=request.getParameter("phno");
Date bdate=Date.valueOf(request.getParameter("bdate"));
String password=request.getParameter("password");
try{
    Connection con=connectionprovider.getCon();
    PreparedStatement ps=con.prepareStatement("INSERT INTO `users`(`u_name`,`email`,`ph_no`,`b_date`,`password`) values(?,?,?,?,?)");
    ps.setString(1,uname);
    ps.setString(2,email);
    ps.setString(3,tel);
    ps.setDate(4,bdate);
    ps.setString(5,password);
    ps.executeUpdate();
    response.sendRedirect("signup.jsp?msg=valid");
    }
    catch(Exception e){
        System.out.println(e.getMessage());
        response.sendRedirect("signup.jsp?msg=invalid");
    }
%>