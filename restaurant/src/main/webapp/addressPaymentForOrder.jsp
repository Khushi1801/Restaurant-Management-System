<%@page import="project.connectionprovider"%>
<%@page import="java.sql.*"%>
<%@include file="footer.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <link rel="stylesheet" href="css/addressPaymentForOrder-style.css">
    <script src='https://kit.fontawesome.com/a076d05399.js'></script>
    <title>Home</title>
  </head>
  <body>
    <br>
    <table>
      <thead>
        <%
          String email=(String)session.getAttribute("email");
          int total=0;
          int sno=0;
          try{
            Connection con=connectionprovider.getCon();
            Statement st=con.createStatement();
            ResultSet rs1=st.executeQuery("select sum(total) from cart where email='"+email+"' and address is NULL");
            while(rs1.next()){
              total=rs1.getInt(1);
            }
        %>
        <tr>
          <th scope="col"><a href="myCart.jsp"><i class='fas fa-arrow-circle-left'> Back</i></a></th>
          <th scope="col" style="background-color: yellow;">Total: <i class="fa fa-inr"></i><% out.println(total); %> </th>
        </tr>
      </thead>
      <thead>
        <tr>
          <th scope="col">S.No</th>
          <th scope="col">Product Name</th>
          <th scope="col">Category</th>
          <th scope="col"><i class="fa fa-inr"></i> price</th>
          <th scope="col">Quantity</th>
          <th scope="col">Sub Total</th>
        </tr>
      </thead>
      <tbody>
        <%
          ResultSet rs=st.executeQuery("select * from menu inner join cart on menu.id=cart.item_id and cart.email='"+email+"' and cart.address is NULL");
          while(rs.next()){
        %>        
        <tr>
          <% sno=sno+1; %>
          <td><% out.println(sno); %></td>
          <td><%= rs.getString(2) %></td>
          <td><%= rs.getString(3) %></td>
          <td><i class="fa fa-inr"></i> <%= rs.getString(5) %></td>
          <td>  <%= rs.getString(9) %> </td>
          <td><i class="fa fa-inr"></i> <%= rs.getString(11) %></td>
        </tr>
        <% } 
        %>
      </tbody>
    </table>
    <hr style="width: 100%">
    <%
      }
      catch(Exception e){
        System.out.print(e.getMessage());
      }
    %>

    <form action="placeOrderAction.jsp" method="post">
    <div class="center-div">
        <h3>Enter Table</h3>
        <input class="input-style" type="text" name="address" placeholder="Enter table number" required>
      </div>
      <br><br>
    <button class="button" type="sybmit">Place Order</button>

    </form>
    <br><br><br>
    <% 
      String msg=request.getParameter("msg");
      if("valid".equals(msg)){
    %>
    <h1 style="text-align: center;color:white">Order arriving soon</h1>
    <% } %>
      <br>
      <br>
      <br>

</body>
</html>