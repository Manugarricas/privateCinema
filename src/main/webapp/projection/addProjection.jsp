<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add projection</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<link rel="stylesheet" href="../styleSheet.css">
</head>
<body>
<%@include file="../nav.jsp" %>

<div class="mainWrap">
<form action="addFilm.jsp">
  <div class="form-group row">
    <label for="title" class="col-4 col-form-label">Cine</label> 
    <div class="col-8">
      <div class="input-group">
        <select>
        	<option></option>
        </select>
      </div>
    </div>
  </div>
  <div class="form-group row">
    <label for="year" class="col-4 col-form-label">Sala</label> 
    <div class="col-8">
      <select>
        	<option></option>
      </select>
    </div>
  </div>
  <div class="form-group row">
    <label for="st" class="col-4 col-form-label">Cip</label> 
    <div class="col-8">
      <input id="st" name="st" type="text" class="form-control">
    </div>
  </div>
  <div class="form-group row">
    <label for="nacionality" class="col-4 col-form-label">Fecha de Estreno</label> 
    <div class="col-8">
      <input id="nacionality" name="nacionality" type="text" class="form-control">
    </div>
  </div>
  <div class="form-group row">
    <label for="cost" class="col-4 col-form-label">Dias de estreno</label> 
    <div class="col-8">
      <input id="cost" name="cost" type="number" class="form-control">
    </div>
  </div>
  <div class="form-group row">
    <label for="duration" class="col-4 col-form-label">Espectadores</label> 
    <div class="col-8">
      <input id="duration" name="duration" type="number" class="form-control">
    </div>
  </div> 
  <div class="form-group row">
    <label for="duration" class="col-4 col-form-label">Recaudacion</label> 
    <div class="col-8">
      <input id="recaudacion" name="recaudacion" type="number" class="form-control" min="0" max="20">
    </div>
  </div> 
   <div class="form-group row">
    <label for="respuesta" class="col-4 col-form-label"></label> 
  </div> 
  <div class="form-group row">
    <div class="offset-4 col-8">
      <button name="submit" type="submit" class="btn btn-primary">Guardar</button>
    </div>
  </div>
  </form>
  </div>
</body>
</html>