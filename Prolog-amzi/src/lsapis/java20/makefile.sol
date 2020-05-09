HERE = $(AMZI_DEV_DIR)/src/lsapis/java20
DIST = $(AMZI_DEV_DIR)/lsapis/java20

all: _dirs _java _amzijni

_dirs:
	-mkdir -p $(DIST)
	-mkdir $(DIST)/amzi
	-mkdir $(DIST)/amzi/ls

_java: amzi/ls/LogicServer.class

amzi/ls/LogicServer.class: amzi/ls/LogicServer.java
	javac amzi/ls/LSException.java
	javac amzi/ls/LogicServer.java
	cp amzi/ls/LSException.class $(DIST)/amzi/ls/LSException.class
	cp amzi/ls/LogicServer.class $(DIST)/amzi/ls/LogicServer.class

_amzijni: jnilib/amzi_ls_LogicServer.h jnilib/amzi_ls_LSException.h
	cd jnilib; make -f makefile.sol

jnilib/amzi_ls_LogicServer.h: amzi/ls/LogicServer.java
	javah -jni -d jnilib amzi.ls.LogicServer

jnilib/amzi_ls_LSException.h: amzi/ls/LSException.java
	javah -jni -d jnilib amzi.ls.LSException

clean:
	-rm amzi/ls/*.class
	-rm jnilib/amzi_ls_LogicServer.h
	-rm jnilib/amzi_ls_LSException.h

