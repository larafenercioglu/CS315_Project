/*mars.y*/
%{
  #include <stdio.h>
  #include <stdlib.h>
  extern FILE *yyin;
%}
%token START_GAME END_GAME TRUE FALSE IF ELSEIF ELSE VOID READ WRITE RETURN CONSTANT FOR WHILE CREATE_MAP ADD_ROOM ADD_DOOR CREATE_PLAYER ADD_MINE ADD_ALIEN MOVE MOVE_NORTH MOVE_SOUTH MOVE_EAST MOVE_WEST MOVE_NORTHWEST MOVE_NORTHEAST MOVE_SOUTHEAST MOVE_SOUTHWEST 

%token PICK_NORTH PICK_SOUTH PICK_EAST PICK_WEST PICK_NORTHWEST PICK_NORTHEAST PICK_SOUTHWEST PICK_SOUTHEAST

%token MINE_NORTH  MINE_SOUTH  MINE_EAST MINE_WEST MINE_NORTHWEST MINE_NORTHEAST MINE_SOUTHWEST MINE_SOUTHEAST

%token ATTACK_NORTH ATTACK_SOUTH ATTACK_EAST ATTACK_WEST ATTACK_NORTHWEST ATTACK_NORTHEAST  ATTACK_SOUTHWEST ATTACK_SOUTHEAST

%token GET_ROOM_CONTENTS GET_PLAYER_WEALTH GET_PLAYER_STRENGTH GET_PLAYER_HEALTH IS_PLAYER_DEAD FIGHT_ALIEN EAT_FOOD USE_TOOLS BUY IF_QUIT COMMENT

%token FUNCTION AND OR XOR NOT  INT_TYPE FLOAT_TYPE CHAR_TYPE BOOL_TYPE PTR_TYPE STR_TYPE IDENTIFIER CHAR FLOAT INTEGER STRING 

%token PLUS DIVIDE MULTIPLY MINUS MOD POW EQUALS PLUS_EQUAL MINUS_EQUAL MULTIPLY_EQUAL DIVIDE_EQUAL POW_EQUAL MOD_EQUAL IS_EQUAL IS_NOT_EQUAL LESS_OR_EQUAL GREATER_OR_EQUAL LESS_THAN GREATER_THAN LP RP LSB RSB COMMA SEMICOLON INCREMENT DECREMENT
%left OR
%left AND
%left XOR
%right NOT

%left PLUS MINUS
%left MULTIPLY DIVIDE MOD POW
%left RP LP

%%
program: START_GAME stmts END_GAME {printf("\rInput program is valid.\n");};
stmts: stmt | stmt stmts;
stmt: if_stmt | non_if_stmt | COMMENT;

if_stmt :
	IF LP logical_or_expr RP LSB stmts RSB SEMICOLON
	| IF LP logical_or_expr RP LSB stmts RSB ELSE LSB stmts RSB SEMICOLON;

logical_or_expr: logical_and_expr | logical_or_expr OR logical_and_expr; 
logical_and_expr: logical_xor_expr | logical_and_expr AND logical_xor_expr; 
logical_xor_expr: logical_not_expr| logical_xor_expr XOR logical_not_expr; 
logical_not_expr: relational_expr | NOT logical_not_expr | relational_expr NOT logical_not_expr; 
relational_expr: arithmetic_expr | arithmetic_expr relational_op arithmetic_expr; 
arithmetic_expr: arithmetic_factor | arithmetic_expr PLUS arithmetic_factor | arithmetic_expr MINUS arithmetic_factor; 
arithmetic_factor: arithmetic_term | arithmetic_factor MULTIPLY arithmetic_term | arithmetic_factor DIVIDE arithmetic_term ; 
arithmetic_term: primary_expr | arithmetic_term POW primary_expr | arithmetic_term MOD primary_expr;
primary_expr: IDENTIFIER | literal | func_call | special_func_call | LP logical_or_expr RP; 
  

literal: INTEGER | FLOAT | CHAR | STRING | bool;
bool: TRUE | FALSE;

non_if_stmt: declare SEMICOLON | assign SEMICOLON | declare_assign SEMICOLON  | loop SEMICOLON | func_call SEMICOLON | function_declare  SEMICOLON | io_stmt SEMICOLON | special_func_call SEMICOLON | update_stmt SEMICOLON;

declare: type IDENTIFIER;
type: INT_TYPE | FLOAT_TYPE | CHAR_TYPE | BOOL_TYPE | STR_TYPE | PTR_TYPE;

assign: IDENTIFIER assignment_op logical_or_expr;
assignment_op: EQUALS | PLUS_EQUAL | MINUS_EQUAL | MULTIPLY_EQUAL | DIVIDE_EQUAL |POW_EQUAL | MOD_EQUAL;

