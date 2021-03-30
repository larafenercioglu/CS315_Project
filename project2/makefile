parser: y.tab.c lex.yy.c
	gcc -o parser y.tab.c
y.tab.c: CS315s21_team9.yacc
	yacc CS315s21_team9.yacc
lex.yy.c: CS315s21_team9.lex
	lex CS315s21_team9.lex
clean:
	rm -f lex.yy.c y.tab.c parser