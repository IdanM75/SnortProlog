.SUFFIXES: .plm .pro

OBJECTS = duck1.plm duck2.plm

.pro.plm:
	acmp $<

ducks.xpl: $(OBJECTS)
	alnk ducks $(OBJECTS)
