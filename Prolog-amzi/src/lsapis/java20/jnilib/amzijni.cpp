/* Amzi! interface DLL for Java 1.2

   Note - Both Java and Amzi! are Unicode based, so the string
   conversion routines used here are the jstring to Unicode ones,
   not the UTF-8 ones. To build this project, make sure the
   _UNICODE flag is set for the compiler. */

#if defined(_WINDOWS) || defined(_WIN32)
#include <windows.h>
#endif

#include <stdlib.h>
//#include <iostream.h>

#include "amzi.h"
#include "amzi_ls_LogicServer.h"
#include "amzi_ls_LSException.h"
#include "amzijni.h"


/*
#if defined(__GNUC__)
//#if defined(LINUX)
#include <stdlib.h>
#elif defined(__sun)
#include "stdlib.h"
#include <string.h>
#include <iostream.h>
#endif
*/

// Sun's JNI use unsigned short for Unicode characters,
// rather than wchar_t.  So we need both types to see if
// we can get the compiler happy about various arguments.
// Further, because we can't be sure wchar_t is a short,
// we need to have another conversion.  aaarghh.

//#elif defined(LINUX) && defined(_UNICODE)
#if defined(__GNUC__) && defined(_UNICODE)
typedef jchar jCHAR;
#elif defined(__sun) && defined(_UNICODE)
typedef unsigned short jCHAR;
#else
typedef aCHAR jCHAR;
#endif

void ac_to_jc(jCHAR *jc, aCHAR *ac, int len)
{
   for (int i=0; i<=len; i++)
      jc[i] = ac[i];
   jc[len] = 0;
}


aCHAR MsgBuf[MAXMSG];  // A buffer for error messages
jCHAR jcMsgBuf[MAXMSG];

/* This function is used to make a clean copy of a Java string
   that can be used by the LSAPI interface.  It assumes that
   jenv is the pointer to the Java environment. You need to
   delete the string when it is no longer in use. */

aCHAR* JtoC(JNIEnv * jenv, jstring jstr)
{
   const jCHAR *jtmp;
   aCHAR* cstr;
   int    len;

   // Note that GetStringChars does not return
   // a null terminated Unicode string, but rather
   // just an array, that appears null terminated
   // for arrays with an odd length.
   jtmp = jenv->GetStringChars(jstr, NULL);
   len = jenv->GetStringLength(jstr);
   cstr = new aCHAR[len+1];
   for (int i=0; i < len; i++)
      cstr[i] = (aCHAR)jtmp[i];
   cstr[len] = 0;
   jenv->ReleaseStringChars(jstr, jtmp);

   return cstr;
}

/* Another version for non-Unicode strings */

char* JtoCA(JNIEnv * jenv, jstring jstr)
{
   const char *jtmp;
   char* cstr;
   int    len;

   // Note that GetStringChars does not return
   // a null terminated string, but rather
   // just an array.
   jtmp = jenv->GetStringUTFChars(jstr, NULL);
   len = jenv->GetStringUTFLength(jstr);
   cstr = new char[len+1];
   for (int i=0; i < len; i++)
      cstr[i] = (char)jtmp[i];
   cstr[len] = 0;
   jenv->ReleaseStringUTFChars(jstr, jtmp);

   return cstr;
}

/* Get the Engine ID from the Java object. */

#define GET_EID(E)\
   ENGid    E;\
   jclass   jcls;\
   jfieldID jeid;\
   jcls = jenv->GetObjectClass(jobj);\
   jeid = jenv->GetFieldID(jcls, "curEng", "J");\
   E = (ENGid)(jenv->GetLongField(jobj, jeid));


/*
ENGid _get_eid(JNIEnv * jenv, jobject jobj)
{
   ENGid    E;
   jclass   jcls;
   jfieldID jeid;
   jcls = jenv->GetObjectClass(jobj);
   jeid = jenv->GetFieldID(jcls, "curEng", "J");
   E = (ENGid)(jenv->GetIntField(jobj, jeid));
   return E;
}
*/

JExtPred::~JExtPred()
{
   jenv->DeleteGlobalRef(jobj);
   delete[] jmeth_name;
   delete[] jclass_name;
}

JExtPred* EpList = NULL;

// The JNIEnv pointer is not valid from one thread to another.
// So to allow multiple threads, we have all of the exec/call
// functions set this global variable, which is then used
// in extended predicate execution.
JNIEnv *jenv_current;

TF EXPFUNC p_java(void* p)
// AddPred will add as its predicate:
//		AddPred("predname", arity, &::p_java, ptr to the JExtPred block);
{
   jboolean jtf;
   JExtPred* ep = (JExtPred*)p;
   
   ep->jenv = jenv_current;
   jint ji = ep->jenv->GetVersion();
   if (ep->jobj == NULL)
   {
      ep->jcl = ep->jenv->FindClass(ep->jclass_name);
      ep->jmeth = ep->jenv->GetStaticMethodID(ep->jcl, ep->jmeth_name, "()Z");
      if (ep->jmeth == NULL)
         return false;
      jtf = ep->jenv->CallStaticBooleanMethod(ep->jcl, ep->jmeth);
   }
   else
   {
      ep->jcl = ep->jenv->FindClass(ep->jclass_name);
      ep->jmeth = ep->jenv->GetMethodID(ep->jcl, ep->jmeth_name, "()Z");
      if (ep->jmeth == NULL)
         return false;
      jtf = ep->jenv->CallBooleanMethod(ep->jobj, ep->jmeth);
   }

   return (TF)jtf;
}


void amzi_error(JNIEnv * jenv, ENGid curEng, char* lsapif)
{
   char msg[256];
   jclass jclsxcpt;
   jfieldID jeid;
   jmethodID jconstruct;
   int len;
   aCHAR* wmsg;
   jCHAR* jcmsg;
   jstring jmsg;
   jobject jolsxcpt;
   
   // Get the package/class for Amzi! exceptions
   jclsxcpt = jenv->FindClass("amzi/ls/LSException");
   if (jclsxcpt == NULL) goto errorerror;

   // Get the constructor with one string argument
   jconstruct = jenv->GetMethodID(jclsxcpt, "<init>", "(Ljava/lang/String;)V");
   if (jconstruct == NULL) goto errorerror;

   // Create a message and initialize LSException object with it
   sprintf(msg, "Logic Server exception in %s", lsapif);
   len = strlen(msg) + 1;
   if (len > 255) goto errorerror;
   wmsg = new aCHAR[len];
   mbstowcs(wmsg, msg, len);
   jcmsg = new jCHAR[len];
   ac_to_jc(jcmsg, wmsg, len);
   delete[] wmsg;
   jmsg = jenv->NewString(jcmsg, len);
   delete[] jcmsg;
   jolsxcpt = jenv->NewObject(jclsxcpt, jconstruct, jmsg);
   if (jolsxcpt == NULL) goto errorerror;

   jeid = jenv->GetFieldID(jclsxcpt, "curEng", "J");
   jenv->SetLongField(jolsxcpt, jeid, (int)curEng);

   jenv->Throw((_jthrowable*)jolsxcpt);
   return;

errorerror:
   jclass jerror = jenv->FindClass("java/lang/Error");
   jenv->ThrowNew(jerror, "Error processing Amzi! exception");
   return;
}

