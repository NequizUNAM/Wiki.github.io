
/**
 * Write a description of class algo here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */
import java.util.Scanner;
public class ContraseñaApp {
  
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        String contraseña="eureka";
  
        final int INTENTOS = 3;
         
        //Esta variable booleana, nos controlara que en caso de que acierte la condicion cambie
        boolean acierto=false;
        String password;
        System.out.println("Introduce una contraseña");
        
        for (int i=0;i<INTENTOS && !acierto;i++){
            password = sc.next();
  
            //Comprobamos si coincide, no usamos ==, usamos el metodo equals
            if (password.equals(contraseña)){
                System.out.println("Enhorabuena, acertaste");
                acierto=true;
            }else{
                System.out.println("Contraseña, incorrecta , introduce de nuevo");
            }
        }
        
        sc.close();
    }
    
}
