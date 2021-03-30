%{
  #include <stdio.h>
  #include <stdlib.h>
%}
%option yylineno
digit [0-9]
integer [+-]?[0-9]+
float [+-]?[0-9]?(\.)[0-9]+
alphabetic [A-Za-z_]
alphanumeric ({alphabetic}|{digit})
special_chars [\?!@#\$%\^\&\*\(\)\+=/-\;\'\"\|\{\}\[\]\:\.\,<>~\-]
char \'({alphanumeric}|{special_chars}|" ")?\'
string \"({alphanumeric}|{special_chars}|" "|\\n)*\"
identifier [A-Za-z]+({alphanumeric}|_)*
hash #
comment {hash}([^\n])*

%%
START_GAME return START_GAME;
END_GAME return END_GAME;
TRUE return TRUE;
FALSE return FALSE;
if return IF;
elseif return ELSEIF;
else return ELSE;
void return VOID;
read return READ;
write return WRITE;
return return RETURN;
const return CONSTANT;
for return FOR;
while return WHILE;
CREATE_MAP return CREATE_MAP; 
ADD_ROOM return ADD_ROOM;
ADD_DOOR return ADD_DOOR;
CREATE_PLAYER return CREATE_PLAYER;
ADD_MINE return ADD_MINE;
ADD_ALIEN return ADD_ALIEN;
MOVE return MOVE;
MOVE_NORTH return MOVE_NORTH;
MOVE_SOUTH return MOVE_SOUTH;
MOVE_EAST return MOVE_EAST;
MOVE_WEST return MOVE_WEST;
MOVE_NORTHWEST return MOVE_NORTHWEST;
MOVE_NORTHEAST return MOVE_NORTHEAST;
MOVE_SOUTHWEST return MOVE_SOUTHWEST;
MOVE_SOUTHEAST return MOVE_SOUTHEAST;
ATTACK_NORTH return ATTACK_NORTH;
ATTACK_SOUTH return ATTACK_SOUTH;
ATTACK_EAST return ATTACK_EAST;
ATTACK_WEST return ATTACK_WEST;
ATTACK_NORTHWEST return ATTACK_NORTHWEST;
ATTACK_NORTHEAST return ATTACK_NORTHEAST;
ATTACK_SOUTHWEST return ATTACK_SOUTHWEST;
ATTACK_SOUTHEAST return ATTACK_SOUTHEAST;
PICK_NORTH return PICK_NORTH;
PICK_SOUTH return PICK_SOUTH;
PICK_EAST return PICK_EAST;
PICK_WEST return PICK_WEST;
PICK_NORTHWEST return PICK_NORTHWEST;
PICK_NORTHEAST return PICK_NORTHEAST;
PICK_SOUTHWEST return PICK_SOUTHWEST;
PICK_SOUTHEAST return PICK_SOUTHEAST;
MINE_NORTH return MINE_NORTH;
MINE_SOUTH return MINE_SOUTH;
MINE_EAST return MINE_EAST;
MINE_WEST return MINE_WEST;
MINE_NORTHWEST return MINE_NORTHWEST;
MINE_NORTHEAST return MINE_NORTHEAST;
MINE_SOUTHWEST return MINE_SOUTHWEST;
MINE_SOUTHEAST return MINE_SOUTHEAST;
FIGHT_ALIEN return FIGHT_ALIEN;
GET_ROOM_CONTENTS return GET_ROOM_CONTENTS;
GET_PLAYER_WEALTH return GET_PLAYER_WEALTH;
GET_PLAYER_STRENGTH return GET_PLAYER_STRENGTH;
GET_PLAYER_HEALTH return GET_PLAYER_HEALTH;
IS_PLAYER_DEAD return IS_PLAYER_DEAD;
EAT_FOOD return EAT_FOOD;
USE_TOOLS return USE_TOOLS;
BUY return BUY;
IF_QUIT return IF_QUIT;
{comment} return COMMENT;
func return FUNCTION;
and return AND;
or return OR;
xor return XOR;
not return NOT;
int return INT_TYPE;
float return FLOAT_TYPE;
char return CHAR_TYPE;
bool return BOOL_TYPE;
ptr return PTR_TYPE;
str return STR_TYPE;
{identifier} return IDENTIFIER;
{char} return CHAR; 
{float} return FLOAT; 
{integer} return INTEGER; 
{string} return STRING;
\+ return PLUS;
\/ return DIVIDE;
\* return MULTIPLY;
\- return MINUS;
\% return MOD;
\^ return POW;
\= return EQUALS;
\+\= return PLUS_EQUAL;
\-\= return MINUS_EQUAL;
\*\= return MULTIPLY_EQUAL;
\/\= return DIVIDE_EQUAL;
\^\= return POW_EQUAL;
\%\= return MOD_EQUAL;
\=\= return IS_EQUAL;
!= return IS_NOT_EQUAL;
\<= return LESS_OR_EQUAL;
\>= return GREATER_OR_EQUAL;
\< return LESS_THAN;
\> return GREATER_THAN;
\( return LP;
\) return RP;
\[ return LSB;
\] return RSB;
\, return COMMA;
\; return SEMICOLON;
\+\+ return INCREMENT;
\-\- return DECREMENT;
. ;
%%
int yywrap(){ return 1;}