/* Implementation LSException */
/* -------------------------- */

/*
 * Class:     amzi_ls_LSException
 * Method:    GetType
 * Signature: ()I
 */
extern "C" JNIEXPORT jint JNICALL Java_amzi_ls_LSException_GetType
  (JNIEnv * jenv, jobject jobj)
{
   GET_EID(e);

   ExType type = lsGetExceptType(e);
   return (jint)type;
}

/*
 * Class:     amzi_ls_LSException
 * Method:    GetRC
 * Signature: ()I
 */
extern "C" JNIEXPORT jint JNICALL Java_amzi_ls_LSException_GetRC
  (JNIEnv * jenv, jobject jobj)
{
   GET_EID(e);

   RC rc = lsGetExceptRC(e);
   return (jint)rc;
}

/*
 * Class:     amzi_ls_LSException
 * Method:    GetLineno
 * Signature: ()I
 */
extern "C" JNIEXPORT jint JNICALL Java_amzi_ls_LSException_GetLineno
  (JNIEnv * jenv, jobject jobj)
{
   GET_EID(e);

   int lineno = lsGetExceptLineno(e);
   return (jint)lineno;
}
/*
 * Class:     amzi_ls_LSException
 * Method:    GetMsg
 * Signature: ()Ljava/lang/String;
 */
extern "C" JNIEXPORT jstring JNICALL Java_amzi_ls_LSException_GetMsg
  (JNIEnv * jenv, jobject jobj)
{
   GET_EID(e);
   lsGetExceptMsg(e, MsgBuf, MAXMSG);
   int len = wcslen(MsgBuf);
   ac_to_jc(jcMsgBuf, MsgBuf, len+1);
   jstring jstr = jenv->NewString(jcMsgBuf, len);

   return jstr;
}

/*
 * Class:     amzi_ls_LSException
 * Method:    GetReadFileName
 * Signature: ()Ljava/lang/String;
 */
extern "C" JNIEXPORT jstring JNICALL Java_amzi_ls_LSException_GetReadFileName
  (JNIEnv * jenv, jobject jobj)
{
   GET_EID(e);
   lsGetExceptReadFileName(e, MsgBuf, MAXMSG);
   int len = wcslen(MsgBuf);
   ac_to_jc(jcMsgBuf, MsgBuf, len+1);
   jstring jstr = jenv->NewString(jcMsgBuf, len);

   return jstr;
}

/*
 * Class:     amzi_ls_LSException
 * Method:    GetReadBuffer
 * Signature: ()Ljava/lang/String;
 */
extern "C" JNIEXPORT jstring JNICALL Java_amzi_ls_LSException_GetReadBuffer
  (JNIEnv * jenv, jobject jobj)
{
   GET_EID(e);
   lsGetExceptReadBuffer(e, MsgBuf, MAXMSG);
   int len = wcslen(MsgBuf);
   ac_to_jc(jcMsgBuf, MsgBuf, len+1);
   jstring jstr = jenv->NewString(jcMsgBuf, len);

   return jstr;
}

/*
 * Class:     amzi_ls_LSException
 * Method:    GetCallStack
 * Signature: ()Ljava/lang/String;
 */
extern "C" JNIEXPORT jstring JNICALL Java_amzi_ls_LSException_GetCallStack
  (JNIEnv * jenv, jobject jobj)
{
   GET_EID(e);
   lsGetExceptCallStack(e, MsgBuf, MAXMSG);
   int len = wcslen(MsgBuf);
   ac_to_jc(jcMsgBuf, MsgBuf, len+1);
   jstring jstr = jenv->NewString(jcMsgBuf, len);

   return jstr;
}


/* Implementation LogicServer */
/* -------------------------- */

/*
 * Class:     amzi_ls_LogicServer
 * Method:    Init
 * Signature: (Ljava/lang/String;)V
 */
extern "C" JNIEXPORT void JNICALL Java_amzi_ls_LogicServer_Init
  (JNIEnv * jenv, jobject jobj, jstring jstr)
{
   ENGid curEng;
   RC    rc;
   jclass   jcls;
   jfieldID jeid;
   aCHAR* ininame;
   
//   EpList = NULL;   // Initialize extended predicates

   ininame = JtoC(jenv, jstr);
   rc = lsInit(&curEng, ininame);
   delete[] ininame;

   if (curEng == NULL)
   {
      jclass jerror = jenv->FindClass("java/lang/OutOfMemoryError");
      jenv->ThrowNew(jerror, "Unable to allocate new Logic Server");
   }

   if (rc != OK)
      amzi_error(jenv, curEng, "Init");

   jcls = jenv->GetObjectClass(jobj);
   jeid = jenv->GetFieldID(jcls, "curEng", "J");
   jenv->SetLongField(jobj, jeid, (int)curEng);

   return;
}

/*
 * Class:     amzi_ls_LogicServer
 * Method:    Init2
 * Signature: (Ljava/lang/String;)V
 */
extern "C" JNIEXPORT void JNICALL Java_amzi_ls_LogicServer_Init2
  (JNIEnv * jenv, jobject jobj, jstring jstr)
{
   ENGid curEng;
   RC    rc;
   jclass   jcls;
   jfieldID jeid;
   aCHAR* inistr;

//   EpList = NULL;    // Initialize extended predicates.
   
   inistr = JtoC(jenv, jstr);
   rc = lsInit2(&curEng, inistr);
   delete[] inistr;

   if (curEng == NULL)
   {
      jclass jerror = jenv->FindClass("java/lang/OutOfMemoryError");
      jenv->ThrowNew(jerror, "Unable to allocate new Logic Server");
   }

   if (rc != OK)
      amzi_error(jenv, curEng, "Init2");

   jcls = jenv->GetObjectClass(jobj);
   jeid = jenv->GetFieldID(jcls, "curEng", "J");
   jenv->SetLongField(jobj, jeid, (int)curEng);

   return;
}

/*
 * Class:     amzi_ls_LogicServer
 * Method:    InitLSX
 * Signature: (J)V
 */
extern "C" JNIEXPORT void JNICALL Java_amzi_ls_LogicServer_InitLSX
  (JNIEnv * jenv, jobject jobj, jlong ptr)
{
   RC  rc;

   GET_EID(e);
   rc = lsInitLSX(e, (void*)ptr);
   if (rc != OK)
      amzi_error(jenv, e, "InitLSX");

   return;
}

/*
 * Class:     amzi_ls_LogicServer
 * Method:    AddPred-8
 * Signature: (Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
 */
