%{
	open Types
	%{

		%token PROGRAM FONCTION PROCEDURE
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
		PROGRAM var_declaration_list BEGIN END { Program ([$2], []) }

		var_declaration_list:
		VAR var_declaration DEUXP INT POINTV { $2 }
		;

		var_declaration:
		IDENTIFIER VIRG var_declaration { $1::$3 }
		IDENTIFIER { [$1] }
		; 

		fonction:
		FONCTION IDENTIFIER OUVPAR environnement FERPAR DEUXP INT POINTV BEGIN END { Fct ($2,[$4],[],[]) }
		;

		procedure:
		PROCEDURE IDENTIFIER OUVPAR environnement FERPAR POINTV BEGIN END { }

		environnement:
		;

		instr_conditionnelle:
		IF expression THEN expression ELSE expression { Cond ($4,$2,$6) } 
		;

		instr_boucle:
		WHILE expression DO expression { Loop ($2,$4) }
		;

		expression:
		INT { Constante ($1) }
		| VRAI { Constante ($1) }
		| FAUX { Constante ($1) }
		| IDENTIFIER { Variable ($1) }
		| MOINS expression { Moins ($2) }
		| expression PLUS expression { Bop ($1,$2,$3) }
		| expression MOINS expression { Bop ($1,$2,$3) }
		| expression FOIS expression { Bop ($1,$2,$3) }
		| expression DIV expression { Bop ($1,$2,$3) }
		| expression INFSTR expression { Bop ($1,$2,$3) }
		| expression INF expression { Bop ($1,$2,$3) }
		| expression SUPSTR expression { Bop ($1,$2,$3) }
		| expression SUP expression { Bop ($1,$2,$3) }
		| expression EQ expression { Bop ($1,$2,$3) }
		| expression NEQ expression { Bop ($1,$2,$3) }
		| IDENTIFIER OUVPAR expression_list FERPAR { Fct ($1,$2) }
		| expression OUVCRO expression FERCRO { Acces_tabl ($1,$3) }
		| NAO type OUVCRO expression FERCRO { Creer_tabl ($2,$3) }

		instr_bloc:
		BEGIN instructions_list END {  }