
/**
 * Write a description of class BuscarCaracter here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */
import java.util.Scanner;

public class BuscarCaracter {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.print("Ingrese una cadena: ");
        String cadena = scanner.nextLine();

        System.out.print("Ingrese el carácter a buscar: ");
        char caracter = scanner.next().charAt(0);

        int indice = cadena.indexOf(caracter);
        if (indice != -1) {
            System.out.println("El carácter '" + caracter + "' se encuentra en la posición: " + indice);
        } else {
            System.out.println("El carácter '" + caracter + "' no se encuentra en la cadena.");
        }

        scanner.close();
    }
}

