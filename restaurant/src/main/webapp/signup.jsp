<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<title>Signup</title>
</head>
<body>
<div id='container'>
  <div class='signup'>
    <form action="signupAction.jsp" method="post">
      <input type="text" name="uname" placeholder="Enter user name here.." required>
      <input type="email" name="email" placeholder="Enter email here.." required>
      <input type="tel" name="phno" placeholder="Enter phone number here.." pattern="{0-9}[10]" required>
      <input type="date" name="bdate" placeholder="Enter birthdate here.." required>
      <input type="password" name="password" placeholder="Enter password here.." required>
      <input type="submit" value="signup">
    </form>
    
      <h2><a href="login.jsp">Login</a></h2>
  </div>
  <div class='whysign'>
<%
String msg=request.getParameter("msg");
if("valid".equals(msg)){
%>
<h1>Successfully Registerd</h1>
<% } %>
<%
if("invalid".equals(msg)){
%>
<h1>Some thing Went Wrong! Try Again !</h1><% } %>

    <h2 style="text-align:center">Yoooo Brooo</h2>
    <p>The Online Restaurant managment System is the application that allows the users to order online without calling waiter to order food.</p>
  </div>
</div>

</body>
</html>