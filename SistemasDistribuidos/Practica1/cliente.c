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

int main( int argc, char *argv[] ){
	struct sockaddr_in direccionSocket;
	struct in_addr *direccionIP;
	int direccionPuerto;
	int Socket_Con_Servidor;
    int longitud_Cadena=0;
    int castRed;
	char cadena[100];
	if(argc!=3){
    printf("Tiene que escribir como parametros la ubicacion del servidor y puerto de servicio");
    return -1;
	}
	/*Se abre la conexion con el servidor, pasando el nombre del ordenador
	y el servicio solicitado.*/
	direccionIP=inet_addr(argv[1]);
	direccionPuerto=atoi(argv[2]);
	direccionSocket.sin_family = AF_INET;
	direccionSocket.sin_addr.s_addr=direccionIP;
	direccionSocket.sin_port=htons(direccionPuerto);
    Socket_Con_Servidor=socket(AF_INET, SOCK_STREAM, 0);
	if(Socket_Con_Servidor==-1){
		return -1;
		printf ("Error al crear el socket\n");
	}
	if(connect(Socket_Con_Servidor,(struct sockaddr *)&direccionSocket,
        sizeof(direccionSocket))==-1){
		printf ("Error al buscar servidor\n");
		return -1;
	}
	if (Socket_Con_Servidor == 1){
		printf ("No se pudo establecer conexion con el servidor\n");
		return -1;
	}

   //Se lee un entero con la longitud de la cadena, incluido el \0
   Lee_Socket(Socket_Con_Servidor,(char *)&castRed,sizeof(int));
   longitud_Cadena=ntohl(castRed);
   printf("Cliente C: Recibido %d\n",longitud_Cadena+1);

   //Se lee la cadena de la longitud indicada
   Lee_Socket(Socket_Con_Servidor, cadena, longitud_Cadena);
   printf("Cliente C: Recibido %s\n", cadena);

	//Se va a enviar una cadena de 6 caracteres, incluido el \0
   strcpy (cadena, "Adios");
   longitud_Cadena=strlen(cadena);

   //Antes de enviar el entero hay que transformalo a formato red
   castRed = htonl (longitud_Cadena);
   Escribe_Socket (Socket_Con_Servidor, (char *)&castRed, sizeof(longitud_Cadena));
   printf ("Cliente C: Enviado %d\n", longitud_Cadena+1);

   //Se envía la cadena
   Escribe_Socket(Socket_Con_Servidor, cadena, longitud_Cadena);
   printf ("Cliente C: Enviado %s\n", cadena);

	//Se cierra el socket con el servidor
	close (Socket_Con_Servidor);
}
