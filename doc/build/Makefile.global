include build/Makefile.conf
include build/style.conf

COMPILE_SUCCESS=0
COMPILE_FAIL=1
COMPILE=${COMPILE_SUCCESS}

all: check_directory check_git ${BIN_DIRECTORY}${OUTPUT_FILENAME}.pdf clean_latexmk_files

${BIN_DIRECTORY}${OUTPUT_FILENAME}.pdf: ${SRC_DIRECTORY}*.tex ${SRC_DIRECTORY}*.bib 
	@COMPILE=0; \
	echo ${CYAN} "${HEADER}Compilation ..." ${NORMAL}; \
	cd src && latexmk -r ../${BUILD_DIRECTORY}${LATEXMKRC} -f- -silent main.tex || COMPILE=1; \
	if [ $${COMPILE} = 1 ]; then \
		echo ${ROUGE} "${HEADER}La compilation a échouée." ${NORMAL}; \
		echo ${ROUGE} "${HEADER}Liste des erreurs :" ${NORMAL}; \
		grep -E -A7 "^\!" ${INPUT_FILENAME}.log; \
		exit 1; \
	else \
		echo ${VERT} "${HEADER}Compilation effectuée avec succès !" ${NORMAL}; \
		dvips ${INPUT_FILENAME} -o ../${BIN_DIRECTORY}${OUTPUT_FILENAME}.ps; \
		dvipdf ${INPUT_FILENAME} ../${BIN_DIRECTORY}${OUTPUT_FILENAME}.pdf; \
		${CMD_VIEWER} ../${BIN_DIRECTORY}${OUTPUT_FILENAME}.pdf; \
	fi; 

check_git:
	@if [ -d .git ]; then \
		cp ${BUILD_DIRECTORY}/pre-commit .git/hooks/; chmod 774 .git/hooks/pre-commit; \
		if [ ! -e .gitignore ]; then \
			echo ".DS_STORE" >> .gitignore; \
			echo "Makefile" >> .gitignore; \
			echo "*.pdf" >> .gitignore; \
			cat ${BUILD_DIRECTORY}ext.conf >> .gitignore; \
		fi; \
	fi

check_directory:
	@if [ ! -d ${BIN_DIRECTORY} ]; then ${CMD_MKDIR} ${BIN_DIRECTORY}; fi
	@if [ ! -d ${TMP_DIRECTORY} ]; then ${CMD_MKDIR} ${TMP_DIRECTORY}; fi

clean: clean_latexmk_files
	@${CMD_RM} -f ${BIN_DIRECTORY}${OUTPUT_FILENAME}.pdf
	@${CMD_RM} -f ${BIN_DIRECTORY}${OUTPUT_FILENAME}.ps

mrproper: clean
	@${CMD_RM} -f ${BIN_DIRECTORY}*.pdf

