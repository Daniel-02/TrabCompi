import java_cup.runtime.*;

%%

%cupdebug
%class LexicalAnalyzer
%line
%column
%cupsym Sym
%cup

LineTerminator = \r|\n|\r\n
InputCharacter = [^\r\n]
WhiteSpace = {LineTerminator} | [ \t\f]
EndOfLineComment = "//" {InputCharacter}* {LineTerminator}?
TraditionalComment = "/*" [^*] ~"*/" | "/*" "*"+ "/"
IntegerLiteral = 0 | [1-9][0-9]*
Identifier = [a-zA-Z][a-zA-Z0-9_]*

%%

"if"                                            { return new Symbol(Sym.IF);}
"then"                                          { return new Symbol(Sym.THEN);}
"else"                                          { return new Symbol(Sym.ELSE);}
"def"                                           { return new Symbol(Sym.DEF);}

/* arithmetic operators */
"*"							   { return new Symbol(Sym.MULT);}
"/"							   { return new Symbol(Sym.DIV);}
"+"							   { return new Symbol(Sym.PLUS);}
"-"							   { return new Symbol(Sym.MINUS);}
	
	
	
	
/* comparison operators */
"<"							   { return new Symbol(Sym.LESSTHAN); }
">"							   { return new Symbol(Sym.MORETHAN); }
"=="							   { return new Symbol(Sym.EQUALTO); }
	
		
/* additional symbols */
","						       { return new Symbol(Sym.COMMA); }
";"						       { return new Symbol(Sym.SEMICOLON); }
"("						       { return new Symbol(Sym.LEFTPAREN); }
")"						       { return new Symbol(Sym.RIGHTPAREN); }
"="         					       { return new Symbol(Sym.ASSIGNMENT);}

/* literals */
{IntegerLiteral}			               { return new Symbol(Sym.INTEGER); }

/* identifiers */
{Identifier}				               { return new Symbol(Sym.IDENTIFIER); }

/* comments */
{TraditionalComment}                                   { /* ignore */ }
{EndOfLineComment}			               { /* ignore */ }
	
/* whitespace */
{WhiteSpace}                                           { /* ignore */ }


/* error fallback */
[^]                                                    { throw new RuntimeException("Caractere inválido " + yytext() + " na linha " + (yyline+1) + ", coluna " +(yycolumn+1)); }
