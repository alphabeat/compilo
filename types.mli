type identifier = string

type t = 
| Int of integer 
| Bool of boolean
| Tableau of t list

type program = 
Program of identifier list * fct_def list * instruction list

type fct_def = 
string * identifier list * identifier list * instruction list

type instruction = 
| Identifiant of string * expression list
| Affect_var of string * expression
| Affect_tab of string * expression * expression
| Cond of instruction * condition * instruction
| Loop of condition * instruction
| Bloc of instruction list

type condition = 
| Expr of expression
| Non of uop * expression
| Ou of expression * expression
| Et of expression * expression
| Parentheses of expression

type expression = 
| Constante of const
| Variable of string
| Moins of expression
| Bop of expression * bop * expression
| Fct of cible * expression list
| Acces_tabl of expression * expression
| Creer_tabl of t * expression

type const = 
| Entier of integer 
| Vrai of boolean 
| Faux of boolean

type uop = 
| Not 

type bop = 
| Add 
| Sub 
| Mult 
| Div 
| Infstr | Inf | Supstr | Sup | Eq | Neq 

type primitives = 
| write
| writeln 
| readln

type cible = 
| p of primitives
| f of fct_def