ESSENTIAL = include/tree.o include/semantic.o include/ir.o

parser: main.c syntax.tab.c lex.yy.c $(ESSENTIAL)
	gcc main.c syntax.tab.c $(ESSENTIAL) -lfl -ly -o parser
	
include/tree.o: include/tree.c include/tree.h
	gcc -c include/tree.c -o include/tree.o
	
include/semantic.o: include/semantic.c include/semantic.h
	gcc -c include/semantic.c -o include/semantic.o

include/ir.o: include/ir.c include/ir.h
	gcc -c include/ir.c -o include/ir.o
	
syntax.tab.c: syntax.y
	bison -v -d syntax.y
scanner: main.c lex.yy.c
	gcc main.c lex.yy.c -lfl -o scanner
lex.yy.c: lexical.l
	flex lexical.l
clear:
	rm -f scanner lex.yy.c parser syntax.tab.c syntax.tab.h $(ESSENTIAL)
