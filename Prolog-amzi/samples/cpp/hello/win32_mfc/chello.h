/*
CHELLO.H - header file for Hello Class
*/

#include "amzi.h"

const int MAXMSG=512;

class CHello : public CLogicServer
{
public:
   CHello() {};
   ~CHello();
   void init();
   void run();

private:
   RC   m_rc;

   void error(CLSException &E);
   void msg_out(char* msg);
};

