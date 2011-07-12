COMPILER=clang++
CFLAGS=-I./ -g -O2 -pedantic -Wall -Wextra -Weffc++
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

$(EXEC): bin/Scanner.o bin/Node.o bin/ArithmeticNode.o bin/YABOC.o
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

#-------------------------------------------------------------------------------------------
Node.cc: Parser.nw
	@echo "Extraction : $@..."
	@notangle -R"$* : Implementation" $< > $@
Node.hh: Parser.nw
	@echo "Extraction : $@..."
	@notangle -R"Node : Header" $< > $@ 

ArithmeticNode.cc: Parser.nw
	@echo "Extraction : $@..."
	@notangle -R"$* : Implementation" $< > $@
ArithmeticNode.hh: Parser.nw
	@echo "Extraction : $@..."
	@notangle -R"ArithmeticNode : Header" $< > $@ 
