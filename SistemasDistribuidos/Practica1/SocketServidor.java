import java.net.*;
import java.io.*;

public class SocketServidor
{
    public static void main (String [] args)
    {
        new SocketServidor();
    }

    public SocketServidor()
    {
        try
        {
            ServerSocket socket = new ServerSocket (15557);

            System.out.println ("Esperando cliente");
            Socket cliente = socket.accept();
            System.out.println ("Conectado con cliente de " + cliente.getInetAddress());

            cliente.setSoLinger(true, 15);

            DatoSocket dato = new DatoSocket("Hola");

            DataOutputStream bufferSalida =
                new DataOutputStream (cliente.getOutputStream());

            dato.writeObject (bufferSalida);
            System.out.println ("Servidor Java: Enviado " + dato.toString());

            DataInputStream bufferEntrada =
               new DataInputStream (cliente.getInputStream());

            DatoSocket aux = new DatoSocket("");
            aux.readObject (bufferEntrada);
            System.out.println ("Servidor java: Recibido " + aux.toString());

            cliente.close();

            socket.close();
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }
}
