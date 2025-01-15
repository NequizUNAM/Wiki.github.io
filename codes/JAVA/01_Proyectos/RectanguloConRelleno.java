
/**
 * Write a description of class RectanguloConRelleno here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */
import javax.swing.*;
import java.awt.*;

public class RectanguloConRelleno extends JPanel {

    @Override
    protected void paintComponent(Graphics g) {
        super.paintComponent(g);

        // Dimensiones del panel
        int width = getWidth();
        int height = getHeight();

        // Dibujar el rectángulo con relleno
        g.setColor(Color.RED);
        g.fillRect(50, 50, width - 100, height - 100);
    }

    public static void main(String[] args) {
        JFrame frame = new JFrame("Rectángulo con Relleno");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setSize(400, 400);
        frame.getContentPane().add(new RectanguloConRelleno());
        frame.setVisible(true);
    }
}

