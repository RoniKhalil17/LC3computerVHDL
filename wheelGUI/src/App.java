import javax.swing.JButton;
import javax.swing.JFrame;
import java.awt.Color;
import javax.swing.JPanel;
import java.awt.Graphics;
import java.awt.Graphics2D;
import javax.swing.Timer;
public class App {
    public static void main(String[] args) {
        int width = 900;
        int height = 600;
        JFrame frame = new JFrame("LC3 Wheel Game");
        frame.setSize(width, height);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.getContentPane().setBackground(Color.BLACK);

        RotatePanel cirkelPanel = new RotatePanel(width, height);
        frame.add(cirkelPanel);
        frame.setVisible(true);

        // Animate using a Swing timer

    }
}
class RotatePanel extends JPanel {
    private int width, height;
    private double angle = 0;

    public RotatePanel(int width, int height) {
        this.width = width;
        this.height = height;
        this.setOpaque(false);
    }

    public void incrementAngle(double delta) {
        angle += delta;
    }
    @Override
    protected void paintComponent(Graphics g) {
        super.paintComponent(g);

        Graphics2D g2d = (Graphics2D) g;
        int cx = width / 2;
        int cy = height / 2;

        // Move origin to center and rotate
        g2d.translate(cx, cy);
        g2d.rotate(Math.toRadians(angle));
        int j=0;
        g2d.setColor(Color.GREEN);
        g2d.fillArc(-150, -150, 300, 300, j, 36);
        j+=36;
        g2d.setColor(Color.BLUE);
        g2d.fillArc(-150, -150, 300, 300, j, 36);

        j+=36;
        g2d.setColor(Color.RED);
        g2d.fillArc(-150, -150, 300, 300, j, 36);

        j+=36;
        g2d.setColor(Color.GREEN);
        g2d.fillArc(-150, -150, 300, 300, j, 36);

        j+=36;
        g2d.setColor(Color.GRAY);
        g2d.fillArc(-150, -150, 300, 300, j, 36);

        j+=36;
        g2d.setColor(Color.ORANGE);
        g2d.fillArc(-150, -150, 300, 300, j, 36);

        j+=36;
        g2d.setColor(Color.RED);
        g2d.fillArc(-150, -150, 300, 300, j, 36);

        j+=36;
        g2d.setColor(Color.WHITE);
        g2d.fillArc(-150, -150, 300, 300, j, 36);

        j+=36;
        g2d.setColor(Color.YELLOW);
        g2d.fillArc(-150, -150, 300, 300, j, 36);

        j+=36;
        g2d.setColor(Color.RED);
        g2d.fillArc(-150, -150, 300, 300, j, 36);

 
    }

}