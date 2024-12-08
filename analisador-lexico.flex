%%

%class Scanner
%unicode
%cup

%{
    import sym;
%}

digito       = [0-9]
letra        = [A-Za-z]
numero       = {digito}+(\.{digito}+)? 
ident        = {letra}({letra}|{digito})*

KW_IF        = if
KW_ELSE      = else
KW_WHILE     = while
KW_RETURN    = return

OP_ADD       = [+]
OP_SUB       = [-]
OP_MUL       = [*]
OP_DIV       = [/]
OP_EQ        = [==]
OP_NEQ       = [!=]

DEL_SEMI     = [;]
DEL_LBRACE   = [{]
DEL_RBRACE   = [}]
DEL_LPAREN   = [(]
DEL_RPAREN   = [)]

SINGLE_COMMENT = [/] [/] .*
MULTI_COMMENT  = [/] [*] .*? [*] [/]

WHITESPACE = [ \t\n\r]+

%%

<YYINITIAL> {
    {WHITESPACE}          { /**/ }
    {DEL_SEMI}            { return new Symbol(sym.SEMI); }
    {OP_ADD}              { return new Symbol(sym.PLUS); }
    {OP_SUB}              { return new Symbol(sym.MINUS); }
    {OP_MUL}              { return new Symbol(sym.TIMES); }
    {OP_DIV}              { return new Symbol(sym.DIV); }
    {OP_EQ}               { return new Symbol(sym.EQ); }
    {OP_NEQ}              { return new Symbol(sym.NEQ); }
    {DEL_LBRACE}          { return new Symbol(sym.LBRACE); }
    {DEL_RBRACE}          { return new Symbol(sym.RBRACE); }
    {DEL_LPAREN}          { return new Symbol(sym.LPAREN); }
    {DEL_RPAREN}          { return new Symbol(sym.RPAREN); }
    {KW_IF}               { return new Symbol(sym.KW_IF); }
    {KW_ELSE}             { return new Symbol(sym.KW_ELSE); }
    {KW_WHILE}            { return new Symbol(sym.KW_WHILE); }
    {KW_RETURN}           { return new Symbol(sym.KW_RETURN); }
    {ident}               { return new Symbol(sym.IDENTIFIER, yytext()); }
    {numero}              { return new Symbol(sym.NUMBER, Double.parseDouble(yytext())); }
    {SINGLE_COMMENT}      { /**/ }
    {MULTI_COMMENT}       { /**/ }
    .                     { System.err.println("Caractere inválido: " + yytext()); }
}
