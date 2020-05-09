#DEBUG

C_FLAGS =

CC = CC

all: pets pets.xpl

pets: pets.cpp
	$(CC) -I$(AMZI_DIR)/include -L$(AMZI_DIR)/lib $(C_FLAGS) -lamzi -o pets pets.cpp

pets.xpl: pets.pro
	acmp pets
	alnk pets pets
