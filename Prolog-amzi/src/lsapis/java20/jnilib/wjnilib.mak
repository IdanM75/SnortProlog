# Microsoft Developer Studio Generated NMAKE File, Based on wjnilib.dsp
!IF "$(CFG)" == ""
CFG=wjnilib - Win32 Debug
!MESSAGE No configuration specified. Defaulting to wjnilib - Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "wjnilib - Win32 Release" && "$(CFG)" != "wjnilib - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "wjnilib.mak" CFG="wjnilib - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "wjnilib - Win32 Release" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "wjnilib - Win32 Debug" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

!IF  "$(CFG)" == "wjnilib - Win32 Release"

OUTDIR=.\Release
INTDIR=.\Release
# Begin Custom Macros
OutDir=.\Release
# End Custom Macros

ALL : ".\$(AMZI_DEV_DIR)\bin\amzijni.dll" "$(OUTDIR)\wjnilib.bsc"


CLEAN :
	-@erase "$(INTDIR)\amzijni.obj"
	-@erase "$(INTDIR)\amzijni.sbr"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\amzijni.exp"
	-@erase "$(OUTDIR)\amzijni.lib"
	-@erase "$(OUTDIR)\wjnilib.bsc"
	-@erase ".\$(AMZI_DEV_DIR)\bin\amzijni.dll"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MT /W3 /GX /O2 /I "$(AMZI_DEV_DIR)\include" /I "$(java_home)\include\win32" /I "$(java_home)\include" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_UNICODE" /D "_USRDLL" /D "WJNILIB_EXPORTS" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\wjnilib.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

.c{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /win32 
RSC=rc.exe
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\wjnilib.bsc" 
BSC32_SBRS= \
	"$(INTDIR)\amzijni.sbr"

"$(OUTDIR)\wjnilib.bsc" : "$(OUTDIR)" $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LINK32=link.exe
LINK32_FLAGS=$(AMZI_DEV_DIR)\lib\amzi.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /dll /incremental:no /pdb:"$(OUTDIR)\amzijni.pdb" /machine:I386 /out:"$(AMZI_DEV_DIR)\bin\amzijni.dll" /implib:"$(OUTDIR)\amzijni.lib" 
LINK32_OBJS= \
	"$(INTDIR)\amzijni.obj"

".\$(AMZI_DEV_DIR)\bin\amzijni.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "wjnilib - Win32 Debug"

OUTDIR=.\Debug
INTDIR=.\Debug

ALL : ".\$(AMZI_DEV_DIR)\bin\amzijni.dll"


CLEAN :
	-@erase "$(INTDIR)\amzijni.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\amzijni.exp"
	-@erase "$(OUTDIR)\amzijni.lib"
	-@erase "$(OUTDIR)\amzijni.pdb"
	-@erase ".\$(AMZI_DEV_DIR)\bin\amzijni.dll"
	-@erase ".\$(AMZI_DEV_DIR)\bin\amzijni.ilk"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MTd /W3 /Gm /GX /ZI /Od /I "$(AMZI_DEV_DIR)\include" /I "$(java_home)\include\win32" /I "$(java_home)\include" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_UNICODE" /D "_USRDLL" /D "WJNILIB_EXPORTS" /Fp"$(INTDIR)\wjnilib.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /GZ /c 

.c{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

MTL=midl.exe
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /win32 
RSC=rc.exe
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\wjnilib.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=$(AMZI_DEV_DIR)\lib\amzi.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /dll /incremental:yes /pdb:"$(OUTDIR)\amzijni.pdb" /debug /machine:I386 /out:"$(AMZI_DEV_DIR)\bin\amzijni.dll" /implib:"$(OUTDIR)\amzijni.lib" /pdbtype:sept 
LINK32_OBJS= \
	"$(INTDIR)\amzijni.obj"

".\$(AMZI_DEV_DIR)\bin\amzijni.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ENDIF 


!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("wjnilib.dep")
!INCLUDE "wjnilib.dep"
!ELSE 
!MESSAGE Warning: cannot find "wjnilib.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "wjnilib - Win32 Release" || "$(CFG)" == "wjnilib - Win32 Debug"
SOURCE=.\amzijni.cpp

!IF  "$(CFG)" == "wjnilib - Win32 Release"


"$(INTDIR)\amzijni.obj"	"$(INTDIR)\amzijni.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "wjnilib - Win32 Debug"


"$(INTDIR)\amzijni.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 


!ENDIF 