relational_op: LESS_OR_EQUAL | GREATER_OR_EQUAL | LESS_THAN | GREATER_THAN | IS_EQUAL | IS_NOT_EQUAL;

func_call: IDENTIFIER LP args RP | IDENTIFIER LP RP;
args: arg | arg COMMA args; 
arg: literal | IDENTIFIER;

declare_assign: constant_declare_assign | declare EQUALS logical_or_expr;
constant_declare_assign: CONSTANT declare EQUALS literal;

loop: for_loop | while_loop;
for_loop: FOR LP for_init SEMICOLON logical_or_expr SEMICOLON for_update RP LSB stmts RSB;
for_init:  for_init COMMA assign | for_init COMMA declare | for_init COMMA declare_assign | declare_assign | assign | declare | ;
for_update: update_stmt | ;
while_loop: WHILE LP logical_or_expr RP LSB stmts RSB;

update_stmt: increment | decrement;
increment: IDENTIFIER INCREMENT | INCREMENT IDENTIFIER;
decrement: IDENTIFIER DECREMENT  | DECREMENT IDENTIFIER;

function_declare: non_void_funtion_declare | void_function_declare;
non_void_funtion_declare: type FUNCTION IDENTIFIER LP parameters RP LSB stmts RETURN return_stmt SEMICOLON RSB  | type FUNCTION IDENTIFIER LP RP LSB stmts RETURN return_stmt SEMICOLON RSB;
parameters: parameter | parameter COMMA parameters;
parameter: declare;
return_stmt: logical_or_expr;
void_function_declare: VOID FUNCTION IDENTIFIER LP parameters RP LSB stmts RSB | VOID FUNCTION IDENTIFIER LP RP LSB stmts RSB;

io_stmt: input_stmt | output_stmt;
input_stmt: READ logical_or_expr;
output_stmt: WRITE logical_or_expr;

special_func_call: CREATE_MAP LP INTEGER RP 
| ADD_ROOM LP INTEGER COMMA INTEGER COMMA INTEGER RP 
| ADD_DOOR LP IDENTIFIER COMMA INTEGER RP
| CREATE_PLAYER LP IDENTIFIER COMMA INTEGER COMMA INTEGER RP
| ADD_MINE LP IDENTIFIER COMMA INTEGER COMMA INTEGER RP
| ADD_ALIEN LP IDENTIFIER COMMA INTEGER COMMA INTEGER RP
| MOVE LP IDENTIFIER COMMA INTEGER COMMA INTEGER RP
| MOVE_NORTH LP RP
| MOVE_SOUTH LP RP
| MOVE_EAST LP RP
| MOVE_WEST LP RP
| MOVE_NORTHWEST LP RP
| MOVE_NORTHEAST LP RP
| MOVE_SOUTHWEST LP RP
| MOVE_SOUTHEAST LP RP
| ATTACK_NORTH LP RP
| ATTACK_SOUTH LP RP
| ATTACK_EAST LP RP
| ATTACK_WEST LP RP
| ATTACK_NORTHWEST LP RP
| ATTACK_NORTHEAST LP RP
| ATTACK_SOUTHWEST LP RP
| ATTACK_SOUTHEAST LP RP
| PICK_NORTH LP RP
| PICK_SOUTH LP RP
| PICK_EAST LP RP
| PICK_WEST LP RP
| PICK_NORTHWEST LP RP
| PICK_NORTHEAST LP RP
| PICK_SOUTHWEST LP RP
| PICK_SOUTHEAST LP RP
| MINE_NORTH LP RP
| MINE_SOUTH LP RP
| MINE_EAST LP RP
| MINE_WEST LP RP
| MINE_NORTHWEST LP RP
| MINE_NORTHEAST LP RP
| MINE_SOUTHWEST LP RP
| MINE_SOUTHEAST LP RP
| GET_ROOM_CONTENTS LP RP
| GET_PLAYER_WEALTH LP RP
| GET_PLAYER_STRENGTH LP RP
| GET_PLAYER_HEALTH LP RP
| IS_PLAYER_DEAD LP RP
| FIGHT_ALIEN LP RP
| EAT_FOOD LP RP
| USE_TOOLS LP IDENTIFIER RP
| BUY LP IDENTIFIER RP
| IF_QUIT LP RP;
%%
#include "lex.yy.c"
int main(){
  return yyparse();
} 
int yyerror(char *s) {
  extern int yylineno; 
  fprintf(stderr,"%s at line: %d with next token: %d!\n", s, yylineno, yychar); 
  printf("\r");
} 









