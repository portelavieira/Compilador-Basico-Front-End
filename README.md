# Compilador-Basico
Trabalho de Av3 para cadeira de Aspectos Teóricos da Computação

## Analisador Lexico 

**Comandos de teste:**
- jflex analisador-lexico.flex (Para criar o arquivo .java)
- java -jar .\lib\jflex-full-1.9.1.jar analisador-lexico.flex (Para criar o arquivo .java~)
- javac Scanner.java (Para indicar o arquivo .java de uso)
- java Scanner input.txt (Iniciar o arquivo .java com os inputs do txt)

> [!WARNING]
> Sempre vericificar o caminho em que se está fazendo os comandos. Utilize `cd <caminho-da-pasta-Analisador-Lexico>`


## Analisador Sintatico
java -jar .\lib\java-cup-11b.jar -parser parser -symbols sym analisador-sintatico.cup
