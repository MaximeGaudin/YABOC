COMPILER=clang++
CFLAGS=-I./ -g -O2 -pedantic -Wall -Wextra -Weffc++
EXEC=yaboc

.SECONDARY:

all: $(EXEC) 

%.hh: %.nw 
	@echo "Extracting : $@..."
	@notangle -R"$* : Header" $< > $@ 

%.cc: %.nw
	@echo "Extracting : $@..."
	@notangle -R"$* : Implementation" $< > $@

bin/%.o: %.cc %.hh
	@echo "Compiling : $@...\n"
	@$(COMPILER) -c $(CFLAGS) -o $@ $< 

# NODES --------------------------------------------------
nodes/%.hh: Parser.nw 
	@echo "Extracting : $@..."
	@notangle -R"$* : Header" $< > $@ 

nodes/%.cc: Parser.nw
	@echo "Extracting : $@..."
	@notangle -R"$* : Implementation" $< > $@

bin/nodes/%.o: nodes/%.cc nodes/%.hh
	@echo "Compiling : $@...\n"
	@$(COMPILER) -c $(CFLAGS) -o $@ $< 
#---------------------------------------------------------

$(EXEC): bin/Scanner.o bin/nodes/Node.o bin/nodes/ArithmeticNode.o bin/YABOC.o
	@echo "Linking : $@..."
	@$(COMPILER) $(CFLAGS) $^ -o $@

YABOC.pdf: YABOC.nw Scanner.nw Parser.nw Optimizer.nw
	noweave -latex -n $^ > doc/src/generated.tex && cd doc/ && make && cp YABOC.pdf ..

.PHONY: clean mrproper

clean:
	@rm -rf *.cc *.hh nodes/*.cc nodes/*.hh >/dev/null
	@rm -rf bin/*.o bin/nodes/*.o >/dev/null

mrproper: clean
	@rm -rf *.pdf
	@rm -rf $(EXEC) >/dev/null
