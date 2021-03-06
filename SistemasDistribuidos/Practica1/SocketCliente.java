import java.net.*;
import java.io.*;

public class SocketCliente
 {
     public static void main (String [] args)
     {
         new SocketCliente();
     }

     public SocketCliente()
     {
         try
         {
             Socket socket = new Socket ("Plata", 15557);
             System.out.println ("conectado");

             socket.setSoLinger(true, 15);

             DataInputStream bufferEntrada =
                new DataInputStream (socket.getInputStream());

             DatoSocket dato = new DatoSocket("");
             dato.readObject(bufferEntrada);
             System.out.println ("Cliente Java: Recibido " + dato.toString());

             DataOutputStream bufferSalida =
               new DataOutputStream (socket.getOutputStream());

             DatoSocket aux = new DatoSocket("Adios");
             aux.writeObject(bufferSalida);

             System.out.println ("Cliente Java: Enviado " + aux.toString());

             socket.close();
         }
         catch (Exception e)
         {
             e.printStackTrace();
         }
     }
}
