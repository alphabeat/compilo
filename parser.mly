%{
 open Types
%{

%token <string> IDENTIFIER 
%token INT BOOL TABLEAU
%token VAR
%token IF THEN ELSE
%token WHILE DO
%token BEGIN END
%token PLUS MOINS FOIS DIV
%token SUPSTR SUP INFSTR INF EQ NEQ
%token OUVPAR FERPAR
%token OUVCRO FERCRO
%token VRAI FAUX
%token OU ET NOT
%token NAO AFFECT DEUXP POINTV VIRG
%token OUVCOMM FERCOMM

%start main 
%type <program> main 

%nonassoc AFFECT FDL VIRG 
%left PLUS MOINS 
%left FOIS DIV 

%% 

main:
 program EOF { $1 } 
;

program:
	PROGAM var_declaration_list BEGIN END {Program ([$2], [])}

condition:
	IF condition THEN expression ELSE expression { Cond ($4,$2,$6) } 
;

boucle:
	WHILE condition DO expression { Loop ($2,$4) }
;

var_declaration_list:
VARIABLE_DECLARATION var_declaration DEUXP TYPE_INT POINTV { $2 }
;

var_declaration:
 IDENTIFIER VIRG var_declaration { $1::$3 }
 IDENTIFIER { [$1] }
; 