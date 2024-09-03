# Bottom-BF

Bottom encoder & decoder in brainfuck. Yep, I was bored.

## Requirements

Simply have python installed. This should work in Python 3. Of course you can use any other brainfuck interpreter as well, you don't have to use the one in this repo.

## How to use

In your commandline run `py brainfuck.py encode.bf` 
or `py brainfuck.py decode.bf`

and then give your input string one character at a time
the max length for inputs is set up on line 1 of these files
you can stop your input early by pressing enter aka ascii code 13
I couldnt be bothered making it check for other exits like code 10 for line feed

## Credits 

Brainfuck interpreter code (the python part of this repo) has been taken from https://github.com/pocmo/Python-Brainfuck under the "DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE." license. Ty Sebastian 💖 I couldn't be bothered to write my own interpreter
