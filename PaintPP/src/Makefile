CC     = g++ -std=c++11 -Wwrite-strings
CXX    = g++ -std=c++11 -Wwrite-strings
LEX    = flex
YACC   = bison -y
YFLAGS = -d
PROGRAM = paintpp

OBJECTS = $(PROGRAM).o lexer.o parse.o

all: $(PROGRAM)

$(PROGRAM): $(OBJECTS)
lexer.o: lexer.l parse.c
parse.o: parse.y
$(PROGRAM).o: $(PROGRAM).cpp

test: input.ppp
	cat input.ppp | ./$(PROGRAM)


clean:
	-rm -f $(OBJECTS)
	-rm -f y.tab.h
	-rm -f parse.c
	-rm -f $(PROGRAM)
