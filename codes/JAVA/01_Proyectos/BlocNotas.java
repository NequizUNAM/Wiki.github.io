import javax.swing.*;
import java.awt.event.*;
import java.io.*;
import javax.swing.filechooser.FileNameExtensionFilter;

public class BlocNotas {
    private JFrame ventana;
    private JTextArea notas;

    public BlocNotas() {
        // Inicializa la ventana
        ventana = new JFrame("Mi bloc de Notas");
        ventana.setSize(600, 400);

        // Inicializa el área de texto
        notas = new JTextArea();
        JScrollPane scrollNotas = new JScrollPane(notas);
        ventana.add(scrollNotas);

        // Inicializa la barra de menú
        JMenuBar menuBar = new JMenuBar();
        JMenu archivoMenu = new JMenu("Archivo");
        JMenu ayudaMenu = new JMenu("Ayuda");
        JMenuItem nuevoItem = new JMenuItem("Nuevo");
        JMenuItem abrirItem = new JMenuItem("Abrir...");
        JMenuItem guardarItem = new JMenuItem("Guardar");
        JMenuItem salirItem = new JMenuItem("Salir");
        JMenuItem acercaDeItem = new JMenuItem("Acerca de...");

        archivoMenu.add(nuevoItem);
        archivoMenu.add(abrirItem);
        archivoMenu.add(guardarItem);
        archivoMenu.addSeparator(); // Separador entre elementos
        archivoMenu.add(salirItem);
        ayudaMenu.add(acercaDeItem);

        menuBar.add(archivoMenu);
        menuBar.add(ayudaMenu);

        // Asignar la barra de menú a la ventana
        ventana.setJMenuBar(menuBar);

        // Listener para el botón "Nuevo"
        nuevoItem.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                notas.setText(""); // Limpiar el área de texto
            }
        });

        // Listener para el botón "Abrir..."
        abrirItem.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                abrirArchivo();
            }
        });

        // Listener para el botón "Guardar"
        guardarItem.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                guardarArchivo();
            }
        });

        // Listener para el botón "Salir"
        salirItem.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                System.exit(0); // Salir de la aplicación
            }
        });

        ventana.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        ventana.setVisible(true);
    }

    // Método para abrir un archivo de texto
    private void abrirArchivo() {
        JFileChooser fileChooser = new JFileChooser();
        fileChooser.setDialogTitle("Abrir Archivo");
        FileNameExtensionFilter filter = new FileNameExtensionFilter("Archivos de texto (*.txt)", "txt");
        fileChooser.setFileFilter(filter);

        int seleccion = fileChooser.showOpenDialog(ventana);
        if (seleccion == JFileChooser.APPROVE_OPTION) {
            File archivo = fileChooser.getSelectedFile();
            try {
                BufferedReader br = new BufferedReader(new FileReader(archivo));
                String linea;
                StringBuilder contenido = new StringBuilder();
                while ((linea = br.readLine()) != null) {
                    contenido.append(linea).append("\n");
                }
                br.close();
                notas.setText(contenido.toString());
            } catch (IOException ex) {
                ex.printStackTrace();
            }
        }
    }

    // Método para guardar el contenido del área de texto en un archivo
    private void guardarArchivo() {
        JFileChooser fileChooser = new JFileChooser();
        fileChooser.setDialogTitle("Guardar Archivo");
        FileNameExtensionFilter filter = new FileNameExtensionFilter("Archivos de texto (*.txt)", "txt");
        fileChooser.setFileFilter(filter);

        int seleccion = fileChooser.showSaveDialog(ventana);
        if (seleccion == JFileChooser.APPROVE_OPTION) {
            File archivo = fileChooser.getSelectedFile();
            try {
                BufferedWriter bw = new BufferedWriter(new FileWriter(archivo));
                bw.write(notas.getText());
                bw.close();
            } catch (IOException ex) {
                ex.printStackTrace();
            }
        }
    }

    public static void main(String[] args) {
        SwingUtilities.invokeLater(new Runnable() {
            public void run() {
                new BlocNotas();
            }
        });
    }
}
