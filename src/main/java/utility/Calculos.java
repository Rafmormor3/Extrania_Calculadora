package utility;
public class Calculos {

	private String cadena;
	
	//Constructor donde cogemos la cadena que hemos ido formando
	public Calculos(String cadena) {
		super();
		this.cadena = cadena;
	}
	
	//Devuelve true si la cadena no tiene signos juntos, es decir , si la cadena 
	//es 1++1 la funcion devolveria false
	public String validar() {
		String res="true";
		
		for(int i=0; i<cadena.length()-1 && res.equals("true"); i++) {
			if(!Character.isDigit(cadena.charAt(i)) && !Character.isDigit(cadena.charAt(i+1))) {
				res="false";
			}
		}
		
		return res;
	}
	
	
	//La funcion devuelve la operacion matematica que esta en la cadena
	public String operarSimple() {
		//Variables
		double numero=0;
		String cad="";
		String operador="";
		
		for(int i=0; i<cadena.length();i++) {
			//Si el primer caracter es "-" o "+" lo metemos en la variable cad junto con los 
			//numeros hasta encontrarnos con un operador, es decir, + o -
			//Tenemos en cuenta el . para los decimales
			if(((String.valueOf(cadena.charAt(i)).equals("-")
					||String.valueOf(cadena.charAt(i)).equals("+")) && i==0) 
					|| Character.isDigit(cadena.charAt(i)) || String.valueOf(cadena.charAt(i)).equals(".")) {
				
				cad+=String.valueOf(cadena.charAt(i));
			
				
			//Cuando llega al primer operador, lo almacenamos en su variable y le sumamos cad a numero para
			//obtener asi el primer numero. Vaciamos cad, donde podremos almacenar el segundo numero.
			}else if(operador.isEmpty()){
				operador=String.valueOf(cadena.charAt(i));
				numero+=Double.valueOf(cad);
				cad="";
			
				
			//Cuando llega el siguiente operador,hacemos la operacion del anterior operador y almacenamos el
			//operador en el que estamos situados. Si el operador anteriormente guardado es suma, sumamos, y
			//si era una resta, restamos.
			//Vaciamos cad para poder almacenar el siguiente numero.
			}else {
				numero= operador.equals("+")? 
						numero+Double.valueOf(cad):
						numero-Double.valueOf(cad);
				operador=String.valueOf(cadena.charAt(i));
				cad="";
			}
		}
		
		
		//Cuando termina el bucle, nos suele dejar almacenado el ultimo numero.
		//Solo tenemos que operar segun el operador guardado y tendriamos terminada la funcion.
		if(!cad.isEmpty()) {
			cadena= operador.equals("+")?
					String.valueOf(numero + Double.valueOf(cad)):
						String.valueOf(numero - Double.valueOf(cad));
		}
		
		return cadena;
	}
}
