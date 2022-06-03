<%@page import="project.connectionprovider"%>
<%@page import="java.sql.*"%>
<%@include file="adminHeader.jsp" %>
<%@include file="../footer.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="../css/ordersReceived-style.css">
<title>Home</title>
<style>
.th-style
{ width: 25%;}
</style>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">Cancel Orders <i class='fas fa-window-close'></i></div>

<table id="customers">
          <tr>
            <th scope="col">Item Name</th>
            <th scope="col">Quantity</th>
            <th scope="col"><i class="fa fa-inr"></i> Sub Total</th>
            <th>Table Number</th>
            <th scope="col">Order Date</th>
            <th scope="col">Status</th>
          </tr>
<%
try{
  Connection con=connectionprovider.getCon();
  Statement st=con.createStatement();
  ResultSet rs=st.executeQuery("select * from cart inner join menu where cart.item_id=menu.id and cart.order_date is not NULL and cart.order_status='delivered' order by order_date DESC");
  while(rs.next()){
%>
       
          <tr>
            <td><%= rs.getString(14) %> </td>
            <td><%= rs.getString(3) %></td>
            <td><i class="fa fa-inr"></i> <%= rs.getString(5) %> </td>
                <td><%= rs.getString(6) %></td>
               <td><%= rs.getString(8) %></td>
                <td><%= rs.getString(12) %></td>
               </tr>
<%
  }
}
catch(Exception e){
  System.out.println(e);
}  
%>  
        </table>
      <br>
      <br>
      <br>

</body>
</html>