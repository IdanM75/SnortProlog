/*
*   finger.pro - a simple finger client
*
* $Log: finger.pro,v $
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
* Revision 1.2  2000/01/26 23:35:32  dennis
* Updated samples for Unix
*
*
*/

% Note that the wsaX predicates are not necessary under Unix,
% and simply return true.

% NOTE!!! Uncomment the appropriate sdefine for your environment
% Linux & Windows
sdefine('SOCK_STREAM', 1).
% Solaris
%sdefine('SOCK_STREAM', 2).

main :-
   wsaStartup(0x0101, Ver, HighVer, Desc, Status, MaxSockets, MaxUdpDg),
   write($Host name to finger? $), read_string(HostName),
   gethostbyname(HostName, AliasList, [NetAddr | AddrList]),
   inet_ntoa(NetAddr, DotAddr),
   write(DotAddr), nl,
   sdefine('SOCK_STREAM', SOCK_STREAM),
   socket(SOCK_STREAM, 0, Sock),
   connect(Sock, NetAddr, 79),
   write($Sock=$), write(Sock), nl,
   write($Login id name? $), read_string(LoginName),
   strcat(LoginName, $\x0d\x0a$, SendBuf),
   write($Sending request$), nl,
   send(Sock, SendBuf, 0, NumSent),
   write($Waiting for response$), nl,
   recv(Sock, Buf, 4096, 0, NumRecv),
   write(Buf), nl,
   closesocket(Sock),
   wsaCleanup.
