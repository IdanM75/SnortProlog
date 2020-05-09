/* Linked list of extended predicates */

const int MAXMSG = 1000; // Maximum error msg length

class JExtPred
{
public:
   JNIEnv*    jenv;
   jclass     jcl;
   jmethodID  jmeth;
   char*      jmeth_name;
   char*      jclass_name;
   jobject    jobj;
   jlong      lseng;
   JExtPred*  pnext;

   ~JExtPred();
};
