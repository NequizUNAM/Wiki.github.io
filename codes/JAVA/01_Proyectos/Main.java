
import javax.swing.*;
import java.awt.event.*;

public class Main {
    public static void main(String[] args) {
        JFrame f = new JFrame();
        JMenuBar menub = new JMenuBar();
        f.setJMenuBar(menub);

        JMenu menu = new JMenu("Calculadora");
        menub.add(menu);

        JMenuItem menu1 = new JMenuItem("Suma");
        JMenuItem menu2 = new JMenuItem("Resta");
        JMenuItem menu3 = new JMenuItem("Multiplicación");
        JMenuItem menu4 = new JMenuItem("División");

        menu.add(menu1);
        menu.add(menu2);
        menu.add(menu3);
        menu.add(menu4);

        f.setSize(600, 700);
        f.setLayout(null);
        f.setVisible(true);
    }
}
