A simple boolean calculator which features a grammar control

To run it on WSL first install WSL using part 1 then run part 2, for Linux based systems you can skip to part 2.
1. To run it on windows WSL:
Install WSL:
wsl
sudo apt-get update
sudo apt-get install flex bison gcc

2. Run on a linux system
bison -d boolcalc.y  
flex boolcalc.l 
gcc -lm boolcalc.tab.c lex.yy.c -o boolcalc 
./boolcalc
