{
	open Parser
}

rule token = parse 
| ['a'-'z''A'-'Z']['a'-'z''A'-'Z']* as identifier { IDENTIFIER(identifier) }
| 'integer' { INT }
| 'boolean' { BOOL }
| 'Array of (integer | boolean)' { TABLEAU }
| 'var (['a'-'z''A'-'Z']['a'-'z''A'-'Z']* as v);' { IDENTIFIER(v) }
| 'if ['a'-'z''A'-'Z']['a'-'z''A'-'Z']* then else ' { COND }
| 'while' { LOOP }
| '+' { ADD }
| '-' { SUB }
| '*' { MULT }
| '/' { DIV }
| '(' { OP }
| ')' { FP }
| 'or' { OU }
| 'and' { ET }
| '>' { SUPSTR }
| '>=' { SUP }
| '<' { INFSTR }
| '<=' { INF }
| '=' { EQ }
| '<>' { NEQ }
| ':=' { AFFECT }