JNIEXPORT void JNICALL Java_amzi_ls_LogicServer_AddJPred
  (JNIEnv * jenv, jobject jobj, jstring jfunctor, jint arity,
   jstring jcl_name, jstring jmethod_name, jobject jmethobj,
   jlong lseng)
{
//FILE* log = fopen("d:\\temp\\a5jlog.txt", "w");
//fprintf(log, "Log file\n");

   RC  rc;
   aCHAR* functor;
   char* method_name;
   char* cl_name;
   JExtPred* ep;
   jobject jgobj;

//fprintf(log, "0\n"); fflush(log);
   GET_EID(e);

//fprintf(log, "1\n"); fflush(log);
   ep = new JExtPred();
   ep->jenv = jenv;

//fprintf(log, "2\n"); fflush(log);
   if (jmethobj == NULL)
      ep->jobj = NULL;
   else
   {
      jgobj = jenv->NewGlobalRef(jmethobj);
      ep->jobj = jgobj;
   }

   ep->lseng = lseng;
   
//fprintf(log, "3\n"); fflush(log);
   // Find the class for the extended predicate
   cl_name = JtoCA(jenv, jcl_name);
   ep->jclass_name = cl_name;
//   ep->jcl = jenv->FindClass(cl_name);
//   ep->jcl = jenv->FindClass(cl_name);
//   if (ep->jcl == NULL)
//      amzi_error(jenv, e, "AddPred");
//   delete[] cl_name;

//fprintf(log, "4\n"); fflush(log);
   // And the method
   method_name = JtoCA(jenv, jmethod_name);
   ep->jmeth_name = method_name;
//   ep->jmeth = jenv->GetMethodID(ep->jcl, method_name, "()Z");
//   if (ep->jmeth == NULL)
//      amzi_error(jenv, e, "AddPred");
//   delete[] method_name;

//fprintf(log, "5\n"); fflush(log);
   // thread linked list
   ep->pnext = EpList;
   EpList = ep;

//fprintf(log, "6\n"); fflush(log);
   functor = JtoC(jenv, jfunctor);
   rc = lsAddPred(e, functor, (ARITY)arity, &::p_java, (VOIDptr)ep);
   if (rc != OK)
      amzi_error(jenv, e, "AddPred");

//fprintf(log, "done"); fclose(log);
   return;
}

/* This should become obsolete in 6.1
 * Class:     amzi_ls_LogicServer
 * Method:    AddPred-7
 * Signature: (Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V
 */
/*
extern "C" JNIEXPORT void JNICALL Java_amzi_ls_LogicServer_AddPred
  (JNIEnv * jenv, jobject jobj, jstring jfunctor, jint arity,
   jstring jcl_name, jstring jmethod_name, jobject jmethobj)
{
//FILE* log = fopen("d:\\temp\\a5jlog.txt", "w");
//fprintf(log, "Log file\n");

   RC  rc;
   aCHAR* functor;
   char* method_name;
   char* cl_name;
   JExtPred* ep;
   jobject jgobj;

//fprintf(log, "0\n"); fflush(log);
   GET_EID(e);

//fprintf(log, "1\n"); fflush(log);
   ep = new JExtPred();
   ep->jenv = jenv;

//fprintf(log, "2\n"); fflush(log);
   jgobj = jenv->NewGlobalRef(jmethobj);
   ep->jobj = jgobj;
   
//fprintf(log, "3\n"); fflush(log);
   // Find the class for the extended predicate
   cl_name = JtoCA(jenv, jcl_name);
//   ep->jcl = jenv->FindClass(cl_name);
   ep->jcl = jenv->FindClass(cl_name);
   if (ep->jcl == NULL)
      amzi_error(jenv, e, "AddPred");
   delete[] cl_name;

//fprintf(log, "4\n"); fflush(log);
   // And the method
   method_name = JtoCA(jenv, jmethod_name);
   ep->jmeth_name = method_name;
   ep->jmeth = jenv->GetMethodID(ep->jcl, method_name, "()Z");
   if (ep->jmeth == NULL)
      amzi_error(jenv, e, "AddPred");
//   delete[] method_name;

//fprintf(log, "5\n"); fflush(log);
   // thread linked list
   ep->pnext = EpList;
   EpList = ep;

//fprintf(log, "6\n"); fflush(log);
   functor = JtoC(jenv, jfunctor);
   rc = lsAddPred(e, functor, (ARITY)arity, &::p_java, (VOIDptr)ep);
   if (rc != OK)
      amzi_error(jenv, e, "AddPred");

//fprintf(log, "done"); fclose(log);
   return;
}
*/

/*
 * Class:     amzi_ls_LogicServer
 * Method:    AddLSX
 * Signature: (Ljava/lang/String;J)V
 */
extern "C" JNIEXPORT void JNICALL Java_amzi_ls_LogicServer_AddLSX
  (JNIEnv * jenv, jobject jobj, jstring jlsxname, jlong ptr)
{
   RC  rc;
   aCHAR* lsxname;

   GET_EID(e);
   lsxname = JtoC(jenv, jlsxname);
   rc = lsAddLSX(e, lsxname, (void *)ptr);
   delete[] lsxname;
   if (rc != OK)
      amzi_error(jenv, e, "AddLSX");

   return;
}

/*
 * Class:     amzi_ls_LogicServer
 * Method:    Load
 * Signature: (Ljava/lang/String;)V
 */
extern "C" JNIEXPORT void JNICALL Java_amzi_ls_LogicServer_Load
  (JNIEnv * jenv, jobject jobj, jstring jstr)
{
   RC     rc;
   aCHAR* xplname;

   GET_EID(e);
   //ENGid e;
   //e = _get_eid(jenv, jobj);
   xplname = JtoC(jenv, jstr);
   rc = lsLoad(e, xplname);
   delete[] xplname;
   if (rc != OK)
      amzi_error(jenv, e, "Load");

   return;
}


/*
 * Class:     amzi_ls_LogicServer
 * Method:    Main
 * Signature: ()Z
 */
extern "C" JNIEXPORT jboolean JNICALL Java_amzi_ls_LogicServer_Main
  (JNIEnv * jenv, jobject jobj)
{
   TF  tf;

   GET_EID(e);
   tf = lsMain(e);
   if (tf != TRUE && tf != FALSE)
      amzi_error(jenv, e, "Main");

   return (jboolean)tf;
}

/*
 * Class:     amzi_ls_LogicServer
 * Method:    Reset
 * Signature: ()V
 */
extern "C" JNIEXPORT void JNICALL Java_amzi_ls_LogicServer_Reset
  (JNIEnv * jenv, jobject jobj)
{
   RC  rc;

   GET_EID(e);
   rc = lsReset(e);
   if (rc != OK)
      amzi_error(jenv, e, "Reset");

   return;
}

/*
 * Class:     amzi_ls_LogicServer
 * Method:    JClose
 * Signature: (Ljava/lang/Object;)V
 */
