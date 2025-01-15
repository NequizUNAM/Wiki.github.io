import javax.swing.*;
import java.awt.*;
import java.awt.event.*;

public class TextoFrame {

    public static void main(String[] args) {
        JFrame frame = new JFrame("Texto en Frame");
        frame.setSize(300, 150);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        JPanel panel = new JPanel(new GridLayout(2, 1, 5, 5)); // GridLayout con 2 filas y 1 columna, con espacios de 5 píxeles
        JTextField textField = new JTextField(20);
        JButton button = new JButton("Mostrar Texto");
        JLabel label = new JLabel();

        button.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String texto = textField.getText();
                label.setText(texto);
            }
        });

        // Agregar espacio alrededor de los componentes
        textField.setBorder(BorderFactory.createEmptyBorder(5, 5, 5, 5)); // Espacio de 5 píxeles en todos los lados
        button.setMargin(new Insets(5, 5, 5, 5)); // Espacio interno de 5 píxeles
        label.setBorder(BorderFactory.createEmptyBorder(5, 5, 5, 5)); // Espacio de 5 píxeles en todos los lados

        panel.add(textField);
        panel.add(button);
        frame.add(panel, BorderLayout.NORTH);
        frame.add(label, BorderLayout.CENTER);

        frame.setVisible(true);
    }
}
