<%@page import="project.connectionprovider"%>
<%@page import="java.sql.*"%>
<%@include file="header.jsp" %>
<%@include file="footer.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/addressPaymentForOrder-style.css">
    <script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Home</title>
</head>
<body>
<form action="addressPaymentForOrderAction.jsp" method="post">

      <div class="center-div">
        <h3>Select way of Payment</h3>
        <select class="input-style" name="paymentmethod">
          <option> Offline Payment </option>
          <option> Online Payment</option>
        </select>
        <br>
        <h3>Scan this<h3>
        <img style="display: block;margin-left: auto;margin-right: auto;" src='images/download.png' /> 
        <h3>Enter transaction id</h3>
        <input class="input-style" type="text" name="transactionid" placeholder="Enter Transaction Id">
        <h3 style="color: red">*If you select online Payment then enter you transaction ID here otherwise leave this blank</h3>
      </div>
      <hr style="width: 100%">

      <div class="center-div">
        <h3 style="color: red">*If you enter wrong transaction id then we can cancel your order!</h3>
        <button class="button" type="sybmit">Procced to generate bill & save <i class='far fa-arrow-alt-circle-right'></i></button>
        <h3 style="color: red">*Fill form correctly</h3>
      </div>
    </form>
      <br>
      <br>
      <br>

</body>
</html>