# Laboratórios de CTC-17 (Compiladores)
Este repositório servirá como um compilado de todos os laboratórios feitos ao longo do curso.
### Laboratório 01 - Lexical Analyser
1. Install flex using:
```shell
$ sudo apt-get update
$ sudo apt-get install flex
```
2. Compile using:
```shell
$ flex tiny.l && gcc -c *.c && gcc -o tiny *.o -lfl
```
**NOTE**: On macOS may work with `-ll` instead of `-lfl`

3. Execute the lexical analyser with:
```shell
$ ./tiny fat.c
```
