/*
CHELLO.H - header file for Hello Class
*/

#include "stdio.h"
#include "amzi.h"

const int MAXMSG=512;

class CHello : public CLogicServer
{
public:
   CHello() {};
   ~CHello();
   TF   init();
   void run();

private:
   RC   m_rc;

   void error(CLSException &E);
   void msg_out(char* msg);
};

