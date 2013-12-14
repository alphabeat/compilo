{
	open Parser
}

rule token = parse 
| ['a'-'z''A'-'Z']['a'-'z''A'-'Z']* as identifier { IDENTIFIER(identifier) }
| "integer" { INT }
| "boolean" { BOOL }
| "Array of (integer | boolean)" { TABLEAU }
| "var" { VAR }
| "if" { IF }
| "then" { THEN }
| "else" { ELSE }
| "while" { WHILE }
| "do" { DO }
| "begin" { BEGIN }
| "end" { END }
| '+' { PLUS }
| '-' { MOINS }
| '*' { FOIS } 
| '/' { DIV } 
| '>' { SUPSTR }
| ">=" { SUP }
| '<' { INFSTR }
| "<=" { INF }
| '=' { EQ }
| "<>" { NEQ }
| '(' { OUVPAR }
| ')' { FERPAR }
| '[' { OUVCRO }
| ']' { FERCRO }
| "true" { VRAI }
| "false" { FAUX }
| "or" { OU }
| "and" { ET }
| "not" { NOT }
| "new array of" { NAO }
| ":=" { AFFECT }
| ':' { FDL }
| ';' { FDL }
| ',' { VIRG }
| '{' { OUVCOMM }
| '}' { FERCOMM }