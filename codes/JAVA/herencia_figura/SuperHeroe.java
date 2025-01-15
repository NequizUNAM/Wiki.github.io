// Clase SuperHeroe con todos los métodos y atributos
class SuperHeroe{
    protected String nombre;

    // Constructor
    public SuperHeroe() {
        // this.nombre = nombre;
    }

    // Método para describir al superhéroe
    public void datosSuperHeroe(String nombre) {        
        System.out.println("Nombre: " + nombre);
        
        switch(nombre) {
            case "Superman":
                System.out.println("Fuerza: 310");
                System.out.println("Poder: 100");
                break;
            case "Hulk":
                System.out.println("Fuerza: 300");
                System.out.println("Poder: 100");
                break;
            default:
                System.out.println("Descripción no disponible");
                break;
        }
        
        System.out.println("\n");
    }
    
    public void prueba(){
       this.nombre = nombre; 
      System.out.println(nombre + "Super Heroe");
    }
}