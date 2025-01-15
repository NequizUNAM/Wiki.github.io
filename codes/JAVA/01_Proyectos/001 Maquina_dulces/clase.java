
/**
 * Write a description of class clase here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */
//aqui va la improtacion
import java.util.Scanner;
public class clase
{
    //constructor 
    public static void main (String [] args){    
        // aqui va el codigo
        Scanner teclado = new Scanner(System.in);  //instanciar

        int moneda = 0;
        int deposito = 0;
        int costo_total = 10;

        //metodos  while , do while, ciclo for
        while(deposito <= costo_total){
            // codigo de tus monedas
            System.out.println("Deposita 1 o 2 pesos..");
            int pesos = teclado.nextInt();

            //aqui va mi condicional  que son switch , IF
            switch(pesos){
                case 1: 
                    deposito = deposito + pesos;
                break;
                case 2:
                    deposito = deposito + pesos;
                break;
                default:
                    System.out.println("Moneda no aceptada");
                break;
            }
             System.out.println("Llevas" + deposito + "pesos");
             
            //condicional
            if( deposito > 10){
                int cambio = deposito - 10;
                System.out.println("Tu cambio es de" + cambio);
            }
        }// aqui termina while
        
        // menu de chocolates cacahuates
        while(deposito <= costo_total){
            System.out.println("presiona 1 para cacahuates o 2 para chocolates");
            int pesos = teclado.nextInt();
            
            switch(){
            case 1: //cacahuates
            break;
            case 2: //chocolates
            break;
            }
            
            //condicional
            if( deposito <= 10){
                System.out.println("Gracias pro la compra");
            }
        }
        
        
    }
}
