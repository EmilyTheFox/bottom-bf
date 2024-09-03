# Bottom-BF

Bottom encoder & decoder in brainfuck. Yep, I was bored.
Spec: https://github.com/bottom-software-foundation/spec

## Requirements

Simply have nodejs installed. Of course you can use any other brainfuck interpreter as well, you don't have to use the one in this repo. But most interpreters only read the brainfuck output as ascii and not as UTF-8 so we can't print emojis D:

## How to use

In your commandline run `node brainfuck.js encode.bf Your string to encode` 
or `node brainfuck.js decode.bf 💖✨✨✨🥺,,👉👈`

(Brainfuck will just read this string out one by one like normal but for user experience
you can give the entire string at once instead of typing it out while the program is running)