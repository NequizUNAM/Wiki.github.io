
/**
 * Write a description of class CondicionalesJava here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */
public class CondicionalesJava
{
    public static void main(String[] args) {
        boolean condicion;
        if (condicion) {
            // ejecutar();
        }

        // Los {} son opcionales
        if (condicion)
            // ejecutar();

        // Y mas compacto
        if (condicion) /*ejecutar() */;
        // Por lo tanto el uso de las llaves es opcional cuando dentro de la condición hay una sola línea de código, 
        // pero puede generar errores si se añade más código que se espere que se ejecute bajo la condición si no recordamos que tenemos que añadir las llaves en estos casos.
        // Personalmente, prefiero usar las llaves y en caso de no utilizarlas pondría el if completo en una única línea para que sea más claro que la condición solo aplica a esa línea.
        // Para que se ejecute el código dentro de un if se debe de cumplir la condición que puede ser directamente un boolean o una comprobación que genere uno (==,<,<=,>,>=,!=,.
        // equals() o cualquier otra función que devuelva true o false pudiendo ser la condición todo lo compleja que queramos.

        // Si la temperatura es mayor que 25
        int temperatura = 0;
        if (temperatura > 25) {
            System.out.println("A la playa!!!");
        }

        // Si haceSol es vedadero  
        boolean haceSol, nevando;
        if (haceSol) {
            System.out.println("No te olvides la sombrilla");
        }

        // Si esta nevando o hace sol
        if (nevando || haceSol) {
            System.out.println("Que bien");
        }

        // Si nevando y la temperatura esta entre 20 y 30
        if (nevando && (temperatura >= 20 && temperatura <= 30)) {
            System.out.println("No me lo creo");
        }

        // Si la temperatura es menor que 0 o mayor que 30 y hace sol
        if ((temperatura < 0 || temperatura > 30) && haceSol) {
            System.out.println("Mejor me quedo en casa");
        }

        /* IF ELSE EN JAVA
         * Con el if solo podemos hacer que se ejecute un fragmento de código o no pero en el caso de que no se cumpla la
         * condición no se hace nada (sigue el flujo normal de ejecución) por lo que si queremos que se ejecute otra cosa cuando no se cumpla la condición solo con el if 
         * tenemos que hacer otro con la condición inversa provocando que se tenga que comprobar la condición 2 veces mientras que si usamos el else solo necesitamos hacer la
         * comprobación una sola vez.*/

        // Usando solo ifs
        if (temperatura > 25) {
            System.out.println("A la playa!!!");
        }

        if (temperatura <= 25) {
            System.out.println("Esperando al buen tiempo...");
        }

        // Usando if con else
        // Si la temperatura es mayor que 25 ... y si no ...
        if (temperatura > 25) {
            System.out.println("A la playa!!!");
        } else {
            System.out.println("Esperando al buen tiempo...");
        }

        /* IF ELSE IF EN JAVA
        El siguiente nivel es hacer el else condicional añadiendo un if para que si no se cumple la primera condición (la del if principal) 
        se evalue esta nueva condición de modo que se puede concatenar la cantidad de if else que se necesiten para cubrir todos los distintos
        escenarios que precisen ser tratados de una forma particular, siendo el ultimo else el que se ejecute cuando no se cumpla 
        ninguna condición (el else es siempre opcional).
         */

        if (temperatura > 25) {
            // Si la temperatura es mayor que 25 ...
            System.out.println("A la playa!!!");
        } else if (temperatura > 15) {
            // si es mayor que 15 y no es mayor que 25 ..
            System.out.println("A la montaña!!!");
        } else if (temperatura < 5 && nevando) {
            // si es menor que 5 y esta nevando y no es mayor que 15 ni mayor que 25
            System.out.println("A esquiar!!!");
        } else {
            // si la tempera  no es mayor que 25 ni que 15 ni menor que 5 si esta nevando
            System.out.println("A descansar... zZz");
        }

        /*
        IF ANIDADOS
        Es posible anidar ifs para reorganizar las condiciones o hacerlas más sencillas lo que en muchas ocasiones hace el código más fácil de leer,
        a continuación una de las posibles formas posibles para reescribir el ejemplo anterior.
         */

        if (temperatura > 15) {
            if (temperatura > 25) {
                // Si la temperatura es mayor que 25 ...
                System.out.println("A la playa!!!");
            } else {
                System.out.println("A la montaña!!!");
            }
        } else if (temperatura < 5) {
            if (nevando) {
                System.out.println("A esquiar!!!");
            }
        } else {
            System.out.println("A descansar... zZz");
        }

        /*
        EL OPERADOR TERNARIO ?: EN JAVA
        En ocasiones un if se utiliza simplemente para obtener un valor u otro en función de si una se cumple una condición o no, 
        en estos casos se puede sustituir la estructura if else por el operador ternario u operador condicional que tiene 
        la sintaxis resultado = condicion ? valor_si_se_cumple : valor_si_no_se_cumple los valores tanto para el caso de que se cumpla como para el
        que no pueden ser valores directamente como un texto o un entero o llamadas a funciones que devuelvan un objeto del tipo esperado.
         */

        // Ejemplo 1
        String queHacer = (temperatura > 25) ? "A la playa!!!" : "Esperando al buen tiempo...";

        // Ejemplo 2
        double numero = (temperatura > 10) ? (Math.random() * 10) : 0;

        // Ejemplo 3
        /*
        Comida miComida = cansado ? pedirComida("china") : hacerComida(); 
        SWITCH EN JAVA
        Con el switch se puede hacer un control del tipo if else if… más estructurado pero en realidad no exactamente igual
        puesto que con el switch lo que se hace es definir un conjunto de casos que van a tener una ejecución distinta y se ejecutará 
        el caso que coincida con el valor indicado en el switch.
         */

        // Número del día de la semana ingresado por el usuario
        int numeroDia = 3; // Ejemplo, puedes modificar este valor según sea necesario

        // Variable para almacenar el nombre del día
        String nombreDia;

        // Utilizando un switch para determinar el día de la semana
        switch (numeroDia) {
            case 1:
                nombreDia = "Lunes";
                break;
            case 2:
                nombreDia = "Martes";
                break;
            case 3:
                nombreDia = "Miércoles";
                break;
            case 4:
                nombreDia = "Jueves";
                break;
            case 5:
                nombreDia = "Viernes";
                break;
            case 6:
                nombreDia = "Sábado";
                break;
            case 7:
                nombreDia = "Domingo";
                break;
            default:
                nombreDia = "Número de día inválido";
                break;
        }

        // Mostrar el resultado
        System.out.println("El día correspondiente al número " + numeroDia + " es: " + nombreDia);

        /*
        Por lo tanto el switch es la mejor opción cuando tenemos un conjunto de valores esperados (if con == o .equals())
        porque es más legible y más limpio, imagina por ejemplo sacar el nombre del dia de la semana a partir de su número,
        con un if else necesitamos 7 elses… pero es completamente inservible para condiciones en las que se hacen comparaciones del tipo < o > por que controlar 
        todos los posibles valores puede ser una locura, 
        suponiendo que el rango no esté muy acotado que entonces si sería una opción valida.
         */

        // Switch con int como condicion
        Integer dia = Calendar.getInstance().get(Calendar.DAY_OF_WEEK);
        switch (dia) {
            case 1:
                System.out.println("Domingo");
                break;
            case 2:
                System.out.println("Lunes");
                break;
            case 3:
                System.out.println("Martes");
                break;
            case 4:
                System.out.println("Miercoles");
                break;
            case 5:
                System.out.println("Jueves");
                break;
            case 6:
                System.out.println("Viernes");
                break;
            case 7:
                System.out.println("Sabado");
                break;
                // default: es opcional
        }

        // Switch con String como condicion
        String tipoVehiculo = "coche";
        switch (tipoVehiculo) {
            case "coche":
                System.out.println("Puedes pasar de 00:00 a 08:00");
                break;
            case "camion":
                System.out.println("Puedes pasar de 08:00 a 16:00");
                break;
            case "moto":
                System.out.println("Puedes pasar de 16:00 a 24:00");
                break;
            default:
                System.out.println("No se puede pasar con un " + tipoVehiculo);
                break;
        }

        /*
        De los dos ejemplos anteriores podemos sacar que el número de casos es variable según las necesidades y que el caso por
        defecto (el que se ejecuta cuando no se cumple otro igual que el else de un if) es opcional por lo que lo podemos omitir
        si no se requiere ninguna acción especial para ese caso o si simplemente sabemos que no existe otra opción como sucede con los días de la semana.
        Y si se quiere que en varios casos se ejecute la misma lógica no es necesario repetirla una y otra vez para cada caso, 
        en su lugar podemos agrupar los casos y eliminar los break intermedios que hacen que se salga del switch.
        Por ejemplo para realizar una acción para los días laborables y otra distinta para los festivos se hace del siguiente modo.
         */
        switch (dia) {
            case 2:
            case 3:
            case 4:
            case 5:
            case 6:
                System.out.println("Dia laboral");
                break;
            case 1: 
            case 7:
                System.out.println("Fin de semana");
                break;
            default:
                System.out.println("La semana solo tiene 7 dias");
                break;
        }
        
        /*
        Por ejemplo si fuese martes entraría por el 3, sigue por el 4,5 y 6 imprime el texto «Dia laboral» 
        y termina, es decir cuando entra en el switch ejecuta todo el código que encuentre hasta que se 
        termine o hasta que se encuentre un break por lo que podemos aprovechar esto para casos en los que los casos no ejecutan lógica excluyente si no que lo que hacen es añadir más funcionalidad. Un ejemplo muy simple para ver esto es sacar el número de días restantes hasta el fin de semana partiendo del ejemplo anterior.
        Integer diasHastaFinSemana = 0;
        */
       
        switch (dia) {
            case 2:
                diasHastaFinSemana++;
            case 3:
                diasHastaFinSemana++;
            case 4:
                diasHastaFinSemana++;
            case 5:
                diasHastaFinSemana++;
            case 6:
                System.out.println("Dia laboral: Dias restantes hasta el fin de semana: " + diasHastaFinSemana);
                break;
            case 1: 
            case 7:
                System.out.println("Fin de semana");
                break;
            default:
                System.out.println("La semana solo tiene 7 dias");
                break;
        }
        
        /*
        Y para terminar comentar que cualquier switch se puede hacer usando ifs else porque al fin y
        al cabo son la base sobre la que se sustenta su funcionamiento.
        Podemos verlo con la conversión del último ejemplo que es el más complejo de los switch que hemos visto.
        Integer diasHastaFinSemana = 0;
        */
        
        if (dia > 1 && dia < 7) {
            if (dia < 6) {
                diasHastaFinSemana++;
                if (dia < 5) {
                    diasHastaFinSemana++;
                    if (dia < 4) {
                        diasHastaFinSemana++;
                        if (dia < 3) {
                            diasHastaFinSemana++;
                        }
                    }
                }
            }           
            System.out.println("Dia laboral: Dias restantes hasta el fin de semana: " + diasHastaFinSemana);
        } else if (dia == 1 || dia == 7) {
            System.out.println("Fin de semana");
        } else {
            System.out.println("La semana solo tiene 7 dias");
        }
        
        /*
        O de la siguiente forma que refleja de un modo más claro las condiciones que se evalúan en el switch
        y que sería igualmente valido si la variable fuese un string en lugar de un número.
        */

       int diasHastaFinSemana= 0;
        if (dia == 2) {
            diasHastaFinSemana++;
        }

        if (dia == 2 || dia == 3) {
            diasHastaFinSemana++;
        }

        if (dia == 2 || dia == 3 || dia == 4) {
            diasHastaFinSemana++;
        }

        if (dia == 2 || dia == 3 || dia == 4 || dia == 5) {
            diasHastaFinSemana++;
        }

        if (dia == 2 || dia == 3 || dia == 4 || dia == 5 || dia == 6) {         
            System.out.println("Dia laboral: Dias restantes hasta el fin de semana: " + diasHastaFinSemana);
        }

        if (dia == 1) {
            // No hace nada
        }

        if (dia == 1 || dia == 7) {
            System.out.println("Fin de semana");
        } 

        if (dia != 1 && dia != 2 && dia != 3 && dia != 4 && dia != 5 && dia != 6 && dia != 7) {
            System.out.println("La semana solo tiene 7 dias");
        }    

    }
}
