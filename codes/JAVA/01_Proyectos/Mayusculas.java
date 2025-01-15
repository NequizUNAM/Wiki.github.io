
/**
 * Write a description of class Mayusculas here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */
import java.util.Scanner;

public class Mayusculas
{
     public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.print("Ingrese una cadena: ");
        String cadena = scanner.nextLine();

        String mayusculas = cadena.toUpperCase();
        System.out.println("La cadena en mayúsculas es: " + mayusculas);

        scanner.close();
    }
}
