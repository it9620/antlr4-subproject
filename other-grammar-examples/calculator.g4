grammar Calc;

@namespace { MyCompany.Calculator }

expr
    :   expr ('*'|'/') expr
    |   expr ('+'|'-') expr
    |   INT
    |   '(' expr ')'
    ;

INT : [0-9]+ ;

WS  : [ \t\r\n]+ -> skip ;
