%%
%standalone
%line
%column

// Definições de padrões
digito = [0-9]
letra = [A-Za-z]
numero = {digito}+(\.{digito}+)? 
ident = {letra}({letra}|{digito})*
KW_IF = if
KW_ELSE = else
KW_WHILE = while
KW_RETURN = return
OP_ADD = [+]
OP_SUB = [-]
OP_MUL = [*]
OP_DIV = [/]
OP_EQ = [==]
OP_NEQ = [!=]
DEL_SEMI = [;]
DEL_COMMA = [,]
DEL_LBRACE = [{]
DEL_RBRACE = [}]
DEL_LPAREN = [(]
DEL_RPAREN = [)]
SINGLE_COMMENT = "//".*
MULTI_COMMENT = "/\\*".*?"\\*/"

%%
// Tokens
{KW_IF} {System.out.println("<KW_IF>");}
{KW_ELSE} {System.out.println("<KW_ELSE>");}
{KW_WHILE} {System.out.println("<KW_WHILE>");}
{KW_RETURN} {System.out.println("<KW_RETURN>");}
{ident} {System.out.println("<ident: "+yytext()+">");}
{numero} {System.out.println("<numero: "+yytext()+">");}
{OP_ADD} {System.out.println("<OP_ADD>");}
{OP_SUB} {System.out.println("<OP_SUB>");}
{OP_MUL} {System.out.println("<OP_MUL>");}
{OP_DIV} {System.out.println("<OP_DIV>");}
{OP_EQ} {System.out.println("<OP_EQ>");}
{OP_NEQ} {System.out.println("<OP_NEQ>");}
{DEL_SEMI} {System.out.println("<DEL_SEMI>");}
{DEL_COMMA} {System.out.println("<DEL_COMMA>");}
{DEL_LBRACE} {System.out.println("<DEL_LBRACE>");}
{DEL_RBRACE} {System.out.println("<DEL_RBRACE>");}
{DEL_LPAREN} {System.out.println("<DEL_LPAREN>");}
{DEL_RPAREN} {System.out.println("<DEL_RPAREN>");}
{SINGLE_COMMENT} {System.out.println("<SINGLE_COMMENT>");}
{MULTI_COMMENT} {System.out.println("<MULTI_COMMENT>");}

// Ignorar espaços e novas linhas
[ \t\n\r]+ { /* Ignorar */ }

// Qualquer outro caractere
. {System.out.println("<ERRO: "+yytext()+">");}
