
/**
 * Write a description of class dsadas here.
 * 
 * @author (Laura Valeria Samano Jimenez) 
 * @version (a version number or a date)
 */
import java.util.Scanner;
public class ProblemaLineal3 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Ingrese el valor del ángulo en radianes: ");
        double radianes = scanner.nextDouble();
        double grados = Math.toDegrees(radianes);
        int minutos = (int) ((grados - (int) grados) * 60);
        int segundos = (int) ((grados - (int) grados - (minutos / 60.0)) * 3600);
        System.out.println("El ángulo en grados es: " + (int) grados + "° " +(minutos) + "'Minutos " + (segundos) + "'Segundos'");
        scanner.close();
    }
}
