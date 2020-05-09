FILES = amzijni.cpp

HEADERS = amzi_ls_LogicServer.h amzi_ls_LSException.h
I_DIRS = -I$(AMZI_DEV_DIR)/include -I/usr/java1.2/include -I/usr/java1.2/include/solaris
L_DIRS = -L$(AMZI_DEV_DIR)/lib -L/usr/java1.2/lib

# -g is for debugging, -G is for building a .so
#C_FLAGS = -G -g
C_FLAGS = -G -KPIC -D_UNICODE -Bdynamic -lamzi -Bstatic -lm -lCstd -lCrun

CC = CC

all: amzijni

amzijni: $(FILES) $(HEADERS)
	$(CC) $(I_DIRS) $(L_DIRS) $(C_FLAGS) \
	   -o $(AMZI_DEV_DIR)/lib/libamzijni.so $(FILES)

