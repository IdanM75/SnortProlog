#DEBUG

C_FLAGS = 

CC = CC

all: petscb pets.xpl

petscb: petscb.cpp
	$(CC) -I$(AMZI_DIR)/include -L$(AMZI_DIR)/lib $(C_FLAGS) -lamzi -o petscb petscb.cpp

pets.xpl: pets.pro
	acmp pets
	alnk pets pets
