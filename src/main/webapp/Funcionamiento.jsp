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
<link rel="stylesheet" href="css/style.css" type="text/css">
</head>
<body align="center">
<%! 
//Variables donde vamos a ir almavenando el resultado de las cuentas y la cadena que vamos mostrando
	String cadena="";
	String resultado="";
%>
<%
//Le asignamos variables a los botones
	String bot1=request.getParameter("boton1");
	String bot2=request.getParameter("boton2");
	String bot3=request.getParameter("boton3");
	
	
//Si le damos al boton de add y la variable resultado esta vacia, la cadena se va llenando y 
//la vamos mostrando.
//En el caso que le demos al botón y la variable resultado no este vacia, ese resultado lo pondremos en la
//cadena, vaciaremos el resultado y podremos seguir poniendo operaciones en la cadena.
	if(bot1!=null ){
		if(resultado.isEmpty()){
			cadena+=request.getParameter("number")+request.getParameter("operator");	
		}else{
			cadena=resultado;
			cadena+=request.getParameter("number")+request.getParameter("operator");
			resultado="";
		}
	}


//Entra aqui cuando le damos al boton resolve
	if(bot2!=null){
		
		//Creamos c y con el un objeto de la clase Calculos 
		Calculos c = new Calculos(cadena);
		
		//Entra si la cadena no es nulo y la cadena no esta vacia y la validacion es true
		if(cadena!=null && !cadena.isEmpty() && c.validar().equals("true")){
			//Calculamos el resultado de la cadena.
			resultado=c.operarSimple();
			cadena=cadena+" = "+ resultado;	
			
		}else{
			cadena="Syntax Error";
			resultado="";
		}
	}


//Si pulsamos el boton delete, borramos todo.
	if(bot3!=null){
		cadena="";
		resultado="";
	}

%>
    <h1>Calculator</h1>
	<form method="get" action="Funcionamiento.jsp">
        <div>
		<h3>
            <%=cadena %>
		</h3><br>
		<label>
			Introduce a number: <input type="number" step="any" name="number">
		</label><br><br>
		Introduce the operator:
		<select name="operator">
			<option value=""> </option>
			<option value="+">+</option>
			<option value="-">-</option>
		</select><br><br><br>
		<input id="boton" type="submit" name="boton1" value="Add"></input>
		<input id="boton1" type="submit" name="boton2" value="Resolve"></input>
		<input id="boton2" type="submit" name="boton3" value="Delete"></input>
		</div>
	</form>
</body>
</html>












