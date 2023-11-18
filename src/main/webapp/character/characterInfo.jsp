<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.cinema.repository.CharacterRepository"%>
<%@page import="com.cinema.model.Character"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Listado personajes e info</title>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdn.simplecss.org/simple.min.css">

</head>
<body>
	<% 
		//Le pasamos una lista de personajes a result
		List<Character> result = new ArrayList();
		String infoPersonaje = null;
		
		try{
		result = CharacterRepository.getCharacters();
		Character info = CharacterRepository.getCharacter(request.getParameter("info"));
		infoPersonaje = info.getName();
		}catch(Exception e){
			e.getMessage();
		}
		
	
	%>
	
<!-- 	Creamos el formulario y dentro de el hacemos un for para que nos recorra result e imprima todos los personajes -->

<header>
        <nav>
            <div class="menu">
            <a href="${pageContext.request.servletContext.contextPath}/film/listFilm.jsp">Peliculas</a>
            <a href="${pageContext.request.servletContext.contextPath}/character/characterList.jsp">Personajes</a>
            <a href="${pageContext.request.servletContext.contextPath}/tasks/listTask.jsp">Tareas</a>
            </div>
        </nav>
        <a href="${pageContext.request.servletContext.contextPath}/character/addCharacter.jsp"><button type="button">Añadir Personaje</button></a>
        <a href="${pageContext.request.servletContext.contextPath}/character/characterList.jsp"><button type="button">Lista de Personaje</button></a>  
          
    </header>

	<table class="table">
		<thread>
			<tr>
				<th scope="col">Name</th>
				
			</tr>
		</thread>
		<%for(Character c : result){
		
			if(c.getName().equals(infoPersonaje)){%>
				<tr>
					<td><%=c.getName()%> 
					<form action="characterList.jsp">
					<input id="info" name="info" type="text" class="form-control" value= '<%=c.getName()%>' hidden>
		
		    <button name="submit" type="submit" class="btn btn-primary">Info</button>
		 
					</form>
					</td>
					<p>Name: <%=infoPersonaje%></p><br>
	     			<p>Nationality: <%=c.getNationality()%></p><br>
	     			<p>Sex: <%=c.getSex() %></p><br>
						<form action="./characterEdit.jsp">
							<input type="text" name="characterEdit" value='<%=c.getName()%>' hidden>
							<button type="submit" name="edit">Editar</button>
						</form>
						<form action="./characterDelete.jsp">
							<input type="text" name="characterDelete" value='<%=c.getName()%>' hidden>
							<button type="submit" name="delete">Borrar</button>
						</form>
						<form action="../jobs/infoJobs.jsp">
							<input type="text" name="characterFilm" value='<%=c.getName()%>' hidden>
							<button type="submit" name="film">Ver Filmografias</button>
						</form>
    
    
					
				</tr>
		<% }else{%>
		
			<tr>
					<td><%=c.getName()%> 
					<form action="characterInfo.jsp">
					<input id="info" name="info" type="text" class="form-control" value= '<%=c.getName()%>' hidden>
		
		    <button name="submit" type="submit" class="btn btn-primary">Info</button>
		 
					</form>
					</td>
				</tr>
		
		<%}} %>
		
		
		<%if(request.getParameter("delete") != null){
			CharacterRepository.deleteCharacter(request.getParameter("characterDelete"));
		}%>
		
		
		
		
		
	</table>
</body>
</html>