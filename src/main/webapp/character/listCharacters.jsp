<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.cinema.repository.CharacterRepository"%>
<%@page import="com.cinema.model.Character"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Listado personajes</title>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdn.simplecss.org/simple.min.css">

</head>
<body>
<%@include file="/nav.jsp" %>
	<%
		//Le pasamos una lista de personajes a result
		List<Character> result = new ArrayList();
		result = CharacterRepository.getCharacters();
	%>
<!-- 	Creamos el formulario y dentro de el hacemos un for para que nos recorra result e imprima todos los personajes -->
	<table class="table">
		<thread>
			<tr>
				<th scope="col">Name</th>
				
			</tr>
		</thread>
		<%for(Character c : result){
		%>
				<tr>
					<td><%=c.getName()%> 
					<form action="characterInfo.jsp">
					<input id="info" name="info" type="text" class="form-control" value='<%=c.getName()%>' hidden>
					<button name="submit" type="submit" class="btn btn-primary">Info</button>
		  			</form>
		  			</td>
				</tr>
		<% }%>
		
		
		
		<%if(request.getParameter("delete") != null){
			CharacterRepository.deleteCharacter(request.getParameter("characterDelete"));
		}%>
		
		
		
		
		
	</table>
</body>
</html>