/* DO NOT EDIT THIS FILE - it is machine generated */
#include <jni.h>
/* Header for class amzi_ls_LogicServer */

#ifndef _Included_amzi_ls_LogicServer
#define _Included_amzi_ls_LogicServer
#ifdef __cplusplus
extern "C" {
#endif
#undef amzi_ls_LogicServer_pERR
#define amzi_ls_LogicServer_pERR -1L
#undef amzi_ls_LogicServer_pATOM
#define amzi_ls_LogicServer_pATOM 0L
#undef amzi_ls_LogicServer_pINT
#define amzi_ls_LogicServer_pINT 1L
#undef amzi_ls_LogicServer_pSTR
#define amzi_ls_LogicServer_pSTR 2L
#undef amzi_ls_LogicServer_pFLOAT
#define amzi_ls_LogicServer_pFLOAT 3L
#undef amzi_ls_LogicServer_pSTRUCT
#define amzi_ls_LogicServer_pSTRUCT 4L
#undef amzi_ls_LogicServer_pLIST
#define amzi_ls_LogicServer_pLIST 5L
#undef amzi_ls_LogicServer_pTERM
#define amzi_ls_LogicServer_pTERM 6L
#undef amzi_ls_LogicServer_pADDR
#define amzi_ls_LogicServer_pADDR 7L
#undef amzi_ls_LogicServer_pVAR
#define amzi_ls_LogicServer_pVAR 8L
#undef amzi_ls_LogicServer_pWSTR
#define amzi_ls_LogicServer_pWSTR 9L
#undef amzi_ls_LogicServer_pWATOM
#define amzi_ls_LogicServer_pWATOM 10L
#undef amzi_ls_LogicServer_jAATOM
#define amzi_ls_LogicServer_jAATOM 0L
#undef amzi_ls_LogicServer_jASTR
#define amzi_ls_LogicServer_jASTR 1L
#undef amzi_ls_LogicServer_jINT
#define amzi_ls_LogicServer_jINT 2L
#undef amzi_ls_LogicServer_jLONG
#define amzi_ls_LogicServer_jLONG 3L
#undef amzi_ls_LogicServer_jSHORT
#define amzi_ls_LogicServer_jSHORT 4L
#undef amzi_ls_LogicServer_jFLOAT
#define amzi_ls_LogicServer_jFLOAT 5L
#undef amzi_ls_LogicServer_jDOUBLE
#define amzi_ls_LogicServer_jDOUBLE 6L
#undef amzi_ls_LogicServer_jADDR
#define amzi_ls_LogicServer_jADDR 7L
#undef amzi_ls_LogicServer_jTERM
#define amzi_ls_LogicServer_jTERM 8L
#undef amzi_ls_LogicServer_jWSTR
#define amzi_ls_LogicServer_jWSTR 9L
#undef amzi_ls_LogicServer_jWATOM
#define amzi_ls_LogicServer_jWATOM 10L
/*
 * Class:     amzi_ls_LogicServer
 * Method:    Init
 * Signature: (Ljava/lang/String;)V
 */
JNIEXPORT void JNICALL Java_amzi_ls_LogicServer_Init
  (JNIEnv *, jobject, jstring);

/*
 * Class:     amzi_ls_LogicServer
 * Method:    Init2
 * Signature: (Ljava/lang/String;)V
 */
JNIEXPORT void JNICALL Java_amzi_ls_LogicServer_Init2
  (JNIEnv *, jobject, jstring);

/*
 * Class:     amzi_ls_LogicServer
 * Method:    InitLSX
 * Signature: (J)V
 */
JNIEXPORT void JNICALL Java_amzi_ls_LogicServer_InitLSX
  (JNIEnv *, jobject, jlong);

/*
 * Class:     amzi_ls_LogicServer
 * Method:    AddLSX
 * Signature: (Ljava/lang/String;J)V
 */
JNIEXPORT void JNICALL Java_amzi_ls_LogicServer_AddLSX
  (JNIEnv *, jobject, jstring, jlong);

/*
 * Class:     amzi_ls_LogicServer
 * Method:    AddJPred
 * Signature: (Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/Object;J)V
 */
JNIEXPORT void JNICALL Java_amzi_ls_LogicServer_AddJPred
  (JNIEnv *, jobject, jstring, jint, jstring, jstring, jobject, jlong);

/*
 * Class:     amzi_ls_LogicServer
 * Method:    Load
 * Signature: (Ljava/lang/String;)V
 */
JNIEXPORT void JNICALL Java_amzi_ls_LogicServer_Load
  (JNIEnv *, jobject, jstring);

/*
 * Class:     amzi_ls_LogicServer
 * Method:    Main
 * Signature: ()Z
 */
JNIEXPORT jboolean JNICALL Java_amzi_ls_LogicServer_Main
  (JNIEnv *, jobject);

/*
 * Class:     amzi_ls_LogicServer
 * Method:    Reset
 * Signature: ()V
 */
JNIEXPORT void JNICALL Java_amzi_ls_LogicServer_Reset
  (JNIEnv *, jobject);

/*
 * Class:     amzi_ls_LogicServer
 * Method:    JClose
 * Signature: (J)V
 */
JNIEXPORT void JNICALL Java_amzi_ls_LogicServer_JClose
  (JNIEnv *, jobject, jlong);

/*
 * Class:     amzi_ls_LogicServer
 * Method:    Exec
 * Signature: (J)J
 */
JNIEXPORT jlong JNICALL Java_amzi_ls_LogicServer_Exec
  (JNIEnv *, jobject, jlong);

/*
 * Class:     amzi_ls_LogicServer
 * Method:    ExecStr
 * Signature: (Ljava/lang/String;)J
 */
JNIEXPORT jlong JNICALL Java_amzi_ls_LogicServer_ExecStr
  (JNIEnv *, jobject, jstring);

/*
 * Class:     amzi_ls_LogicServer
 * Method:    Call
 * Signature: (J)J
 */
JNIEXPORT jlong JNICALL Java_amzi_ls_LogicServer_Call
  (JNIEnv *, jobject, jlong);

/*
 * Class:     amzi_ls_LogicServer
 * Method:    CallStr
 * Signature: (Ljava/lang/String;)J
 */
JNIEXPORT jlong JNICALL Java_amzi_ls_LogicServer_CallStr
  (JNIEnv *, jobject, jstring);

/*
 * Class:     amzi_ls_LogicServer
 * Method:    Redo
 * Signature: ()Z
 */
JNIEXPORT jboolean JNICALL Java_amzi_ls_LogicServer_Redo
  (JNIEnv *, jobject);

/*
 * Class:     amzi_ls_LogicServer
 * Method:    ClearCall
 * Signature: ()V
 */
JNIEXPORT void JNICALL Java_amzi_ls_LogicServer_ClearCall
  (JNIEnv *, jobject);

/*
 * Class:     amzi_ls_LogicServer
 * Method:    Asserta
 * Signature: (J)V
 */
JNIEXPORT void JNICALL Java_amzi_ls_LogicServer_Asserta
  (JNIEnv *, jobject, jlong);

/*
 * Class:     amzi_ls_LogicServer
 * Method:    Assertz
 * Signature: (J)V
 */
JNIEXPORT void JNICALL Java_amzi_ls_LogicServer_Assertz
  (JNIEnv *, jobject, jlong);

/*
 * Class:     amzi_ls_LogicServer
 * Method:    Retract
 * Signature: (J)J
 */
JNIEXPORT jlong JNICALL Java_amzi_ls_LogicServer_Retract
  (JNIEnv *, jobject, jlong);

/*
 * Class:     amzi_ls_LogicServer
 * Method:    AssertaStr
 * Signature: (Ljava/lang/String;)V
 */
JNIEXPORT void JNICALL Java_amzi_ls_LogicServer_AssertaStr
  (JNIEnv *, jobject, jstring);

/*
 * Class:     amzi_ls_LogicServer
 * Method:    AssertzStr
 * Signature: (Ljava/lang/String;)V
 */
JNIEXPORT void JNICALL Java_amzi_ls_LogicServer_AssertzStr
  (JNIEnv *, jobject, jstring);

/*
 * Class:     amzi_ls_LogicServer
 * Method:    RetractStr
 * Signature: (Ljava/lang/String;)Z
 */
JNIEXPORT jboolean JNICALL Java_amzi_ls_LogicServer_RetractStr
  (JNIEnv *, jobject, jstring);

/*
 * Class:     amzi_ls_LogicServer
 * Method:    TermToStr
 * Signature: (JI)Ljava/lang/String;
 */
JNIEXPORT jstring JNICALL Java_amzi_ls_LogicServer_TermToStr
  (JNIEnv *, jobject, jlong, jint);

/*
 * Class:     amzi_ls_LogicServer
 * Method:    TermToStrQ
 * Signature: (JI)Ljava/lang/String;
 */
JNIEXPORT jstring JNICALL Java_amzi_ls_LogicServer_TermToStrQ
  (JNIEnv *, jobject, jlong, jint);

/*
 * Class:     amzi_ls_LogicServer
 * Method:    StrToTerm
 * Signature: (Ljava/lang/String;)J
 */
JNIEXPORT jlong JNICALL Java_amzi_ls_LogicServer_StrToTerm
  (JNIEnv *, jobject, jstring);

/*
 * Class:     amzi_ls_LogicServer
 * Method:    StrTermLen
 * Signature: (J)I
 */
JNIEXPORT jint JNICALL Java_amzi_ls_LogicServer_StrTermLen
  (JNIEnv *, jobject, jlong);

/*
 * Class:     amzi_ls_LogicServer
 * Method:    MakeAtom
 * Signature: (Ljava/lang/String;)J
 */
JNIEXPORT jlong JNICALL Java_amzi_ls_LogicServer_MakeAtom
  (JNIEnv *, jobject, jstring);

/*
 * Class:     amzi_ls_LogicServer
 * Method:    MakeStr
 * Signature: (Ljava/lang/String;)J
 */
JNIEXPORT jlong JNICALL Java_amzi_ls_LogicServer_MakeStr
  (JNIEnv *, jobject, jstring);

/*
 * Class:     amzi_ls_LogicServer
 * Method:    MakeInt
 * Signature: (I)J
 */
JNIEXPORT jlong JNICALL Java_amzi_ls_LogicServer_MakeInt
  (JNIEnv *, jobject, jint);

/*
 * Class:     amzi_ls_LogicServer
 * Method:    MakeFloat
 * Signature: (D)J
 */
JNIEXPORT jlong JNICALL Java_amzi_ls_LogicServer_MakeFloat
  (JNIEnv *, jobject, jdouble);

/*
 * Class:     amzi_ls_LogicServer
 * Method:    GetTermType
 * Signature: (J)I
 */
JNIEXPORT jint JNICALL Java_amzi_ls_LogicServer_GetTermType
  (JNIEnv *, jobject, jlong);

/*
 * Class:     amzi_ls_LogicServer
 * Method:    GetStrTerm
 * Signature: (J)Ljava/lang/String;
 */
JNIEXPORT jstring JNICALL Java_amzi_ls_LogicServer_GetStrTerm
  (JNIEnv *, jobject, jlong);

/*
 * Class:     amzi_ls_LogicServer
 * Method:    GetIntTerm
 * Signature: (J)I
 */
JNIEXPORT jint JNICALL Java_amzi_ls_LogicServer_GetIntTerm
  (JNIEnv *, jobject, jlong);

/*
 * Class:     amzi_ls_LogicServer
 * Method:    GetFloatTerm
 * Signature: (J)D
 */
JNIEXPORT jdouble JNICALL Java_amzi_ls_LogicServer_GetFloatTerm
  (JNIEnv *, jobject, jlong);

/*
 * Class:     amzi_ls_LogicServer
 * Method:    GetParmType
 * Signature: (I)I
 */
JNIEXPORT jint JNICALL Java_amzi_ls_LogicServer_GetParmType
  (JNIEnv *, jobject, jint);

/*
 * Class:     amzi_ls_LogicServer
 * Method:    GetParm
 * Signature: (I)J
 */
JNIEXPORT jlong JNICALL Java_amzi_ls_LogicServer_GetParm
  (JNIEnv *, jobject, jint);

/*
 * Class:     amzi_ls_LogicServer
 * Method:    GetStrParm
 * Signature: (I)Ljava/lang/String;
 */
JNIEXPORT jstring JNICALL Java_amzi_ls_LogicServer_GetStrParm
  (JNIEnv *, jobject, jint);

/*
 * Class:     amzi_ls_LogicServer
 * Method:    GetIntParm
 * Signature: (I)I
 */
JNIEXPORT jint JNICALL Java_amzi_ls_LogicServer_GetIntParm
  (JNIEnv *, jobject, jint);

/*
 * Class:     amzi_ls_LogicServer
 * Method:    GetFloatParm
 * Signature: (I)D
 */
JNIEXPORT jdouble JNICALL Java_amzi_ls_LogicServer_GetFloatParm
  (JNIEnv *, jobject, jint);

/*
 * Class:     amzi_ls_LogicServer
 * Method:    UnifyParm
 * Signature: (IJ)Z
 */
JNIEXPORT jboolean JNICALL Java_amzi_ls_LogicServer_UnifyParm
  (JNIEnv *, jobject, jint, jlong);

/*
 * Class:     amzi_ls_LogicServer
 * Method:    UnifyStrParm
 * Signature: (ILjava/lang/String;)Z
 */
JNIEXPORT jboolean JNICALL Java_amzi_ls_LogicServer_UnifyStrParm
  (JNIEnv *, jobject, jint, jstring);

/*
 * Class:     amzi_ls_LogicServer
 * Method:    UnifyIntParm
 * Signature: (II)Z
 */
JNIEXPORT jboolean JNICALL Java_amzi_ls_LogicServer_UnifyIntParm
  (JNIEnv *, jobject, jint, jint);

/*
 * Class:     amzi_ls_LogicServer
 * Method:    UnifyFloatParm
 * Signature: (ID)Z
 */
JNIEXPORT jboolean JNICALL Java_amzi_ls_LogicServer_UnifyFloatParm
  (JNIEnv *, jobject, jint, jdouble);

/*
 * Class:     amzi_ls_LogicServer
 * Method:    GetFunctor
 * Signature: (J)Ljava/lang/String;
 */
JNIEXPORT jstring JNICALL Java_amzi_ls_LogicServer_GetFunctor
  (JNIEnv *, jobject, jlong);

/*
 * Class:     amzi_ls_LogicServer
 * Method:    GetArity
 * Signature: (J)I
 */
JNIEXPORT jint JNICALL Java_amzi_ls_LogicServer_GetArity
  (JNIEnv *, jobject, jlong);

/*
 * Class:     amzi_ls_LogicServer
 * Method:    MakeFA
 * Signature: (Ljava/lang/String;I)J
 */
JNIEXPORT jlong JNICALL Java_amzi_ls_LogicServer_MakeFA
  (JNIEnv *, jobject, jstring, jint);

/*
 * Class:     amzi_ls_LogicServer
 * Method:    GetArg
 * Signature: (JI)J
 */
JNIEXPORT jlong JNICALL Java_amzi_ls_LogicServer_GetArg
  (JNIEnv *, jobject, jlong, jint);

/*
 * Class:     amzi_ls_LogicServer
 * Method:    GetStrArg
 * Signature: (JI)Ljava/lang/String;
 */
JNIEXPORT jstring JNICALL Java_amzi_ls_LogicServer_GetStrArg
  (JNIEnv *, jobject, jlong, jint);

/*
 * Class:     amzi_ls_LogicServer
 * Method:    GetIntArg
 * Signature: (JI)I
 */
JNIEXPORT jint JNICALL Java_amzi_ls_LogicServer_GetIntArg
  (JNIEnv *, jobject, jlong, jint);

/*
 * Class:     amzi_ls_LogicServer
 * Method:    GetFloatArg
 * Signature: (JI)D
 */
JNIEXPORT jdouble JNICALL Java_amzi_ls_LogicServer_GetFloatArg
  (JNIEnv *, jobject, jlong, jint);

/*
 * Class:     amzi_ls_LogicServer
 * Method:    UnifyStrArg
 * Signature: (JILjava/lang/String;)J
 */
JNIEXPORT jlong JNICALL Java_amzi_ls_LogicServer_UnifyStrArg
  (JNIEnv *, jobject, jlong, jint, jstring);

/*
 * Class:     amzi_ls_LogicServer
 * Method:    UnifyIntArg
 * Signature: (JII)J
 */
JNIEXPORT jlong JNICALL Java_amzi_ls_LogicServer_UnifyIntArg
  (JNIEnv *, jobject, jlong, jint, jint);

/*
 * Class:     amzi_ls_LogicServer
 * Method:    UnifyFloatArg
 * Signature: (JID)J
 */
JNIEXPORT jlong JNICALL Java_amzi_ls_LogicServer_UnifyFloatArg
  (JNIEnv *, jobject, jlong, jint, jdouble);

/*
 * Class:     amzi_ls_LogicServer
 * Method:    GetArgType
 * Signature: (JI)I
 */
JNIEXPORT jint JNICALL Java_amzi_ls_LogicServer_GetArgType
  (JNIEnv *, jobject, jlong, jint);

/*
 * Class:     amzi_ls_LogicServer
 * Method:    StrArgLen
 * Signature: (JI)I
 */
JNIEXPORT jint JNICALL Java_amzi_ls_LogicServer_StrArgLen
  (JNIEnv *, jobject, jlong, jint);

/*
 * Class:     amzi_ls_LogicServer
 * Method:    MakeList
 * Signature: ()J
 */
JNIEXPORT jlong JNICALL Java_amzi_ls_LogicServer_MakeList
  (JNIEnv *, jobject);

/*
 * Class:     amzi_ls_LogicServer
 * Method:    PushList
 * Signature: (JJ)J
 */
JNIEXPORT jlong JNICALL Java_amzi_ls_LogicServer_PushList
  (JNIEnv *, jobject, jlong, jlong);

/*
 * Class:     amzi_ls_LogicServer
 * Method:    GetHead
 * Signature: (J)J
 */
JNIEXPORT jlong JNICALL Java_amzi_ls_LogicServer_GetHead
  (JNIEnv *, jobject, jlong);

/*
 * Class:     amzi_ls_LogicServer
 * Method:    GetStrHead
 * Signature: (J)Ljava/lang/String;
 */
JNIEXPORT jstring JNICALL Java_amzi_ls_LogicServer_GetStrHead
  (JNIEnv *, jobject, jlong);

/*
 * Class:     amzi_ls_LogicServer
 * Method:    GetIntHead
 * Signature: (J)I
 */
JNIEXPORT jint JNICALL Java_amzi_ls_LogicServer_GetIntHead
  (JNIEnv *, jobject, jlong);

/*
 * Class:     amzi_ls_LogicServer
 * Method:    GetFloatHead
 * Signature: (J)D
 */
JNIEXPORT jdouble JNICALL Java_amzi_ls_LogicServer_GetFloatHead
  (JNIEnv *, jobject, jlong);

/*
 * Class:     amzi_ls_LogicServer
 * Method:    GetTail
 * Signature: (J)J
 */
JNIEXPORT jlong JNICALL Java_amzi_ls_LogicServer_GetTail
  (JNIEnv *, jobject, jlong);

/*
 * Class:     amzi_ls_LogicServer
 * Method:    GetVersion
 * Signature: ()Ljava/lang/String;
 */
JNIEXPORT jstring JNICALL Java_amzi_ls_LogicServer_GetVersion
  (JNIEnv *, jobject);

#ifdef __cplusplus
}
#endif
#endif
