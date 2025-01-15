
/**
 * Write a description of class LecturasScanner here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */

import java.util.Scanner;
public class LecturasScanner
{
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // Leer un entero
        System.out.println("Ingrese un número entero:");
        int entero = scanner.nextInt();

        // Leer un double
        System.out.println("Ingrese un número double:");
        double decimal = scanner.nextDouble();

        // Leer un booleano
        System.out.println("Ingrese un valor booleano (true/false):");
        boolean booleano = scanner.nextBoolean();

        // Limpiar el buffer del scanner
        scanner.nextLine();

        // Leer una cadena de caracteres
        System.out.println("Ingrese su nombre:");
        String nombre = scanner.nextLine();

        System.out.println("El número entero ingresado es: " + entero);
        System.out.println("El número double ingresado es: " + decimal);
        System.out.println("El valor booleano ingresado es: " + booleano);
        System.out.println("El nombre ingresado es: " + nombre);

        scanner.close();
    }
}
