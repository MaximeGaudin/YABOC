Yet Another Brainfuck Optimizer & Compiler
==========================================

Well... Since the title of the project is a crappy acronym and contains Brainfuck, it's pretty obvious that no real-life goal will be achieved but fun !
I'll try to implement the following modules :

- A Lexer/Parser (Oh my God ! With a one character per instruction, it should not be so difficult...)
- A good model for the language. The best model for a regular language is ... wait for it... a regular expression. But as a researcher in automaton related topics, I'll try to find a better way to store, handle and work with BF expression.
- BF is surprisingly optimizable and some of them are not trivial (for instance, how to write "Hello world!" with the fewest intructions ? Say hello to arithmetic, primality & friends.
- Finally the translator unit, which seems to be the boring part of the project because I will have to translate basic operations into LLVM ByteCode and then compile it.

Well, It's a 40 hours project and I hope I will get at least to the optimization part (the funniest one). 

Contribution
------------
**Any** contribution is welcome and I will be pleased to be contacted through my GitHub account or via pull request !
