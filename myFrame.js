package javaSwing;
import java.awt.*;
import javax.swing.JFrame;
public class myFrame extends JFrame
{

    myFrame()
    {
        //   super("This Is My First Frame");
        setSize(200,200);
        setVisible(true);
        setTitle("This Is My First Frame")
        setDefaultCloseOperation(EXIT_ON_CLOSE);
    }
    public static void main(String args[])
{
    new myFrame();

}
}