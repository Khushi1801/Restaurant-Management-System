<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<title>ForgotPassword</title>
</head>
<body>
<div id='container'>
  <div class='signup'>
    <form action="forgotPasswordAction.jsp" method="post">
      <input type="email" name="email" placeholder="Enter email here.." required>
      <input type="password" name="password" placeholder="Enter new password here.." required>
      <input type="submit" value="save">
    </form>
     
      <h2><a href="login.jsp">Login</a></h2>
  </div>
  <div class='whyforgotPassword'>
<%
String msg=request.getParameter("msg");
if("done".equals(msg)){
%>
<h1>Password Changed Successfully!</h1>
<% } %>
<%
if("invalid".equals(msg)){
%>
<h1>Some thing Went Wrong! Try Again !</h1>
<% } %>
       <h2 style="text-align:center">Yoooo Brooo</h2>
    <p>The Online Restaurant managment System is the application that allows the users to order online without calling waiter to order food.</p>
  </div>
</div>
</body>
</html>