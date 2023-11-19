<%@page import="java.sql.Date"%>
<%@page import="com.cinema.model.Film"%>
<%@page import="com.cinema.model.Room"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.cinema.repository.DbRepository"%>
<%@page import="com.cinema.model.Cinema"%>
<%@page import="com.cinema.exceptions.ProjectionException"%>
<%@page import="java.nio.file.attribute.AclEntryType"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add projection</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<link rel="stylesheet" href="../styles/styleSheet.css">
</head>
<body>
<%@include file="../nav.jsp" %>
<%
ArrayList<Cinema> listCinema = null;
ArrayList<Room> listRoom = null;
ArrayList<Film> listFilm = null;
Room room1 = null;
Film film1 = null;
Cinema cinema = null;
Date premiereDays = null;
int releaseDays = 0;
int viewers = 0;
int takings = 0;
	try{
		listCinema = (ArrayList<Cinema>) DbRepository.findAll(Cinema.class);
		listRoom = (ArrayList<Room>) DbRepository.findAll(Room.class); 
		listFilm = (ArrayList<Film>) DbRepository.findAll(Film.class);
		cinema = DbRepository.find(Cinema.class, request.getParameter("cine"));
	}catch(Exception e){
		response.sendRedirect("../error.jsp?msg="+e.getMessage());
		return;
	}
	try{
		if(request.getParameter("add") != null){
			room1 = DbRepository.find(Room.class, request.getParameter("sala"));
			film1 = DbRepository.find(Film.class, request.getParameter("cip"));
			
			try{
				premiereDays = Date.valueOf(request.getParameter("premiereDays"));
			}catch(Exception e){
				response.sendRedirect("../error.jsp?msg="+e.getMessage());
				return;
			}
			releaseDays = Integer.valueOf(request.getParameter("releaseDays"));
			viewers = Integer.valueOf(request.getParameter("viewers"));
			takings = Integer.valueOf(request.getParameter("takings"));
		}
	}catch(Exception e){
		response.sendRedirect("../error.jsp?msg="+e.getMessage());
		return;
	} 
%>
<div class="mainWrap">
<form>
  <div class="form-group row">
    <label for="cine" class="col-4 col-form-label">Cine</label> 
    <div class="col-8">
        <select class="cine" name="cine" required>
        <% 
        for(Cinema c : listCinema){
        	%><option value="<%=c.getCinema()%>"><%=c.getCinema() %></option><%
        }
        	%> 
        </select>
      </div>
    </div>
  <div class="form-group row">
    <label for="sala" class="col-4 col-form-label">Sala</label> 
    <div class="col-8">
      <select class="sala" name="sala" required>
        <% 
        for(Room room : cinema.getRooms()){
        	
        	%><option value="<%=room.getIdRoom()%>"><%=room.getIdRoom() %></option><%
        }
        	%> 
        </select>
    </div>
  </div>
  <div class="form-group row">
    <label for="cip" class="col-4 col-form-label">Cip</label> 
    <div class="col-8">
      <select class="cip" name="film" required>
        	<% 
        for(Film film : listFilm){
        	%><option value="<%=film.getId()%>"><%=film.getName() %></option><%
        }
        	%>
        </select>
    </div>
  </div>
  <div class="form-group row">
    <label for="premiereDays" class="col-4 col-form-label">Fecha_Estreno</label> 
    <div class="col-8">
       <input id="premiereDays" name="premiereDays" type="date" class="form-control" required>
    </div>
  </div>
  <div class="form-group row">
    <label for="releaseDays" class="col-4 col-form-label">Dias de estreno</label> 
    <div class="col-8">
      <input id="releaseDays" name="releaseDays" type="number" class="form-control">
    </div>
  </div>
  <div class="form-group row">
    <label for="viewers" class="col-4 col-form-label">Espectadores</label> 
    <div class="col-8">
      <input id="viewers" name="viewers" type="number" class="form-control">
    </div>
  </div>
  <div class="form-group row">
    <label for="takings" class="col-4 col-form-label">Recaudacion</label> 
    <div class="col-8">
      <input id="takings" name="takings" type="number" class="form-control">
    </div>
  </div>
  <div class="form-group row">
    <div class="offset-4 col-8">
      <button name="add" type="submit" class="btn btn-success">Añadir proyeccion</button>
       <a href="listCharacters.jsp"><button name="list" type="button" class="btn btn-info">Volver</button></a>
    </div>
  </div>
</form>
</div>
</body>
</html>