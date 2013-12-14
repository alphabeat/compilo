{
	open Parser
}

rule token = parse 
| 'if' { Cond }
| 'while [] do []' { Loop }
| '+' { Add }
| '-' { Sub }
| '*' { Mult }
| '/' { Div }
| 'or' { Ou }
| 'and' { Et }
| 