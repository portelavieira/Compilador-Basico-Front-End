%%
%class Scanner
%unicode
%cup

// Definição de padrões básicos
digito       = [0-9]
letra        = [A-Za-z]
numero       = {digito}+(\.{digito}+)? 
ident        = {letra}({letra}|{digito})*

// Palavras-chave
KW_IF        = "if"
KW_ELSE      = "else"
KW_WHILE     = "while"
KW_INT       = "int"
KW_FLOAT     = "float"
KW_STRING    = "string"

// Operadores
OP_ADD       = "+"
OP_SUB       = "-"
OP_MUL       = "*"
OP_DIV       = "/"
OP_EQ        = "="
OP_NEQ       = "!="
OP_GT        = ">"
OP_LT        = "<"

// Delimitadores
DEL_SEMI     = ";"
DEL_LBRACE   = "{"
DEL_RBRACE   = "}"
DEL_LPAREN   = "("
DEL_RPAREN   = ")"

%%

<YYINITIAL> {
    // Palavras-chave
    {KW_IF}               { return new java_cup.runtime.Symbol(sym.KW_IF); }
    {KW_ELSE}             { return new java_cup.runtime.Symbol(sym.KW_ELSE); }
    {KW_WHILE}            { return new java_cup.runtime.Symbol(sym.KW_WHILE); }
    {KW_INT}              { return new java_cup.runtime.Symbol(sym.KW_INT); }
    {KW_FLOAT}            { return new java_cup.runtime.Symbol(sym.KW_FLOAT); }
    {KW_STRING}           { return new java_cup.runtime.Symbol(sym.KW_STRING); }

    // Operadores
    {OP_ADD}              { return new java_cup.runtime.Symbol(sym.PLUS); }
    {OP_SUB}              { return new java_cup.runtime.Symbol(sym.MINUS); }
    {OP_MUL}              { return new java_cup.runtime.Symbol(sym.TIMES); }
    {OP_DIV}              { return new java_cup.runtime.Symbol(sym.DIV); }
    {OP_EQ}               { return new java_cup.runtime.Symbol(sym.EQ); }
    {OP_NEQ}              { return new java_cup.runtime.Symbol(sym.NEQ); }
    {OP_GT}               { return new java_cup.runtime.Symbol(sym.GT); }
    {OP_LT}               { return new java_cup.runtime.Symbol(sym.LT); }

    // Delimitadores
    {DEL_SEMI}            { return new java_cup.runtime.Symbol(sym.SEMI); }
    {DEL_LBRACE}          { return new java_cup.runtime.Symbol(sym.LBRACE); }
    {DEL_RBRACE}          { return new java_cup.runtime.Symbol(sym.RBRACE); }
    {DEL_LPAREN}          { return new java_cup.runtime.Symbol(sym.LPAREN); }
    {DEL_RPAREN}          { return new java_cup.runtime.Symbol(sym.RPAREN); }

    // Identificadores e números
    {ident}               { return new java_cup.runtime.Symbol(sym.IDENTIFIER, yytext()); }
    {numero}              { return new java_cup.runtime.Symbol(sym.NUMBER, yytext()); }

    // Espaços em branco e comentários
    [ \t\r\n]+            { /* Ignorar espaços em branco */ }
    "//".*                { /* Ignorar comentários de linha */ }
    "/*"[^*]*"*"([^/]|"[^*]"[^/])*"/" { /* Ignorar comentários multi-linha */ }

    // Caracteres inválidos
    .                     { System.err.println("Caractere inválido: " + yytext()); }
}
