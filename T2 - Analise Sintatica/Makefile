CC = gcc
LDFLAGS = -g

all: main

main: clean lex.yy.c 
	$(CC) -c node.c
	$(CC) -c lex.yy.c compilador.tab.c
	$(CC) -o analisador node.o lex.yy.o compilador.tab.o main.c 

lex.yy.c: analisador.l tokens.h
	clear
	bison -d compilador.y
	flex analisador.l

clean:
	rm -f *.o lex.yy.?