JNIEXPORT void JNICALL Java_amzi_ls_LogicServer_JClose
  (JNIEnv * jenv, jobject jobj, jlong lseng)
{
   RC    rc;

   GET_EID(e);

   JExtPred *e1 = EpList;
   JExtPred *e2;
   JExtPred *e0 = NULL;

   while(e1)
   {
      e2 = e1->pnext;
      if (e1->lseng == lseng)
      {
         if (e0)
            e0->pnext = e2;
         if (EpList == e1)
            EpList = e2;
         delete e1;
      }
      else
      {
         e0 = e1;
      }
      e1 = e2;
   }
   
   rc = lsClose(e);
   if (rc != OK)
      amzi_error(jenv, e, "Close");

   return;
}

/*
 * Class:     amzi_ls_LogicServer
 * Method:    Close
 * Signature: ()V
 */
/*
extern "C" JNIEXPORT void JNICALL Java_amzi_ls_LogicServer_Close
  (JNIEnv * jenv, jobject jobj)
{
   RC    rc;

   GET_EID(e);
   
   rc = lsClose(e);
   if (rc != OK)
      amzi_error(jenv, e, "Close");

   return;
}
*/

/*
 * Class:     amzi_ls_LogicServer
 * Method:    Exec
 * Signature: (J)J
 */
extern "C" JNIEXPORT jlong JNICALL Java_amzi_ls_LogicServer_Exec
  (JNIEnv * jenv, jobject jobj, jlong jterm)
{
   TF   tf;
   TERM t;

   jenv_current = jenv;

   GET_EID(e);
   t = (TERM)jterm;
   tf = lsExec(e, &t);
   switch(tf)
   {
   case TRUE: return (jlong)t;
   case FALSE: return 0;
   default: amzi_error(jenv, e, "Exec"); return 0;
   }
}

  
/*
 * Class:     amzi_ls_LogicServer
 * Method:    ExecStr
 * Signature: (Ljava/lang/String;)J
 */
extern "C" JNIEXPORT jlong JNICALL Java_amzi_ls_LogicServer_ExecStr
  (JNIEnv * jenv, jobject jobj, jstring jstr)
{
   TF     tf;
   TERM   t;
   aCHAR* query;

   jenv_current = jenv;

   GET_EID(e);
   query = JtoC(jenv, jstr);
   tf = lsExecStr(e, &t, query);
   delete[] query;

   switch(tf)
   {
   case TRUE: return (jlong)t;
   case FALSE: return 0;
   default: amzi_error(jenv, e, "ExecStr"); return 0;
   }
}


/*
 * Class:     amzi_ls_LogicServer
 * Method:    Call
 * Signature: (J)J
 */
extern "C" JNIEXPORT jlong JNICALL Java_amzi_ls_LogicServer_Call
  (JNIEnv * jenv, jobject jobj, jlong jterm)
{
   TF   tf;
   TERM t;

   jenv_current = jenv;

   GET_EID(e);
   t = (TERM)jterm;
   tf = lsCall(e, &t);
   switch(tf)
   {
   case TRUE: return (jlong)t;
   case FALSE: return 0;
   default: amzi_error(jenv, e, "Call"); return 0;
   }
}

/*
 * Class:     amzi_ls_LogicServer
 * Method:    CallStr
 * Signature: (Ljava/lang/String;)J
 */
extern "C" JNIEXPORT jlong JNICALL Java_amzi_ls_LogicServer_CallStr
  (JNIEnv * jenv, jobject jobj, jstring jstr)
{
   TF     tf;
   TERM   t;
   aCHAR* query;

   jenv_current = jenv;

   GET_EID(e);
   query = JtoC(jenv, jstr);
   tf = lsCallStr(e, &t, query);
   delete[] query;

   switch(tf)
   {
   case TRUE: return (jlong)t;
   case FALSE: return 0;
   default: amzi_error(jenv, e, "CallStr"); return 0;
   }
}

/*
 * Class:     amzi_ls_LogicServer
 * Method:    Redo
 * Signature: ()Z
 */
extern "C" JNIEXPORT jboolean JNICALL Java_amzi_ls_LogicServer_Redo
  (JNIEnv * jenv, jobject jobj)
{
   TF  tf;

   jenv_current = jenv;

   GET_EID(e);
   tf = lsRedo(e);
   if (tf != TRUE && tf != FALSE)
      amzi_error(jenv, e, "Redo");

   return (jboolean)tf;
}

/*
 * Class:     amzi_ls_LogicServer
 * Method:    ClearCall
 * Signature: ()V
 */
extern "C" JNIEXPORT void JNICALL Java_amzi_ls_LogicServer_ClearCall
  (JNIEnv * jenv, jobject jobj)
{
   RC  rc;

   GET_EID(e);
   rc = lsClearCall(e);
   if (rc != OK)
      amzi_error(jenv, e, "ClearCall");

   return;
}

/*
 * Class:     amzi_ls_LogicServer
 * Method:    Asserta
 * Signature: (J)V
 */
extern "C" JNIEXPORT void JNICALL Java_amzi_ls_LogicServer_Asserta
  (JNIEnv * jenv, jobject jobj, jlong jterm)
{
   RC  rc;

   GET_EID(e);
   rc = lsAsserta(e, (TERM)jterm);
   if (rc != OK)
      amzi_error(jenv, e, "Asserta");

   return;
}

/*
 * Class:     amzi_ls_LogicServer
 * Method:    Assertz
 * Signature: (J)V
 */
extern "C" JNIEXPORT void JNICALL Java_amzi_ls_LogicServer_Assertz
  (JNIEnv * jenv, jobject jobj, jlong jterm)
{
   RC  rc;

   GET_EID(e);
   rc = lsAssertz(e, (TERM)jterm);
   if (rc != OK)
      amzi_error(jenv, e, "Assertz");

   return;
}

/*
 * Class:     amzi_ls_LogicServer
 * Method:    Retract
 * Signature: (J)V
 */
extern "C" JNIEXPORT jlong JNICALL Java_amzi_ls_LogicServer_Retract
  (JNIEnv * jenv, jobject jobj, jlong jterm)
{
   TF   tf;
   TERM t;

   GET_EID(e);
   t = (TERM)jterm;
   tf = lsRetract(e, t);
   switch(tf)
   {
   case TRUE: return (jlong)t;
   case FALSE: return 0;
   default: amzi_error(jenv, e, "Retract"); return 0;
   }
}

/*
 * Class:     amzi_ls_LogicServer
 * Method:    AssertaStr
 * Signature: (Ljava/lang/String;)V
 */
extern "C" JNIEXPORT void JNICALL Java_amzi_ls_LogicServer_AssertaStr
  (JNIEnv * jenv, jobject jobj, jstring jstr)
{
   RC     rc;
   aCHAR* astr;

   GET_EID(e);
   astr = JtoC(jenv, jstr);
   rc = lsAssertaStr(e, astr);
   delete[] astr;
   if (rc != OK)
      amzi_error(jenv, e, "AssertaStr");

   return;
}

