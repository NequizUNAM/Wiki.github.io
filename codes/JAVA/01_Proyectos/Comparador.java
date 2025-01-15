/**
 * An example of a method - replace this comment with your own
 *
 * @param  y   a sample parameter for a method
 * @return     the sum of x and y
 */

/**
 * Write a description of class Comparador here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */
public class Comparador
{
    public static void main(String[] args) {

        String cadena1 = "Hola Mundo!!!";
        String cadena2 = "Hola Mundo!!!";
        String cadena3 = new String( "Hola Mundo!!!" );

        // Funciona bien
        System.out.println("Ejemplo 1");
        if (cadena1.equals(cadena2)) {
            System.out.println("Cadena1 y cadena2 son iguales");
        } else {
            System.out.println("Cadena1 y cadena2 son distintas");
        }

        // Tambien funciona bien
        System.out.println("Ejemplo 2");
        if (cadena1.equals(cadena3)) {
            System.out.println("Cadena1 y cadena3 son iguales");
        } else {
            System.out.println("Cadena1 y cadena3 son distintas");
        }

        // Tambien funciona bien
        System.out.println("Ejemplo 3");
        if (cadena1.equals("Hola Mundo!!!")) {
            System.out.println("Las cadenas son iguales");
        } else {
            System.out.println("Las cadenas son distintas");
        }

        // Tambien funciona bien
        System.out.println("Ejemplo 4");
        if ("Hola Mundo!!!".equals(cadena2)) {
            System.out.println("Las cadenas son iguales");
        } else {
            System.out.println("Las cadenas son distintas");
        }

        // System.out.print("\033[H\033[2J");  
        // System.out.flush();
        

    }
}
