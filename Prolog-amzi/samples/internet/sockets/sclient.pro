/*
*   sclient.pro - a simple client
*
* $Log: sclient.pro,v $
* Revision 1.1.1.1  2000/12/29 01:53:55  dennis
* changed to a5 dir
*
* Revision 1.1.1.1  2000/11/23 01:37:45  dennis
* All the samples in the new amzi5 cvs directory
*
* Revision 1.4  2000/08/09 03:42:56  mary
* Changed default to Linux/Windows instead of Solaris.
*
* Revision 1.3  2000/08/09 03:22:11  mary
* Changed SOCK_STREAM to 2 to work under Solaris.
*
* Revision 1.2  2000/01/26 23:50:56  dennis
* Updated comments for Unix and CVS
*
*
*/

/*
   This client connects to a server running sserver.pro and sends it a string,
   then gets a string and closes the socket.

   To run, change the internet address used in inet_addr to the address of the
   computer running sserver.pro (both programs can run on the same machine).
   You must have TCP/IP running. If you are using a standalone machine, you 
   may have to dial-up to Internet to load your TCP/IP stack.

   Note that the wsaX predicates are not necessary for Unix, and simply
   return true in that environment.
*/

% NOTE!!! Uncomment the appropriate sdefine for your environment
% Linux & Windows
sdefine('SOCK_STREAM', 1).
% Solaris
%sdefine('SOCK_STREAM', 2).

main :-
   wsaStartup(0x0101, Ver, HighVer, Desc, Status, MaxSockets, MaxUdpDg),
   inet_addr($127.0.0.1$, NetAddr),
   sdefine('SOCK_STREAM', SOCK_STREAM),
   socket(SOCK_STREAM, 0, Sock),
   connect(Sock, NetAddr, 1001),
   write($Send what? $), read_string(Str),
   send(Sock, Str, 0, NumSent),
   recv(Sock, Buf, 4096, 0, NumRecv),
   write(Buf),
   closesocket(Sock),
   wsaCleanup.