/*
 * Class:     amzi_ls_LogicServer
 * Method:    AssertzStr
 * Signature: (Ljava/lang/String;)V
 */
extern "C" JNIEXPORT void JNICALL Java_amzi_ls_LogicServer_AssertzStr
  (JNIEnv * jenv, jobject jobj, jstring jstr)
{
   RC     rc;
   aCHAR* astr;

   GET_EID(e);
   astr = JtoC(jenv, jstr);
   rc = lsAssertzStr(e, astr);
   delete[] astr;
   if (rc != OK)
      amzi_error(jenv, e, "AssertzStr");

   return;
}

/*
 * Class:     amzi_ls_LogicServer
 * Method:    RetractStr
 * Signature: (Ljava/lang/String;)V
 */
extern "C" JNIEXPORT jboolean JNICALL Java_amzi_ls_LogicServer_RetractStr
  (JNIEnv * jenv, jobject jobj, jstring jstr)
{
   TF   tf;
   aCHAR* rstr;

   GET_EID(e);
   rstr = JtoC(jenv, jstr);
   tf = lsRetractStr(e, rstr);
   delete[] rstr;
   switch(tf)
   {
   case TRUE:
   case FALSE:
      return (jboolean)tf;
   default: amzi_error(jenv, e, "RetractStr"); return 0;
   }
}

  
/*
 * Class:     amzi_ls_LogicServer
 * Method:    TermToStr
 * Signature: (JI)Ljava/lang/String;
 */
extern "C" JNIEXPORT jstring JNICALL Java_amzi_ls_LogicServer_TermToStr
  (JNIEnv * jenv, jobject jobj, jlong t, jint jlen)
{
   RC     rc;
   aCHAR* str = new aCHAR[jlen+1];

   GET_EID(e);
   rc = lsTermToStr(e, (TERM)t, str, jlen);
   int len = wcslen(str);
   jCHAR *jcstr = new jCHAR[len+1];
   ac_to_jc(jcstr, str, len);
   jstring jstr = jenv->NewString(jcstr, len);
   delete[] str;
   delete[] jcstr;
   if (rc != OK)
      amzi_error(jenv, e, "TermToStr");

   return jstr;
}

/*
 * Class:     amzi_ls_LogicServer
 * Method:    TermToStrQ
 * Signature: (JI)Ljava/lang/String;
 */
extern "C" JNIEXPORT jstring JNICALL Java_amzi_ls_LogicServer_TermToStrQ
  (JNIEnv * jenv, jobject jobj, jlong t, jint jlen)
{
   RC     rc;
   aCHAR* str = new aCHAR[jlen+1];

   GET_EID(e);
   rc = lsTermToStrQ(e, (TERM)t, str, jlen);
   int len = wcslen(str);
   jCHAR* jcstr = new jCHAR[len+1];
   ac_to_jc(jcstr, str, len);
   jstring jstr = jenv->NewString(jcstr, len);
   delete[] str;
   if (rc != OK)
      amzi_error(jenv, e, "TermToStrQ");

   return jstr;
}

/*
 * Class:     amzi_ls_LogicServer
 * Method:    StrToTerm
 * Signature: (Ljava/lang/String;)J
 */
extern "C" JNIEXPORT jlong JNICALL Java_amzi_ls_LogicServer_StrToTerm
  (JNIEnv * jenv, jobject jobj, jstring jstr)
{
   RC     rc;
   TERM   t;
   aCHAR* istr;

   GET_EID(e);
   istr = JtoC(jenv, jstr);
   rc = lsStrToTerm(e, &t, istr);
   delete[] istr;

   if (rc != OK)
      amzi_error(jenv, e, "StrToTerm");
   
   return (jlong)t;
}

/*
 * Class:     amzi_ls_LogicServer
 * Method:    StrTermLen
 * Signature: (J)J
 */
extern "C" JNIEXPORT jint JNICALL Java_amzi_ls_LogicServer_StrTermLen
  (JNIEnv * jenv, jobject jobj, jlong jterm)
{
   int len;

   GET_EID(e);
   len = lsStrTermLen(e, (TERM)jterm);

   return (jint)len;
}

/*
 * Class:     amzi_ls_LogicServer
 * Method:    MakeAtom
 * Signature: (Ljava/lang/String;)J
 */
extern "C" JNIEXPORT jlong JNICALL Java_amzi_ls_LogicServer_MakeAtom
  (JNIEnv * jenv, jobject jobj, jstring jstr)
{
   RC     rc;
   aCHAR* atom;
   TERM   t;

   GET_EID(e);
   atom = JtoC(jenv, jstr);
   rc = lsMakeAtom(e, &t, atom);
   delete[] atom;

   if (rc != OK)
      amzi_error(jenv, e, "MakeAtom");

   return (jlong)t;
}

/*
 * Class:     amzi_ls_LogicServer
 * Method:    MakeStr
 * Signature: (Ljava/lang/String;)J
 */
extern "C" JNIEXPORT jlong JNICALL Java_amzi_ls_LogicServer_MakeStr
  (JNIEnv * jenv, jobject jobj, jstring jstr)
{
   RC     rc;
   aCHAR* str;
   TERM   t;

   GET_EID(e);
   str = JtoC(jenv, jstr);
   rc = lsMakeStr(e, &t, str);
   delete[] str;

   if (rc != OK)
      amzi_error(jenv, e, "MakeStr");

   return (jlong)t;
}

/*
 * Class:     amzi_ls_LogicServer
 * Method:    MakeInt
 * Signature: (I)J
 */
extern "C" JNIEXPORT jlong JNICALL Java_amzi_ls_LogicServer_MakeInt
  (JNIEnv * jenv, jobject jobj, jint ji)
{
   RC     rc;
   TERM   t;

   GET_EID(e);
   rc = lsMakeInt(e, &t, (int)ji);

   if (rc != OK)
      amzi_error(jenv, e, "MakeInt");

   return (jlong)t;
}

/*
 * Class:     amzi_ls_LogicServer
 * Method:    MakeFloat
 * Signature: (D)J
 */
extern "C" JNIEXPORT jlong JNICALL Java_amzi_ls_LogicServer_MakeFloat
  (JNIEnv * jenv, jobject jobj, jdouble jd)
{
   RC     rc;
   TERM   t;

   GET_EID(e);
   rc = lsMakeFloat(e, &t, (double)jd);

   if (rc != OK)
      amzi_error(jenv, e, "MakeFloat");

   return (jlong)t;
}

/*
 * Class:     amzi_ls_LogicServer
 * Method:    GetTermType
 * Signature: (J)I
 */
