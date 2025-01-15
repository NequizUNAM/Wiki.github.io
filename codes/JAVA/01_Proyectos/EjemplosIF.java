
/**
 * Write a description of class EjemplosIF here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
  En este caso, el método equals() compara el contenido de cadena1 con el contenido de cadena2,
  y como son iguales, el resultado será "Las cadenas son iguales."
  Es importante mencionar que en Java, 
  cuando se comparan cadenas, es preferible usar equals() en lugar del operador ==,
  ya que equals() compara el contenido de las cadenas,
  mientras que == compara las referencias de los objetos.
*/

import java.util.Scanner;
   
public class EjemplosIF
{
    public static void main(String[] args) {
        // Crear un objeto Scanner para leer la entrada del usuario
        Scanner scanner = new Scanner(System.in);

        // Solicitar al usuario que ingrese sus datos
        System.out.println("Por favor completa el formulario:");
        System.out.print("Nombre: ");
        String nombre = scanner.nextLine();

        System.out.print("Edad: ");
        int edad = scanner.nextInt();
        scanner.nextLine(); // Consumir la nueva línea después de nextInt()

        System.out.print("Correo electrónico: ");
        String correo = scanner.nextLine();

        // Validar la edad
        if (edad < 0 || edad > 120) {
            System.out.println("La edad ingresada no es válida.");
            System.out.println("Por favor ingresa una edad válida entre 0 y 120 años.");
        } else {
            // Mostrar los datos ingresados
            System.out.println("\n¡Gracias! Has ingresado los siguientes datos:");
            System.out.println("Nombre: " + nombre);
            System.out.println("Edad: " + edad);
            System.out.println("Correo electrónico: " + correo);
        }

        
        if (nombre.equals("pedro") && edad == 15) {
            System.out.println("Correcto tu Nombre es : " + nombre + "Y tienes " + edad );
        } else {
            System.out.println("Error se esperaban los datos pedro  y edad 15");
        }

        
        System.out.println("");
         
        System.out.print("Ingresa un texto el que sea: ");
        String texto = scanner.nextLine();
        if(texto.equals("hola mundo")){
            System.out.println("El texto ingresado es el correcto:");
        }else{
             System.out.println("Debiste Ingresar hola mundo");
        }

        // Cerrar el objeto Scanner para liberar recursos
        scanner.close();
    }
}
