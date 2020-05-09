#DEBUG

FILES = chello.cpp main.cpp

C_FLAGS = -D_CONSOLE

CC = CC

all: chello hello.xpl

chello: $(FILES)
	$(CC) -I$(AMZI_DIR)/include -L$(AMZI_DIR)/lib $(C_FLAGS) -lamzi -o chello $(FILES)

hello.xpl: hello.pro
	acmp hello
	alnk hello hello