extern "C" JNIEXPORT jint JNICALL Java_amzi_ls_LogicServer_GetTermType
  (JNIEnv * jenv, jobject jobj, jlong jterm)
{
   pTYPE type;

   GET_EID(e);
   type = lsGetTermType(e, (TERM)jterm);
   if (type < 0)
      amzi_error(jenv, e, "GetTermType");

   return (jint)type;
}

/*
 * Class:     amzi_ls_LogicServer
 * Method:    GetStrTerm
 * Signature: (J)Ljava/lang/String;
 */
extern "C" JNIEXPORT jstring JNICALL Java_amzi_ls_LogicServer_GetStrTerm
  (JNIEnv * jenv, jobject jobj, jlong jt)
{
   RC     rc;
   aCHAR* str;

   GET_EID(e);
   int len = lsStrTermLen(e, (TERM)jt);
   str = new aCHAR[len+1];
   rc = lsGetTerm(e, (TERM)jt, cWSTR, str);
   jCHAR *jcstr = new jCHAR[len+1];
   ac_to_jc(jcstr, str, len);
   jstring jstr = jenv->NewString(jcstr, len);
   delete[] str;
   delete[] jcstr;
   if (rc != OK)
      amzi_error(jenv, e, "GetStrTerm");

   return jstr;
}

/*
 * Class:     amzi_ls_LogicServer
 * Method:    GetIntTerm
 * Signature: (J)I
 */
extern "C" JNIEXPORT jint JNICALL Java_amzi_ls_LogicServer_GetIntTerm
  (JNIEnv * jenv, jobject jobj, jlong jt)
{
   RC     rc;
   int    i;

   GET_EID(e);
   rc = lsGetTerm(e, (TERM)jt, cINT, &i);
   if (rc != OK)
      amzi_error(jenv, e, "GetIntTerm");

   return (jint)i;
}

/*
 * Class:     amzi_ls_LogicServer
 * Method:    GetFloatTerm
 * Signature: (J)D
 */
extern "C" JNIEXPORT jdouble JNICALL Java_amzi_ls_LogicServer_GetFloatTerm
  (JNIEnv * jenv, jobject jobj, jlong jt)
{
   RC     rc;
   double d;

   GET_EID(e);
   rc = lsGetTerm(e, (TERM)jt, cDOUBLE, &d);
   if (rc != OK)
      amzi_error(jenv, e, "GetFloatTerm");

   return (jdouble)d;
}

/*
 * Class:     amzi_ls_LogicServer
 * Method:    GetParmType
 * Signature: (I)I
 */
JNIEXPORT jint JNICALL Java_amzi_ls_LogicServer_GetParmType
  (JNIEnv * jenv, jobject jobj, jint iarg)
{
   pTYPE type;

   GET_EID(e);
   type = lsGetParmType(e, (int)iarg);
   if (type < 0)
      amzi_error(jenv, e, "GetTermType");

   return (jint)type;
}

/*
 * Class:     amzi_ls_LogicServer
 * Method:    GetParm
 * Signature: (I)J
 */
JNIEXPORT jlong JNICALL Java_amzi_ls_LogicServer_GetParm
  (JNIEnv * jenv, jobject jobj, jint iarg)
{
   TERM t;
   RC   rc;

   GET_EID(e);
   rc = lsGetParm(e, (int)iarg, cTERM, &t);
   if (rc != OK)
      amzi_error(jenv, e, "GetParm");

   return (jlong)t;
}

/*
 * Class:     amzi_ls_LogicServer
 * Method:    GetStrParm
 * Signature: (I)Ljava/lang/String;
 */
JNIEXPORT jstring JNICALL Java_amzi_ls_LogicServer_GetStrParm
  (JNIEnv * jenv, jobject jobj, jint iarg)
{
   RC   rc;
   aCHAR* str;

   GET_EID(e);
   int len = lsStrParmLen(e, (int)iarg);
   str = new aCHAR[len+1];
   rc = lsGetParm(e, (int)iarg, cWSTR, str);
   jCHAR *jcstr = new jCHAR[len+1];
   ac_to_jc(jcstr, str, len);
   jstring jstr = jenv->NewString(jcstr, len);
   delete[] str;
   delete[] jcstr;
   if (rc != OK)
      amzi_error(jenv, e, "GetStrParm");

   return jstr;
}

/*
 * Class:     amzi_ls_LogicServer
 * Method:    GetIntParm
 * Signature: (I)I
 */
JNIEXPORT jint JNICALL Java_amzi_ls_LogicServer_GetIntParm
  (JNIEnv * jenv, jobject jobj, jint iarg)
{
   RC     rc;
   int    i;

   GET_EID(e);
   rc = lsGetParm(e, (int)iarg, cINT, &i);
   if (rc != OK)
      amzi_error(jenv, e, "GetIntParm");

   return (jint)i;
}

/*
 * Class:     amzi_ls_LogicServer
 * Method:    GetFloatParm
 * Signature: (I)D
 */
JNIEXPORT jdouble JNICALL Java_amzi_ls_LogicServer_GetFloatParm
  (JNIEnv * jenv, jobject jobj, jint iarg)
{
   RC     rc;
   double d;

   GET_EID(e);
   rc = lsGetParm(e, (int)iarg, cDOUBLE, &d);
   if (rc != OK)
      amzi_error(jenv, e, "GetFloatParm");

   return (jdouble)d;
}

/*
 * Class:     amzi_ls_LogicServer
 * Method:    UnifyParm
 * Signature: (IJ)Z
 */
JNIEXPORT jboolean JNICALL Java_amzi_ls_LogicServer_UnifyParm
  (JNIEnv * jenv, jobject jobj, jint iarg, jlong term)
{
   TF tf;

   GET_EID(e);
   tf = lsUnifyParm(e, (int)iarg, cTERM, &term);
   switch(tf)
   {
   case TRUE:
   case FALSE:
      return (jboolean)tf;
   default: amzi_error(jenv, e, "UnifyParm"); return 0;
   }
}

/*
 * Class:     amzi_ls_LogicServer
 * Method:    UnifyStrParm
 * Signature: (ILjava/lang/String;)Z
 */
JNIEXPORT jboolean JNICALL Java_amzi_ls_LogicServer_UnifyStrParm
  (JNIEnv * jenv, jobject jobj, jint iarg, jstring jstr)
{
   TF tf;
   aCHAR* str;

   GET_EID(e);
   str = JtoC(jenv, jstr);
   tf = lsUnifyParm(e, (int)iarg, cWSTR, str);
   delete[] str;

   switch(tf)
   {
   case TRUE:
   case FALSE:
      return (jboolean)tf;
   default: amzi_error(jenv, e, "UnifyStrParm"); return 0;
   }
}

/*
 * Class:     amzi_ls_LogicServer
 * Method:    UnifyIntParm
 * Signature: (II)Z
 */
