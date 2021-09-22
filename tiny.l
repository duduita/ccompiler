/****************************************************/
/* File: tiny.l                                     */
/* Lex specification for TINY                       */
/* Compiler Construction: Principles and Practice   */
/* Kenneth C. Louden                                */
/****************************************************/

%{
#include "globals.h"
#include "util.h"
#include "scan.h"
/* lexeme of identifier or reserved word */
char tokenString[MAXTOKENLEN+1];
%}
digit       [0-9]
number      {digit}+
letter      [a-zA-Z]
identifier  {letter}+
newline     \n
whitespace  [ \t]+
%%
"else"          {return ELSE;}
"if"            {return IF;}
"int"          {return INT;}
"return"          {return RETURN;}
"void"          {return VOID;}
"while"          {return WHILE;}
"="            {return ASSIGN;}
"=="             {return EQ;}
"!="             {return DIFF;}
"<"             {return LT;}
"<="             {return LTE;}
">"             {return GT;}
">="             {return GTE;}
"+"             {return PLUS;}
"-"             {return MINUS;}
"*"             {return TIMES;}
"/"             {return OVER;}
"("             {return LPAREN;}
")"             {return RPAREN;}
"{"             {return LBRACES;}
"}"             {return RBRACES;}
"["             {return LBRACK;}
"]"             {return RBRACK;}
";"             {return SEMI;}
","             {return COMMA;}
{number}        {return NUM;}
{identifier}    {return ID;}
{newline}       {lineno++;}
{whitespace}    {/* skip whitespace */}
"/*"             { char c;
                  int star = 0;
                  int finish = 0;
                  do
                  { c = input();
                    if (c == EOF) break;
                    if (c == '\n') lineno++;
                    if (c == '*') star = 1;
                    if (c == '/' && star) finish = 1;
                    if (c != '*') star = 0;
                  } while (!finish);
                }
.               {return ERROR;}
%%
TokenType getToken(void)
{ static int firstTime = TRUE;
  TokenType currentToken;
  if (firstTime)
  { firstTime = FALSE;
    lineno++;
    yyin = source;
    yyout = listing;
  }
  currentToken = yylex();
  strncpy(tokenString,yytext,MAXTOKENLEN);
  if (TraceScan) {
    fprintf(listing,"\t%d: ",lineno);
    printToken(currentToken,tokenString);
  }
  return currentToken;
}
