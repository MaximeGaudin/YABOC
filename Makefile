COMPILER=clang++
CFLAGS=-g -O2 -ansi -pedantic -Wall -Wextra 
EXEC=yaboc

.SECONDARY:

all: $(EXEC) 

%.hh: %.nw 
	@echo "Extraction : $@..."
	@notangle -R"$* : Header" $< > $@ 

%.cc: %.nw
	@echo "Extraction : $@..."
	@notangle -R"$* : Implementation" $< > $@

bin/%.o: %.cc %.hh
	@echo "Compilation : $@...\n"
	@$(COMPILER) -c $(CFLAGS) -o $@ $< 

$(EXEC): bin/Scanner.o bin/YABOC.o
	@echo "Linking : $@..."
	@$(COMPILER) $(CFLAGS) $^ -o $@

YABOC.pdf: YABOC.nw Scanner.nw Parser.nw Optimizer.nw
	noweave -latex -n $^ > doc/src/generated.tex && cd doc/ && make && cp YABOC.pdf ..

.PHONY: clean mrproper

clean:
	@rm -rf *.cc *.hh
	@rm -rf bin/*.o >/dev/null

mrproper: clean
	@rm -rf *.pdf
	@rm -rf $(EXEC) >/dev/null
