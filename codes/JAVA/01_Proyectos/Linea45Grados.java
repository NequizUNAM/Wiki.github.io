
/**
 * Write a description of class drawLine here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */
import javax.swing.*;
import java.awt.*;

public class Linea45Grados extends JPanel {

    @Override
    protected void paintComponent(Graphics g) {
        super.paintComponent(g);

        // Dimensiones del panel
        int width = getWidth();
        int height = getHeight();

        // Dibujar la línea de 45 grados
        g.drawLine(50, 50, width - 50, height - 50);
    }

    public static void main(String[] args) {
        JFrame frame = new JFrame("Línea de 45 Grados");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setSize(400, 400);
        frame.getContentPane().add(new Linea45Grados());
        frame.setVisible(true);
    }
}


