package utility;
public class Calculos {

	private String cadena;

	public Calculos(String cadena) {
		super();
		this.cadena = cadena;
	}
	
	public String validar() {
		String res="true";
		
		for(int i=0; i<cadena.length()-1 && res.equals("true"); i++) {
			if(!Character.isDigit(cadena.charAt(i)) && !Character.isDigit(cadena.charAt(i+1))) {
				res="false";
			}
		}
		
		return res;
	}
	
	public String operarSimple() {
		
		double numero=0;
		String cad="";
		String operador="";
		
		for(int i=0; i<cadena.length();i++) {
			
			if(Character.isDigit(cadena.charAt(i)) || String.valueOf(cadena.charAt(i)).equals(".")) {
				cad+=String.valueOf(cadena.charAt(i));
				
			}else if(operador.isEmpty()){
				operador=String.valueOf(cadena.charAt(i));
				numero+=Double.valueOf(cad);
				cad="";
				
			}else {
				numero= operador.equals("+")? 
						numero+Double.valueOf(cad):
						numero-Double.valueOf(cad);
				operador=String.valueOf(cadena.charAt(i));
				cad="";
			}
		}
		
		if(!cad.isEmpty()) {
			cadena= operador.equals("+")?
					String.valueOf(numero + Double.valueOf(cad)):
						String.valueOf(numero - Double.valueOf(cad));
		}
		
		return cadena;
	}
}
