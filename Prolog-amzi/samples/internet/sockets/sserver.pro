/*
*   sserver.pro - a simple server
*
* $Log: sserver.pro,v $
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
   This server listens for any connections, when it gets one it sends a 
   string, then receives a string.  It shutsdown when it receives the
   string 'shutdown'.

   To run, change the internet address in sclient.pro to the address of
   the machine you are running this program on (both programs can run
   on the same machine). You must have TCP/IP running. If you are using
   a standalone machine, you may have to dial-up to Internet to load your
   TCP/IP stack.

   Note that the wsaX predicates simply return true under Unix and
   are not necessary in that environment.
*/

% NOTE!!! Uncomment the appropriate sdefine for your environment
% Linux & Windows
sdefine('SOCK_STREAM', 1).
% Solaris
%sdefine('SOCK_STREAM', 2).

sdefine('INADDR_ANY',      0).

main :-
   wsaStartup(0x0101, Ver, HighVer, Desc, Status, MaxSockets, MaxUdpDg),
   sdefine('SOCK_STREAM', SOCK_STREAM),
   socket(SOCK_STREAM, 0, Sock),
   sdefine('INADDR_ANY', INADDR_ANY),
   bind(Sock, INADDR_ANY, 1001),
   listen(Sock, 1),
   repeat,
   select([Sock], [Sock], [Sock], 0, 0, ReadList, WriteList, ErrorList),
   catch(doreads(ReadList), X, endmain(Sock, X, Quit)),
   Quit == yes.

endmain(Sock, X, yes) :-
   closesocket(Sock),
   wsaCleanup.

doreads([]).
doreads([Sock | Rest]) :-
   accept(Sock, RAddr, RPort, NewSock),
   send(NewSock, $Hello Client$, 0, NumSent),
   recv(NewSock, Cmd, 4096, 0, NumRecv),
   write(Cmd), nl,
   closesocket(NewSock),
   (Cmd == $shutdown$ -> 
      write($Shutting down server ...\n$),
      throw(shutdown) 
   ; 
      true
   ),
   doreads(Rest).
