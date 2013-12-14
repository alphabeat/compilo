%{
 open Types
%{

%token INT 
%token BOOL
%token TABLEAU
%token VAR
%token IF
%token THEN
%token ELSE
%token WHILE
%token DO
%token BEGIN
%token END
%token OP
%token MOINS
%token OUVPAR
%token FERPAR
%token OUVCRO
%token FERCRO
%token VRAI
%token FAUX
%token OU
%token ET
%token NOT
%token NAO
%token AFFECT
%token FDL
%token VIRG
%token OUVCOMM
%token FERCOMM
%token <string> IDENTIFIER 

%start main 
%type <program> main 

%nonassoc FDL
%nonassoc VIRG 
%left PLUS MINUS 
%left TIMES DIV 

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