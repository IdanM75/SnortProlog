/* DO NOT EDIT THIS FILE - it is machine generated */
#include <jni.h>
/* Header for class amzi_ls_LSException */

#ifndef _Included_amzi_ls_LSException
#define _Included_amzi_ls_LSException
#ifdef __cplusplus
extern "C" {
#endif
#undef amzi_ls_LSException_serialVersionUID
#define amzi_ls_LSException_serialVersionUID -3042686055658047285LL
#undef amzi_ls_LSException_BADENG
#define amzi_ls_LSException_BADENG 0L
#undef amzi_ls_LSException_ABORT
#define amzi_ls_LSException_ABORT 1L
#undef amzi_ls_LSException_INTERNAL
#define amzi_ls_LSException_INTERNAL 2L
#undef amzi_ls_LSException_FATAL
#define amzi_ls_LSException_FATAL 3L
#undef amzi_ls_LSException_INIT
#define amzi_ls_LSException_INIT 4L
#undef amzi_ls_LSException_API
#define amzi_ls_LSException_API 5L
#undef amzi_ls_LSException_LOAD
#define amzi_ls_LSException_LOAD 6L
#undef amzi_ls_LSException_EXEC
#define amzi_ls_LSException_EXEC 7L
#undef amzi_ls_LSException_READ
#define amzi_ls_LSException_READ 8L
#undef amzi_ls_LSException_UNKNOWN
#define amzi_ls_LSException_UNKNOWN 9L
/*
 * Class:     amzi_ls_LSException
 * Method:    GetType
 * Signature: ()I
 */
JNIEXPORT jint JNICALL Java_amzi_ls_LSException_GetType
  (JNIEnv *, jobject);

/*
 * Class:     amzi_ls_LSException
 * Method:    GetRC
 * Signature: ()I
 */
JNIEXPORT jint JNICALL Java_amzi_ls_LSException_GetRC
  (JNIEnv *, jobject);

/*
 * Class:     amzi_ls_LSException
 * Method:    GetLineno
 * Signature: ()I
 */
JNIEXPORT jint JNICALL Java_amzi_ls_LSException_GetLineno
  (JNIEnv *, jobject);

/*
 * Class:     amzi_ls_LSException
 * Method:    GetMsg
 * Signature: ()Ljava/lang/String;
 */
JNIEXPORT jstring JNICALL Java_amzi_ls_LSException_GetMsg
  (JNIEnv *, jobject);

/*
 * Class:     amzi_ls_LSException
 * Method:    GetReadFileName
 * Signature: ()Ljava/lang/String;
 */
JNIEXPORT jstring JNICALL Java_amzi_ls_LSException_GetReadFileName
  (JNIEnv *, jobject);

/*
 * Class:     amzi_ls_LSException
 * Method:    GetReadBuffer
 * Signature: ()Ljava/lang/String;
 */
JNIEXPORT jstring JNICALL Java_amzi_ls_LSException_GetReadBuffer
  (JNIEnv *, jobject);

/*
 * Class:     amzi_ls_LSException
 * Method:    GetCallStack
 * Signature: ()Ljava/lang/String;
 */
JNIEXPORT jstring JNICALL Java_amzi_ls_LSException_GetCallStack
  (JNIEnv *, jobject);

#ifdef __cplusplus
}
#endif
#endif
