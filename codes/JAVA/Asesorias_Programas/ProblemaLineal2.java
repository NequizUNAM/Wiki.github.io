
/**
 * Write a description of class mdmasdfdas here.
 * 
 * @author (Laura Valeria Samano Jimenez) 
 * @version (a version number or a date)
 */
import java.util.Scanner;
public class ProblemaLineal2 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Ingrese la cantidad de pesos: ");
        int cantidad = scanner.nextInt();
        int billetes500 = cantidad / 500;
        cantidad %= 500;
        int billetes200 = cantidad / 200;
        cantidad %= 200;
        int billetes100 = cantidad / 100;
        cantidad %= 100;
        int billetes50 = cantidad / 50;
        cantidad %= 50;
        int billetes20 = cantidad / 20;
        cantidad %= 20;
        int monedas10 = cantidad / 10;
        cantidad %= 10;
        int monedas5 = cantidad / 5;
        cantidad %= 5;
        System.out.println("Billetes de $500: " + billetes500);
        System.out.println("Billetes de $200: " + billetes200);
        System.out.println("Billetes de $100: " + billetes100);
        System.out.println("Billetes de $50: " + billetes50);
        System.out.println("Billetes de $20: " + billetes20);
        System.out.println("Monedas de $10: " + monedas10);
        System.out.println("Monedas de $5: " + monedas5);
        System.out.println("Monedas de $1: " + cantidad);
    }
}
