import java_cup.runtime.*;

%%

%class Scanner
%unicode
%cup
%line
%column

WHITESPACE = [ \t\n\r]+
DIGIT = [0-9]
LETTER = [A-Za-z]
NUMBER = {DIGIT}+(\.{DIGIT}+)? 
IDENTIFIER = {LETTER}({LETTER}|{DIGIT})* 
KW_IF = "if"
KW_ELSE = "else"
KW_WHILE = "while"
KW_RETURN = "return"
KW_INT = "int"
KW_FLOAT = "float"
SINGLE_COMMENT = "//".*
MULTI_COMMENT = "/\\*([^*]|\\*+[^*/])*\\*+/"

%%

<YYINITIAL> {
    {WHITESPACE}          { /* Ignora espaços em branco */ }
    ";"                   { return new Symbol(sym.SEMI); }
    "+"                   { return new Symbol(sym.PLUS); }
    "-"                   { return new Symbol(sym.MINUS); }
    "*"                   { return new Symbol(sym.TIMES); }
    "/"                   { return new Symbol(sym.DIV); }
    "=="                  { return new Symbol(sym.EQ); }
    "!="                  { return new Symbol(sym.NEQ); }
    "{"                   { return new Symbol(sym.LBRACE); }
    "}"                   { return new Symbol(sym.RBRACE); }
    "("                   { return new Symbol(sym.LPAREN); }
    ")"                   { return new Symbol(sym.RPAREN); }
    {KW_IF}               { return new Symbol(sym.KW_IF); }
    {KW_ELSE}             { return new Symbol(sym.KW_ELSE); }
    {KW_WHILE}            { return new Symbol(sym.KW_WHILE); }
    {KW_RETURN}           { return new Symbol(sym.KW_RETURN); }
    {KW_INT}              { return new Symbol(sym.KW_INT); }
    {KW_FLOAT}            { return new Symbol(sym.KW_FLOAT); }
    {IDENTIFIER}          { return new Symbol(sym.IDENTIFIER, yytext()); }
    {NUMBER}              { return new Symbol(sym.NUMBER, Double.parseDouble(yytext())); }
    {SINGLE_COMMENT}      { /* Ignora comentários de linha única */ }
    {MULTI_COMMENT}       { /* Ignora comentários em bloco */ }
    .                     { System.err.println("Caractere inválido: " + yytext()); }
}
