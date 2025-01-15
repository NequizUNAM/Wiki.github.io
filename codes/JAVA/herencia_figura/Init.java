class Rectangulo {
    private double longitud;
    private double ancho;

    public Rectangulo(double longitud, double ancho) {
        this.longitud = longitud;
        this.ancho = ancho;
    }

    public double calcularArea() {
        return longitud * ancho;
    }

    // Otros métodos relacionados con rectángulos...
}

class Circulo {
    // private double radio;

    // public Circulo(double radio) {
        // this.radio = radio;
    // }

    public double calcularArea(double radio) {
        return Math.PI * radio * radio;
    }

    // Otros métodos relacionados con círculos...
}

public class Init {
    public static void main(String[] args) {
        Rectangulo rectangulo = new Rectangulo(5, 3);
        Circulo circulo = new Circulo();

        double areaRectangulo = rectangulo.calcularArea();
        double areaCirculo = circulo.calcularArea(4);

        System.out.println("Área del rectángulo: " + areaRectangulo);
        System.out.println("Área del círculo: " + areaCirculo);
    }
}
