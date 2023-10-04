package utility;
public class Calculos {

	private String cadena;

	public Calculos(String cadena) {
		super();
		this.cadena = cadena;
	}
	
	public String operarSimple() {
		
		int numero=0;
		String cad="";
		String operador="";
		
		for(int i=0; i<cadena.length();i++) {
			
			if(Character.isDigit(cadena.charAt(i))) {
				cad+=String.valueOf(cadena.charAt(i));
				
			}else if(operador.isEmpty()){
				operador=String.valueOf(cadena.charAt(i));
				numero+=Integer.valueOf(cad);
				cad="";
				
			}else {
				numero= operador.equals("+")? 
						numero+Integer.valueOf(cad):
						numero-Integer.valueOf(cad);
				operador=String.valueOf(cadena.charAt(i));
				cad="";
			}
		}
		
		if(!cad.isEmpty()) {
			cadena= operador.equals("+")?
					String.valueOf(numero + Integer.valueOf(cad)):
						String.valueOf(numero - Integer.valueOf(cad));
		}
		
		return cadena;
	}
}
