
/**
 * Write a description of class Serie_Fibonacci here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */
import java.util.Scanner;
public class Serie_Fibonacci
{    
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Ingrese la cantidad de términos de la serie Fibonacci que desea mostrar: ");
        int cantidadTerminos = scanner.nextInt();
        
        int primero = 0;
        int segundo = 1;
        System.out.print("Serie Fibonacci de " + cantidadTerminos + " términos: ");
        for (int i = 0; i < cantidadTerminos; i++) {
            System.out.print(primero + " ");
            int siguiente = primero + segundo;
            primero = segundo;
            segundo = siguiente;
        }
    }
}
