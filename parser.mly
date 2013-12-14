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
%token NAO AFFECT FDL VIRG
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

nom_de_la_regle:
 TOKEN1 TOKEN2 autre_regle TOKEN3 { $3 } 
;

autre_regle:
 TOKEN4 TOKEN5 TOKEN6 autre_regle { $4 } 
 | TOKEN7 TOKEN8 { UnType($1) } 
; 