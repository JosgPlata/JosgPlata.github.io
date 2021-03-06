#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <arpa/inet.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <sys/un.h>
#include <netinet/in.h>
#include <netdb.h>
#include <unistd.h>
#include <errno.h>
#include "Socket.c"

int main(){
	//Descriptores de socket servidor y de socket con el cliente
	struct sockaddr_in direccionSocket;
	int socket_Servidor;
	int socket_Cliente;
    int longitud_Cadena;
    int castRed;
	char cadena[100];

	//obtenemos dirección Servidor
	struct in_addr *direccionIP;
	struct hostent *host;
	host=gethostbyname("Plata");
	if (host == NULL)
		return -1;
    direccionIP=(struct in_addr *)(host->h_addr);
    printf("Direccion Servidor: %s\n",inet_ntoa(*direccionIP));

	//obtenemos dirección del puerto (servicio del fichero /etc/services)
	unsigned short int direccionPuerto;
	struct servent *puerto;
	puerto=getservbyname("cpp_java", "tcp");
	direccionPuerto=puerto->s_port;
	if (puerto == NULL)
		return -1;
    printf("Direccion Puerto: %d\n",ntohs(direccionPuerto));

    //Se abre el socket
    socket_Servidor=socket(AF_INET,SOCK_STREAM,0);
	if (socket_Servidor == -1){
    printf("Error al crear el socket");
	 	return -1;
	}
	//Asigna dirección al socket
	direccionSocket.sin_family = AF_INET;
	direccionSocket.sin_port=puerto->s_port;
	direccionSocket.sin_addr.s_addr =INADDR_ANY;
	if(bind(socket_Servidor,(struct sockaddr *)&direccionSocket,
         sizeof(direccionSocket))==-1){
		close (socket_Servidor);
        printf("Error al asignar direccion al socket");
		return -1;
	}
	//Se avisa al sistema que comience a atender llamadas de clientes
	if (listen(socket_Servidor,1)==-1){
		close(socket_Servidor);
        printf("Error al atender la red");
		return -1;
	}

	//Se espera un cliente que quiera conectarse
	socklen_t longitud_Cliente;
	struct sockaddr cliente;
	longitud_Cliente=sizeof(cliente);
    printf ("Esperando comunicacion con los clientes\n");
	socket_Cliente=accept(socket_Servidor,&cliente,&longitud_Cliente);
	if(socket_Cliente==-1){
    printf ("No se puede abrir socket de cliente\n");
    return -1;
	}

   /*Se envia un entero con la longitud de una cadena (incluido el \0 del final) y
    la cadena.*/
   strcpy (cadena, "Hola");
   longitud_Cadena=strlen(cadena)+1;
   //El entero que se envía por el socket hay que transformalo a formato red
   castRed=htonl(longitud_Cadena);

   //Se envía el entero transformado
   Escribe_Socket(socket_Cliente,(char *)&castRed,sizeof(longitud_Cadena));
   printf("Servidor C: Enviado %d\n", longitud_Cadena);

   //Se envía la cadena
   Escribe_Socket(socket_Cliente,cadena,longitud_Cadena);
   printf("Servidor C: Enviado %s\n",cadena);

	/*Se lee la informacion del cliente, primero el número de caracteres de la cadena
    que vamos a recibir (incluido el \0) y luego la cadena.*/
   Lee_Socket(socket_Cliente,(char *)&castRed, sizeof(longitud_Cadena));

   //El entero recibido hay que transformarlo de formato red a formato hardware
   longitud_Cadena=ntohl(castRed);
   printf ("Servidor C: Recibido %d\n", longitud_Cadena);

   //Se lee la cadena
   Lee_Socket(socket_Cliente,cadena,longitud_Cadena);
   printf("Servidor C: Recibido %s\n",cadena);

	//Se cierran los sockets
	close(socket_Cliente);
	close(socket_Servidor);
    }
