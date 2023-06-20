

all: main

main: clean lex.yy.c 
	gcc -c node.c
	gcc -c lex.yy.c compilador.tab.c
	gcc -o compilador node.o lex.yy.o compilador.tab.o main.c 

lex.yy.c: analisador.l tokens.h
	clear
	bison -d compilador.y
	flex analisador.l

clean:
	rm -f *.o lex.yy.?