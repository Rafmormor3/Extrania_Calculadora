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
	String resultado="";
%>
<%
	String bot1=request.getParameter("boton1");
	String bot2=request.getParameter("boton2");
	String bot3=request.getParameter("boton3");

	if(bot1!=null ){
		if(resultado.isEmpty()){
			cadena+=request.getParameter("number")+request.getParameter("operator");	
		}else{
			cadena=resultado;
			cadena+=request.getParameter("number")+request.getParameter("operator");
			resultado="";
		}
	}
	
	if(bot2!=null){
		
		Calculos c = new Calculos(cadena);
		
		if(cadena!=null && !cadena.isEmpty() && Character.isDigit(cadena.charAt(0)) && c.validar().equals("true")){
			
			resultado=c.operarSimple();
			cadena=cadena+" = "+ resultado;	
		}
	}
	
	if(bot3!=null){
		cadena="";
		resultado="";
	}

%>
	<form method="get" action="Funcionamiento.jsp">
		<h1>CALCULATOR</h1>
		<h3>
			<%=cadena %>
		</h3><br><br>
		<label>
			Introduce a number: <input type="number" step="any" name="number">
		</label><br><br>
		Introduce the operator:
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












