%option main
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
START_GAME printf("STARTGAME ");
END_GAME printf("ENDGAME ");
TRUE printf("TRUE ");
FALSE printf("FALSE ");
if printf("IF ");
else printf("ELSE ");
void printf("VOID ");
read printf("READ ");
write printf("WRITE ");
return printf("RETURN ");
const printf("CONSTANT ");
for printf("FOR ");
while printf("WHILE ");
CREATE_MAP printf("CREATE_MAP "); 
ADD_ROOM printf("ADD_ROOM ");
ADD_DOOR printf("ADD_DOOR ");
CREATE_PLAYER printf("CREATE_PLAYER ");
ADD_TREASURE printf("ADD_TREASURE ");
ADD_MONSTER printf("ADD_MONSTER ");
MOVE printf("MOVE ");
GET_ROOM_CONTENTS_MONSTER printf("GET_ROOM_CONTENTS_MONSTER ");
GET_ROOM_CONTENTS_TREASURE printf("GET_ROOM_CONTENTS_TREASURE ");
GET_PLAYER_WEALTH printf("GET_PLAYER_WEALTH ");
GET_PLAYER_STRENGTH printf("GET_PLAYER_STRENGTH ");
GET_PLAYER_HEALTH printf("GET_PLAYER_HEALTH ");
IS_PLAYER_DEAD printf("IS_PLAYER_DEAD ");
GET_CURRENT_ROOM printf("GET_CURRENT_ROOM ");
PICK_TREASURE printf("PICK_TREASURE ");
FIGHT_MONSTER printf("FIGHT_MONSTER ");
EAT_FOOD printf("EAT_FOOD ");
USE_TOOLS printf("USE_TOOLS ");
BUY printf("BUY ");
IF_QUIT printf("IF_QUIT ");
{comment} printf("COMMENT ");
and printf("AND ");
or printf("OR ");
not printf("NOT ");
int printf("INT_TYPE ");
float printf("FLOAT_TYPE ");
char printf("CHAR_TYPE ");
bool printf("BOOL_TYPE ");
ptr printf("PTR_TYPE ");
str printf("STR_TYPE ");
{identifier} printf("IDENTIFIER ");
{char} printf("CHAR "); 
{float} printf("FLOAT "); 
{integer} printf("INTEGER "); 
{string} printf("STRING ");
\+ printf("PLUS ");
\/ printf("DIVIDE ");
\* printf("MULTIPLY ");
\- printf("MINUS ");
\% printf("MOD ");
\^ printf("POW ");
\= printf("EQUALS ");
\+\= printf("PLUS_EQUAL ");
\-\= printf("MINUS_EQUAL ");
\*\= printf("MULTIPLY_EQUAL ");
\/\= printf("DIVIDE_EQUAL ");
\^\= printf("POW_EQUAL ");
\%\= printf("MOD_EQUAL ");
\=\= printf("IS_EQUAL ");
!= printf("IS_NOT_EQUAL ");
\<= printf("LESS_OR_EQUAL ");
\>= printf("GREATER_OR_EQUAL ");
\< printf("LESS_THAN ");
\> printf("GREATER_THAN ");
\( printf("LP ");
\) printf("RP ");
\[ printf("LSB ");
\] printf("RSB ");
\, printf("COMMA ");
\n printf("\n");
\; printf("SEMICOLON ");
\+\+ printf("INCREMENT ");
\-\- printf("DECREMENT ");
. ;

