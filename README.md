Boolean Calculator
A simple boolean calculator which features a grammar control.
Installation & Usage
To run it on WSL first install WSL using Part 1, then run Part 2. For Linux-based systems, you can skip to Part 2.
Part 1: Setting up WSL (Windows only)
bashCopy# Install WSL
wsl

# Update package list and install required packages
sudo apt-get update
sudo apt-get install flex bison gcc
Part 2: Building and Running the Calculator
bashCopy# Generate parser
bison -d boolcalc.y

# Generate lexer
flex boolcalc.l

# Compile
gcc -lm boolcalc.tab.c lex.yy.c -o boolcalc

# Run the calculator
./boolcalc
