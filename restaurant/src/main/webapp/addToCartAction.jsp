<%@page import="project.connectionprovider"%>
<%@page import="java.sql.*"%>

<%
String email=(String)session.getAttribute("email");
String id=request.getParameter("id");
int quantity=1;
int price=0;
int total=0;
int cart_total=0;

int var=0;
try{
    Connection con=connectionprovider.getCon();
    Statement st=con.createStatement();
    ResultSet rs=st.executeQuery("select * from menu where id='"+id+"'");
    while(rs.next()){
        price=rs.getInt(5);
        total=price;    
    }
    ResultSet rs1=st.executeQuery("select * from cart where item_id='"+id+"' and email='"+email+"' and address is NULL");

    while(rs1.next()){
        cart_total=rs1.getInt(5);
        cart_total=cart_total+total;
        quantity=rs1.getInt(3);
        quantity=quantity+1;
        var=1;
    }
    if(var==1){
        st.executeUpdate("update cart set total='"+cart_total+"',quantity='"+quantity+"' where item_id='"+id+"' and email='"+email+"' and address is NULL");
        response.sendRedirect("home.jsp?msg=exist");
    }
    if(var==0){
        PreparedStatement ps= con.prepareStatement("insert into cart(email,item_id,quantity,price,total) values(?,?,?,?,?)");
        ps.setString(1,email);
        ps.setInt(2,Integer.parseInt(id));
        ps.setInt(3,quantity);
        ps.setInt(4,price);
        ps.setInt(5,total);
        ps.executeUpdate();
        response.sendRedirect("home.jsp?msg=added");
    }

}
catch(Exception e){
    System.out.print(e.getMessage());
    response.sendRedirect("home.jsp?msg=invalid");
}
%>