JNIEXPORT jboolean JNICALL Java_amzi_ls_LogicServer_UnifyIntParm
  (JNIEnv * jenv, jobject jobj, jint iarg, jint ji)
{
   TF tf;

   GET_EID(e);
   tf = lsUnifyParm(e, (int)iarg, cINT, &ji);

   switch(tf)
   {
   case TRUE:
   case FALSE:
      return (jboolean)tf;
   default: amzi_error(jenv, e, "UnifyIntParm"); return 0;
   }
}

/*
 * Class:     amzi_ls_LogicServer
 * Method:    UnifyFloatParm
 * Signature: (ID)Z
 */
JNIEXPORT jboolean JNICALL Java_amzi_ls_LogicServer_UnifyFloatParm
  (JNIEnv * jenv, jobject jobj, jint iarg, jdouble jd)
{
   TF tf;

   GET_EID(e);
   tf = lsUnifyParm(e, (int)iarg, cDOUBLE, &jd);

   switch(tf)
   {
   case TRUE:
   case FALSE:
      return (jboolean)tf;
   default: amzi_error(jenv, e, "UnifyFloatParm"); return 0;
   }
}


/*
 * Class:     amzi_ls_LogicServer
 * Method:    GetFunctor
 * Signature: (J)Ljava/lang/String;
 */
extern "C" JNIEXPORT jstring JNICALL Java_amzi_ls_LogicServer_GetFunctor
  (JNIEnv * jenv, jobject jobj, jlong jt)
{
   RC     rc;
   aCHAR  str[1024];
   jCHAR  jcstr[1024];
   ARITY  a;

   GET_EID(e);
   rc = lsGetFA(e, (TERM)jt, str, &a);
   if (rc != OK)
      amzi_error(jenv, e, "GetFunctor");

   int len = wcslen(str);
   ac_to_jc(jcstr, str, len+1);
   jstring jstr = jenv->NewString(jcstr, len);

   return jstr;
}

/*
 * Class:     amzi_ls_LogicServer
 * Method:    GetArity
 * Signature: (J)S
 */
extern "C" JNIEXPORT jint JNICALL Java_amzi_ls_LogicServer_GetArity
  (JNIEnv * jenv, jobject jobj, jlong jt)
{
   RC     rc;
   aCHAR  str[1024];
   ARITY  a;

   GET_EID(e);
   rc = lsGetFA(e, (TERM)jt, str, &a);
   if (rc != OK)
      amzi_error(jenv, e, "GetArity");

   return (jint)a;
}

/*
 * Class:     amzi_ls_LogicServer
 * Method:    MakeFA
 * Signature: (Ljava/lang/String;I)J
 */
extern "C" JNIEXPORT jlong JNICALL Java_amzi_ls_LogicServer_MakeFA
  (JNIEnv * jenv, jobject jobj, jstring jstr, jint ja)
{
   RC     rc;
   TERM   t;
   aCHAR* str;

   GET_EID(e);
   str = JtoC(jenv, jstr);
   rc = lsMakeFA(e, &t, str, (ARITY)ja);
   delete[] str;

   if (rc != OK)
      amzi_error(jenv, e, "MakeFA");
   
   return (jlong)t;
}

/*
 * Class:     amzi_ls_LogicServer
 * Method:    GetArg
 * Signature: (JI)J
 */
extern "C" JNIEXPORT jlong JNICALL Java_amzi_ls_LogicServer_GetArg
  (JNIEnv * jenv, jobject jobj, jlong jt, jint ji)
{
   RC   rc;
   TERM t;

   GET_EID(e);
   rc = lsGetArg(e, (TERM)jt, (int)ji, cTERM, &t);
   if (rc != OK)
      amzi_error(jenv, e, "GetArg");

   return (jlong)t;
}

/*
 * Class:     amzi_ls_LogicServer
 * Method:    GetStrArg
 * Signature: (JI)Ljava/lang/String;
 */
extern "C" JNIEXPORT jstring JNICALL Java_amzi_ls_LogicServer_GetStrArg
  (JNIEnv * jenv, jobject jobj, jlong t, jint iarg)
{
   RC     rc;

   GET_EID(e);
   int len = lsStrArgLen(e, (TERM)t, (int)iarg);
   aCHAR* str = new aCHAR[len+1];
   rc = lsGetArg(e, (TERM)t, (int)iarg, cWSTR, str);
   jCHAR* jcstr = new jCHAR[len+1];
   ac_to_jc(jcstr, str, len);
   jstring jstr = jenv->NewString(jcstr, len);
   delete[] str;
   delete[] jcstr;
   if (rc != OK)
      amzi_error(jenv, e, "GetStrArg");

   return jstr;
}

/*
 * Class:     amzi_ls_LogicServer
 * Method:    GetIntArg
 * Signature: (JI)I
 */
extern "C" JNIEXPORT jint JNICALL Java_amzi_ls_LogicServer_GetIntArg
  (JNIEnv * jenv, jobject jobj, jlong jt, jint ji)
{
   RC   rc;
   int  i;

   GET_EID(e);
   rc = lsGetArg(e, (TERM)jt, (int)ji, cINT, &i);
   if (rc != OK)
      amzi_error(jenv, e, "GetIntArg");

   return (jint)i;
}

/*
 * Class:     amzi_ls_LogicServer
 * Method:    GetFloatArg
 * Signature: (JI)D
 */
extern "C" JNIEXPORT jdouble JNICALL Java_amzi_ls_LogicServer_GetFloatArg
  (JNIEnv * jenv, jobject jobj, jlong jt, jint ji)
{
   RC   rc;
   double d;

   GET_EID(e);
   rc = lsGetArg(e, (TERM)jt, (int)ji, cDOUBLE, &d);
   if (rc != OK)
      amzi_error(jenv, e, "GetFloatArg");

   return (jdouble)d;
}

/*
 * Class:     amzi_ls_LogicServer
 * Method:    UnifyStrArg
 * Signature: (JILjava/lang/String;)J
 */
extern "C" JNIEXPORT jlong JNICALL Java_amzi_ls_LogicServer_UnifyStrArg
  (JNIEnv * jenv, jobject jobj, jlong jt, jint ji, jstring jstr)
{
   TF     tf;
   TERM   t;
   aCHAR* str;

   GET_EID(e);
   t = (TERM)jt;
   str = JtoC(jenv, jstr);
   tf = lsUnifyArg(e, &t, (int)ji, cWSTR, str); 
   delete[] str;

   switch(tf)
   {
   case TRUE: return (jlong)t;
   case FALSE: return 0;
   default: amzi_error(jenv, e, "UnifyStrArg"); return 0;
   }
}

/*
 * Class:     amzi_ls_LogicServer
 * Method:    UnifyIntArg
 * Signature: (JII)J
 */
