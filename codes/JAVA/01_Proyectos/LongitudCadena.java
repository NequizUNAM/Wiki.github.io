
/**
 * Write a description of class LongitudCadena here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */
import java.util.Scanner;

public class LongitudCadena {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.print("Ingrese una cadena: ");
        String cadena = scanner.nextLine();

        int longitud = cadena.length();
        System.out.println("La longitud de la cadena es: " + longitud);

        scanner.close();
    }
}

