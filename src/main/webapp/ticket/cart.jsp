<%@page import="com.cinema.model.User"%>
<%@page import="com.cinema.repository.DbRepository"%>
<%@page import="com.cinema.repository.TicketRepository"%>
<%@page import="com.cinema.model.Ticket"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Your shopping cart</title>
<link rel="shortcut icon" href="/pruebaHibernate/img/cart.webp" type="image/x-icon">
</head>
<body>
	
	<%
	User user = null;
	if (session.getAttribute("user") == null) {
		response.sendRedirect("../index.jsp");
		return;
	}
	else {
		user = DbRepository.find(User.class, session.getAttribute("user").toString());
	}
	
	ArrayList<Ticket> tickets = null;
	try {
		tickets = (ArrayList<Ticket>)TicketRepository.getTickets(user);
	} catch (Exception e) {
		e.printStackTrace();
		response.sendRedirect("../error.jsp?msg=Error al obtener las entradas.");
		return;
	}
	
	%>
<table class="table">
  <thead>
    <tr>
      <th scope="col">Cine</th>
      <th scope="col">Sala</th>
      <th scope="col">Cip</th>
      <th scope="col">Fecha de estreno</th>
      <th scope="col">ID Entrada</th>
      <th scope="col">Fecha de compra</th>
    </tr>
  </thead>
<%for (Ticket ticket : tickets) { %>
  <tbody>
  	<tr>
  		<td><%= ticket.getProjection().getRoom().getCinema().getCinema() %></td>
  		<td><%= ticket.getProjection().getRoom().getIdRoom() %></td>
  		<td><%= ticket.getProjection().getFilm().getId() %></td>
  		<td><%= ticket.getProjection().getPremiereDays() %></td>
  		<td><%= ticket.getId() %></td>
  		<td><%= ticket.getFecha_compra() %></td>
  	</tr>
<%} %>
  </tbody>
</table>
</body>
</html>