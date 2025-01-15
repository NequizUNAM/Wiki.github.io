
/**
 * Write a description of class ProblemaCondicional5 here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */
import java.util.Scanner;
public class ProblemaCondicional5 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Coloca el nombre del producto: ");
        String nombreProducto = scanner.nextLine();
        System.out.print("Coloca el precio unitario del producto: ");
        double precioUnitario = scanner.nextDouble();
        System.out.print("Coloca la cantidad de productos a comprar: ");
        int cantidad = scanner.nextInt();
        double subtotal = precioUnitario * cantidad;
        double descuento;
        if (subtotal < 500) {
            descuento = 0;
        } else if (subtotal <= 1000) {
            descuento = subtotal * 0.05;
        } else if (subtotal <= 7000) {
            descuento = subtotal * 0.11;
        } else if (subtotal <= 15000) {
            descuento = subtotal * 0.18;
        } else {
            descuento = subtotal * 0.25;
        }
        double iva = subtotal * 0.16;
        double totalPagar = subtotal - descuento + iva;
        System.out.println("\nFactura:");
        System.out.println("Nombre del producto: " + nombreProducto);
        System.out.println("Precio unitario: $" + precioUnitario);
        System.out.println("Cantidad: " + cantidad);
        System.out.println("Subtotal: $" + subtotal);
        System.out.println("Descuento: $" + descuento);
        System.out.println("IVA (16%): $" + iva);
        System.out.println("Total a pagar: $" + totalPagar);
  }
}