clean_latexmk_files:
	@echo ${CYAN} "${HEADER}Cleanup latexmk mess..." ${NORMAL}; \
	EXT=aux && if [ -e ${SRC_DIRECTORY}${INPUT_FILENAME}.$${EXT} ]; then ${CMD_MV} ${SRC_DIRECTORY}${INPUT_FILENAME}.$${EXT} ${TMP_DIRECTORY}; fi;		\
	EXT=glo && if [ -e ${SRC_DIRECTORY}${INPUT_FILENAME}.$${EXT} ]; then ${CMD_MV} ${SRC_DIRECTORY}${INPUT_FILENAME}.$${EXT} ${TMP_DIRECTORY}; fi;		\
	EXT=glg && if [ -e ${SRC_DIRECTORY}${INPUT_FILENAME}.$${EXT} ]; then ${CMD_MV} ${SRC_DIRECTORY}${INPUT_FILENAME}.$${EXT} ${TMP_DIRECTORY}; fi;		\
	EXT=gls && if [ -e ${SRC_DIRECTORY}${INPUT_FILENAME}.$${EXT} ]; then ${CMD_MV} ${SRC_DIRECTORY}${INPUT_FILENAME}.$${EXT} ${TMP_DIRECTORY}; fi;		\
	EXT=ist && if [ -e ${SRC_DIRECTORY}${INPUT_FILENAME}.$${EXT} ]; then ${CMD_MV} ${SRC_DIRECTORY}${INPUT_FILENAME}.$${EXT} ${TMP_DIRECTORY}; fi;		\
	EXT=maf && if [ -e ${SRC_DIRECTORY}${INPUT_FILENAME}.$${EXT} ]; then ${CMD_MV} ${SRC_DIRECTORY}${INPUT_FILENAME}.$${EXT} ${TMP_DIRECTORY}; fi;		\
	EXT=mtc && if [ -e ${SRC_DIRECTORY}${INPUT_FILENAME}.$${EXT} ]; then ${CMD_MV} ${SRC_DIRECTORY}${INPUT_FILENAME}.$${EXT} ${TMP_DIRECTORY}; fi;		\
	EXT=mtc0 && if [ -e ${SRC_DIRECTORY}${INPUT_FILENAME}.$${EXT} ]; then ${CMD_MV} ${SRC_DIRECTORY}${INPUT_FILENAME}.$${EXT} ${TMP_DIRECTORY}; fi;		\
	EXT=log && if [ -e ${SRC_DIRECTORY}${INPUT_FILENAME}.$${EXT} ]; then ${CMD_MV} ${SRC_DIRECTORY}${INPUT_FILENAME}.$${EXT} ${TMP_DIRECTORY}; fi;		\
	EXT=acn && if [ -e ${SRC_DIRECTORY}${INPUT_FILENAME}.$${EXT} ]; then ${CMD_MV} ${SRC_DIRECTORY}${INPUT_FILENAME}.$${EXT} ${TMP_DIRECTORY}; fi;		\
	EXT=idx && if [ -e ${SRC_DIRECTORY}${INPUT_FILENAME}.$${EXT} ]; then ${CMD_MV} ${SRC_DIRECTORY}${INPUT_FILENAME}.$${EXT} ${TMP_DIRECTORY}; fi;		\
	EXT=out && if [ -e ${SRC_DIRECTORY}${INPUT_FILENAME}.$${EXT} ]; then ${CMD_MV} ${SRC_DIRECTORY}${INPUT_FILENAME}.$${EXT} ${TMP_DIRECTORY}; fi;		\
	EXT=ilg && if [ -e ${SRC_DIRECTORY}${INPUT_FILENAME}.$${EXT} ]; then ${CMD_MV} ${SRC_DIRECTORY}${INPUT_FILENAME}.$${EXT} ${TMP_DIRECTORY}; fi;		\
	EXT=ind && if [ -e ${SRC_DIRECTORY}${INPUT_FILENAME}.$${EXT} ]; then ${CMD_MV} ${SRC_DIRECTORY}${INPUT_FILENAME}.$${EXT} ${TMP_DIRECTORY}; fi;		\
	EXT=toc && if [ -e ${SRC_DIRECTORY}${INPUT_FILENAME}.$${EXT} ]; then ${CMD_MV} ${SRC_DIRECTORY}${INPUT_FILENAME}.$${EXT} ${TMP_DIRECTORY}; fi;		\
	EXT=bak && if [ -e ${SRC_DIRECTORY}${INPUT_FILENAME}.$${EXT} ]; then ${CMD_MV} ${SRC_DIRECTORY}${INPUT_FILENAME}.$${EXT} ${TMP_DIRECTORY}; fi;		\
	EXT=tns && if [ -e ${SRC_DIRECTORY}${INPUT_FILENAME}.$${EXT} ]; then ${CMD_MV} ${SRC_DIRECTORY}${INPUT_FILENAME}.$${EXT} ${TMP_DIRECTORY}; fi;		\
	EXT=bbl && if [ -e ${SRC_DIRECTORY}${INPUT_FILENAME}.$${EXT} ]; then ${CMD_MV} ${SRC_DIRECTORY}${INPUT_FILENAME}.$${EXT} ${TMP_DIRECTORY}; fi;		\
	EXT=blg && if [ -e ${SRC_DIRECTORY}${INPUT_FILENAME}.$${EXT} ]; then ${CMD_MV} ${SRC_DIRECTORY}${INPUT_FILENAME}.$${EXT} ${TMP_DIRECTORY}; fi;		\
	EXT=dvi && if [ -e ${SRC_DIRECTORY}${INPUT_FILENAME}.$${EXT} ]; then ${CMD_MV} ${SRC_DIRECTORY}${INPUT_FILENAME}.$${EXT} ${TMP_DIRECTORY}; fi;		\
	EXT=fdb_latexmk && if [ -e ${SRC_DIRECTORY}${INPUT_FILENAME}.$${EXT} ]; then ${CMD_MV} ${SRC_DIRECTORY}${INPUT_FILENAME}.$${EXT} ${TMP_DIRECTORY}; fi;
