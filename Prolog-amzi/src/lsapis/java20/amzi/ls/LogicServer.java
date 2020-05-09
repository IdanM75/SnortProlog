/**
    Amzi! Logic Server Java 2.0 Interface
    Copyright 1996-2000 Amzi! inc. All Rights Reserved
*/

package amzi.ls;

public class LogicServer
{
	private long curEng;

   /* Prolog types */
   public static final int pERR = -1, pATOM = 0, pINT = 1, pSTR = 2, pFLOAT = 3,
      pSTRUCT = 4, pLIST = 5, pTERM = 6, pADDR = 7, pVAR = 8, pWSTR = 9, pWATOM = 10;

   /* Java types */
   public static final int jAATOM = 0, jASTR = 1, jINT = 2, jLONG = 3, jSHORT = 4,
      jFLOAT = 5, jDOUBLE = 6, jADDR = 7, jTERM = 8, jWSTR = 9, jWATOM = 10;

	/* Main entry points to set up Prolog environment */

	public native void Init(String ININame) throws LSException;
	public native void Init2(String INIParms) throws LSException;
	public native void InitLSX(long Arg) throws LSException;
	public native void AddLSX(String LSXName, long Arg) throws LSException;
	public native void AddJPred(String PredName, int Arity,
		String Class, String Method, Object Obj, long eng) throws LSException;
	public void AddPred(String PredName, int Arity,
		String Class, String Method, Object Obj) throws LSException
	{
	        AddJPred(PredName, Arity,
		        Class, Method, Obj, curEng);
        }
	public native void Load(String XPLName) throws LSException;
	public native boolean Main() throws LSException;
	public native void Reset() throws LSException;
	public native void JClose(long eng) throws LSException;
	public void Close() throws LSException
	{
	        JClose(curEng);
	}
	
	/* Calling Prolog from Java */

	public native long Exec(long Term) throws LSException;
	public native long ExecStr(String Query) throws LSException;
   public native long Call(long Term) throws LSException;
   public native long CallStr(String Query) throws LSException;
   public native boolean Redo() throws LSException;
	public native void ClearCall() throws LSException;

	/* Asserting and retracting */

	public native void Asserta(long Term) throws LSException;
	public native void Assertz(long Term) throws LSException;
	public native long Retract(long Term) throws LSException;
	public native void AssertaStr(String TermStr) throws LSException;
	public native void AssertzStr(String TermStr) throws LSException;
	public native boolean RetractStr(String TermStr) throws LSException;

	/* String/Term conversion functions */

	public native String TermToStr(long Term, int Len) throws LSException;
	public native String TermToStrQ(long Term, int Len) throws LSException;
   public native long StrToTerm(String TermStr) throws LSException;
   public native int  StrTermLen(long Term) throws LSException;

	/* Making Prolog types */

	public native long MakeAtom(String AtomStr) throws LSException;
	public native long MakeStr(String Str) throws LSException;
	public native long MakeInt(int Num) throws LSException;
	public native long MakeFloat(double Num) throws LSException;

	/* Getting Java values from Prolog terms */

	public native int GetTermType(long Term) throws LSException;
	public native String GetStrTerm(long Term) throws LSException;
	public native int GetIntTerm(long Term) throws LSException;
	public native double GetFloatTerm(long Term) throws LSException;

   /* Get Parameters for Extended Predicates */

   public native int GetParmType(int iarg) throws LSException;
   public native long GetParm(int iarg) throws LSException;
   public native String GetStrParm(int iarg) throws LSException;
   public native int GetIntParm(int iarg) throws LSException;
   public native double GetFloatParm(int iarg) throws LSException;
   public native boolean UnifyParm(int iarg, long Term) throws LSException;
   public native boolean UnifyStrParm(int iarg, String s) throws LSException;
   public native boolean UnifyIntParm(int iarg, int i) throws LSException;
   public native boolean UnifyFloatParm(int iarg, double f) throws LSException;

	/* Structure hacking functions */

	public native String GetFunctor(long Term) throws LSException;
	public native int GetArity(long Term) throws LSException;
	public native long MakeFA(String Functor, int Arity) throws LSException;
	public native long GetArg(long Term, int Num) throws LSException;
	public native String GetStrArg(long Term, int Num) throws LSException;
	public native int GetIntArg(long Term, int Num) throws LSException;
	public native double GetFloatArg(long Term, int Num) throws LSException;
	public native long UnifyStrArg(long Term, int Num, String Str) throws LSException;
	public native long UnifyIntArg(long Term, int Num, int Val) throws LSException;
	public native long UnifyFloatArg(long Term, int Num, double Val) throws LSException;
	public native int GetArgType(long Term, int Num) throws LSException;
	public native int StrArgLen(long Term, int Num) throws LSException;

	/* List hacking functions */

	public native long MakeList() throws LSException;
	public native long PushList(long ListTerm, long Term) throws LSException;
	public native long GetHead(long ListTerm) throws LSException;
	public native String GetStrHead(long ListTerm) throws LSException;
	public native int GetIntHead(long ListTerm) throws LSException;
	public native double GetFloatHead(long ListTerm) throws LSException;
	public native long GetTail(long ListTerm) throws LSException;

	/* Miscellaneous functions */

	public native String GetVersion() throws LSException;


	static
	{
	    System.loadLibrary("amzijni");
	}
}
