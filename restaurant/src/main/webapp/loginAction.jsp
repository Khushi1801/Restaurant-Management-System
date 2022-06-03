<%@page import="project.connectionprovider"%>
<%@page import="java.sql.*"%>
<%
String email=request.getParameter("email");
String password=request.getParameter("password");

if("admin@gmail.com".equals(email) && "admin123".equals(password)){
    session.setAttribute("email",email);
    response.sendRedirect("admin/adminHome.jsp");
}
else{
    int var=0;
    try{
        Connection con=connectionprovider.getCon();
        Statement st=con.createStatement();
        ResultSet rs=st.executeQuery("select * from users where email='"+email+"' and password='"+password+"'");
        while(rs.next()){
            session.setAttribute("email",email);
            response.sendRedirect("home.jsp");
        }
        if(var==0){
            response.sendRedirect("login.jsp?msg=notexist");
        }
    }
    catch(Exception e){
        System.out.print(e.getMessage());
        //response.sendRedirect("login.jsp?msg=invalid");
    }
}

%>