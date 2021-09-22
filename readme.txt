Compile with:
`flex tiny.l && gcc -c *.c && gcc -o tiny *.o -lfl`
NOTE: On macOS may work with `-ll` instead of `-lfl`

Execute the lexical analyser with:
`./tiny fat.c`