extern "C" JNIEXPORT jlong JNICALL Java_amzi_ls_LogicServer_UnifyIntArg
  (JNIEnv * jenv, jobject jobj, jlong jt, jint jarg, jint ji)
{
   TF     tf;
   TERM   t;
   int    i;

   GET_EID(e);
   t = (TERM)jt;
   i = (int)ji;
   tf = lsUnifyArg(e, &t, (int)jarg, cINT, &i); 

   switch(tf)
   {
   case TRUE: return (jlong)t;
   case FALSE: return 0;
   default: amzi_error(jenv, e, "UnifyIntArg"); return 0;
   }
}


/*
 * Class:     amzi_ls_LogicServer
 * Method:    UnifyFloatArg
 * Signature: (JID)J
 */
extern "C" JNIEXPORT jlong JNICALL Java_amzi_ls_LogicServer_UnifyFloatArg
  (JNIEnv * jenv, jobject jobj, jlong jt, jint jarg, jdouble jd)
{
   TF     tf;
   TERM   t;
   double d;

   GET_EID(e);
   t = (TERM)jt;
   d = (double)jd;
   tf = lsUnifyArg(e, &t, (int)jarg, cDOUBLE, &d); 

   switch(tf)
   {
   case TRUE: return (jlong)t;
   case FALSE: return 0;
   default: amzi_error(jenv, e, "UnifyFloatArg"); return 0;
   }
}

/*
 * Class:     amzi_ls_LogicServer
 * Method:    GetArgType
 * Signature: (JI)S
 */
extern "C" JNIEXPORT jint JNICALL Java_amzi_ls_LogicServer_GetArgType
  (JNIEnv * jenv, jobject jobj, jlong jt, jint ji)
{
   pTYPE type;

   GET_EID(e);
   type = lsGetArgType(e, (TERM)jt, (int)ji);

   return (jint)type;
}

/*
 * Class:     amzi_ls_LogicServer
 * Method:    StrArgLen
 * Signature: (JI)I
 */
extern "C" JNIEXPORT jint JNICALL Java_amzi_ls_LogicServer_StrArgLen
  (JNIEnv * jenv, jobject jobj, jlong jt, jint ji)
{
   int len;

   GET_EID(e);
   len = lsStrArgLen(e, (TERM)jt, (int)ji);

   return (jint)len;
}

/*
 * Class:     amzi_ls_LogicServer
 * Method:    MakeList
 * Signature: ()J
 */
extern "C" JNIEXPORT jlong JNICALL Java_amzi_ls_LogicServer_MakeList
  (JNIEnv * jenv, jobject jobj)
{
   RC    rc;
   TERM  t;

   GET_EID(e);
   rc = lsMakeList(e, &t);
   if (rc != OK)
      amzi_error(jenv, e, "MakeList");

   return (jlong)t;
}

/*
 * Class:     amzi_ls_LogicServer
 * Method:    PushList
 * Signature: (JJ)J
 */
extern "C" JNIEXPORT jlong JNICALL Java_amzi_ls_LogicServer_PushList
  (JNIEnv * jenv, jobject jobj, jlong jt, jlong jlt)
{
   RC     rc;
   TERM   t;

   GET_EID(e);
   t = (TERM)jt;
   rc = lsPushList(e, &t, (TERM)jlt);
   if (rc != OK)
      amzi_error(jenv, e, "PushList");

   return (jlong)t;
}

/*
 * Class:     amzi_ls_LogicServer
 * Method:    GetHead
 * Signature: (J)J
 */
extern "C" JNIEXPORT jlong JNICALL Java_amzi_ls_LogicServer_GetHead
  (JNIEnv * jenv, jobject jobj, jlong jt)
{
   RC     rc;
   TERM   t;

   GET_EID(e);
   rc = lsGetHead(e, (TERM)jt, cTERM, &t);
   if (rc != OK)
      amzi_error(jenv, e, "GetHead");

   return (jlong)t;
}

/*
 * Class:     amzi_ls_LogicServer
 * Method:    GetStrHead
 * Signature: (J)Ljava/lang/String;
 */
extern "C" JNIEXPORT jstring JNICALL Java_amzi_ls_LogicServer_GetStrHead
  (JNIEnv * jenv, jobject jobj, jlong jt)
{
   RC     rc;
   aCHAR* str;
   jCHAR* jcstr;
   TERM   t;

   GET_EID(e);
   rc = lsGetHead(e, (TERM)jt, cTERM, &t);
   if (rc != OK)
      amzi_error(jenv, e, "GetStrHead");

   int len = lsStrTermLen(e, t);
   str = new aCHAR[len+1];
   rc = lsGetTerm(e, t, cWSTR, str);
   jcstr = new jCHAR[len+1];
   ac_to_jc(jcstr, str, len);
   jstring jstr = jenv->NewString(jcstr, len);
   delete[] str;
   delete[] jcstr;
   if (rc != OK)
      amzi_error(jenv, e, "GetStrHead");

   return jstr;
}

/*
 * Class:     amzi_ls_LogicServer
 * Method:    GetIntHead
 * Signature: (I)S
 */
extern "C" JNIEXPORT jint JNICALL Java_amzi_ls_LogicServer_GetIntHead
  (JNIEnv * jenv, jobject jobj, jlong jt)
{
   RC     rc;
   int    i;

   GET_EID(e);
   rc = lsGetHead(e, (TERM)jt, cINT, &i);
   if (rc != OK)
      amzi_error(jenv, e, "GetIntHead");

   return (jint)i;
}


/*
 * Class:     amzi_ls_LogicServer
 * Method:    GetFloatHead
 * Signature: (J)D
 */
extern "C" JNIEXPORT jdouble JNICALL Java_amzi_ls_LogicServer_GetFloatHead
  (JNIEnv * jenv, jobject jobj, jlong jt)
{
   RC     rc;
   double d;

   GET_EID(e);
   rc = lsGetHead(e, (TERM)jt, cDOUBLE, &d);
   if (rc != OK)
      amzi_error(jenv, e, "GetFloatHead");

   return (jdouble)d;
}

/*
 * Class:     amzi_ls_LogicServer
 * Method:    GetTail
 * Signature: (J)J
 */
extern "C" JNIEXPORT jlong JNICALL Java_amzi_ls_LogicServer_GetTail
  (JNIEnv * jenv, jobject jobj, jlong jt)
{
   TERM   t;

   GET_EID(e);
   t = lsGetTail(e, (TERM)jt);

   return (jlong)t;
}

/*
 * Class:     amzi_ls_LogicServer
 * Method:    GetVersion
 * Signature: ()Ljava/lang/String;
 */
extern "C" JNIEXPORT jstring JNICALL Java_amzi_ls_LogicServer_GetVersion
  (JNIEnv * jenv, jobject jobj)
{
   RC     rc;
   aCHAR  str[1024];
   jCHAR  jcstr[1024];

   GET_EID(e);
   rc = lsGetVersion(e, str);
   if (rc != OK)
      amzi_error(jenv, e, "GetVersion");

   int len = wcslen(str);
   ac_to_jc(jcstr, str, len+1);
   jstring jstr = jenv->NewString(jcstr, len);

   return jstr;
}
