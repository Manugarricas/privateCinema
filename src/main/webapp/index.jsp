<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cine</title>
<!-- Importamos las hojas de estilos, tanto la propia como la de BoostStrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<link rel="stylesheet" href="./styles/styleSheet.css" />

</head>
<body>
  <div class="imgContainer">
    <a href="./logIn.jsp"><img class="userImg" src="./img/usuario (1).png"></a>
  </div>
<div class="mainWrap">
	<h1>Bienvenido a Cine ..</h1>
	
	<h3 class="linkMainMenu"><a class=" linkMainMenu" href="film/listFilm.jsp">Listado de peliculas</a></h3>
	
	<h3 class="linkMainMenu"><a class=" linkMainMenu" href="film/addFilm.jsp">Añadir pelicula</a></h3>
	
	<h3 class="linkMainMenu"><a class=" linkMainMenu" href="character/listCharacters.jsp">Listado de personaje</a></h3>
        
	<h3 class="linkMainMenu"><a class=" linkMainMenu" href="character/addCharacter.jsp">Añadir personaje</a></h3>
	
	<h3 class="linkMainMenu"><a class=" linkMainMenu" href="tasks/listTask.jsp">Listado de tarea</a></h3>
        
    <h3 class="linkMainMenu"><a class=" linkMainMenu" href="tasks/addTask.jsp">Añadir tarea</a></h3>
    
	
</div>

	
	<!-- Script necesario para el menu desplegable de BoostStrap -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>