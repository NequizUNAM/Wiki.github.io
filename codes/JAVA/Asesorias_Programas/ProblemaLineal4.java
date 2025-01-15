
/**
 * Write a description of class ADASD here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */
import java.util.Scanner;
public class ProblemaLineal4 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Coloca el número de comensales que hay: ");
        int comensales = scanner.nextInt();
        System.out.print("Coloca el precio por kilo del arroz: ");
        double precioArroz = scanner.nextDouble();
        System.out.print("Coloca el precio por kilo de los camarones: ");
        double precioCamarones = scanner.nextDouble();
        double arroz = comensales * 0.5; 
        double camarones = comensales * 0.25; 
        double costoTotal = (arroz * precioArroz) + (camarones * precioCamarones);
        System.out.println("La cantidad de arroz que es necesaria es de: " + arroz + " kilos");
        System.out.println("La cantidad de camarones que  es necesaria es de: " + camarones + " kilos");
        System.out.println("El costo total de la paella sera de: $" + costoTotal);
    }
}
