<%@page import="com.cinema.repository.DbRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Log in</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	<%@ include file="./nav.jsp" %>
	<%
	
	String message = "";
	if (request.getParameter("submit") != null) {
		try {
			DbRepository.find(Usuario.class, request.getParameter("user"));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	%>

<form>
  <div class="form-group row">
    <label for="user" class="col-4 col-form-label">User</label> 
    <div class="col-8">
      <input id="user" name="user" type="text" class="form-control" required="required">
    </div>
  </div>
  <div class="form-group row">
    <label for="email" class="col-4 col-form-label">Email</label> 
    <div class="col-8">
      <input id="email" name="email" type="text" class="form-control" required="required">
    </div>
  </div>
  <div class="form-group row">
    <label for="password" class="col-4 col-form-label">Password</label> 
    <div class="col-8">
      <input id="password" name="password" type="text" class="form-control" required="required">
    </div>
  </div>
  <div class="form-group row">
    <label for="name" class="col-4 col-form-label">Name</label> 
    <div class="col-8">
      <input id="name" name="name" type="text" class="form-control" required="required">
    </div>
  </div>
  <div class="form-group row">
    <label for="surnames" class="col-4 col-form-label">Surnames</label> 
    <div class="col-8">
      <input id="surnames" name="surnames" type="text" class="form-control" required="required">
    </div>
  </div> 
  <div class="form-group row">
    <div class="offset-4 col-8">
      <button name="submit" type="submit" class="btn btn-primary">Log in</button>
    </div>
  </div>
</form>
<p>Don't have an account?<a href="./signin.jsp"> Sign In Here</a></p>
<p><% if (message != null) {if (!message.equals("")) { %><%= message %><% }} %></p>
</body>
</html>