<%@page import="java.awt.Event"%>
<%@page import="javax.swing.text.Document"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="utility.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body align="center">
<%! 
	String cadena="";
%>
<%
	String bot1=request.getParameter("boton1");
	String bot2=request.getParameter("boton2");
	String bot3=request.getParameter("boton3");

	if(bot1!=null ){
		cadena+=request.getParameter("number")+request.getParameter("operator");
	}
	
	if(bot2!=null){
		
		if(cadena!=null && !cadena.isEmpty()){
			
			Calculos c = new Calculos(cadena);
			cadena=c.operarSimple();	
		}
	}
	
	if(bot3!=null){
		cadena="";
	}

%>
	<form method="get" action="Funcionamiento.jsp">
		<h1>Extrania Calculadora</h1>
		<h3>
			<%=cadena %>
		</h3><br><br>
		<label>
			Introduce el numero: <input type="number" name="number">
		</label><br><br>
		Introduce el signo:
		<select name="operator">
			<option value=""> </option>
			<option value="+">+</option>
			<option value="-">-</option>
		</select><br><br>
		<input type="submit" name="boton1" value="Add"></input>
		<input type="submit" name="boton2" value="Resolve"></input>
		<input type="submit" name="boton3" value="Delete"></input>
		
	</form>
</body>
</html>












