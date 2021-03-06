import java.io.*;

public class DatoSocket implements Serializable{

   public int longitudMensaje = 0;

   public String mensaje = "";

   public DatoSocket (String cadena)
   {
      if (cadena != null)
      {
         longitudMensaje = cadena.length();
         mensaje = cadena;
      }
   }

   public String toString ()
   {
       String resultado;
       resultado = Integer.toString(longitudMensaje+1) + " -- " + mensaje;
       return resultado;
   }

   public void writeObject(java.io.DataOutputStream out)
         throws IOException
     {
         out.writeInt (longitudMensaje+1);

         out.writeBytes (mensaje);

         out.writeByte ('\0');
     }
     public void readObject(java.io.DataInputStream in)
     throws IOException
     {
         // Se lee la longitud de la cadena y se le resta 1 para eliminar el \0 que
         // nos envía C.
         longitudMensaje=in.readInt()-1;

         // Array de bytes auxiliar para la lectura de la cadena.
         byte[]aux=null;

         aux=new byte[longitudMensaje];    // Se le da el tamaño
         in.read(aux, 0, longitudMensaje);   // Se leen los bytes
         mensaje=new String(aux); // Se convierten a String
         in.read(aux,0,1);     // Se lee el \0
     }
}
