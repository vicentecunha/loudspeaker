INSTALLDIR = /usr/share/texmf
INPUTS = $(INSTALLDIR)/tex/latex/delaetex
DOC = $(INSTALLDIR)/doc/latex/delaetex
TEXINPUTS:=$(PWD)/inputs:$(TEXINPUTS)
BIBINPUTS:=$(PWD)/exemplos:$(BIBINPUTS)
BSTINPUTS:=$(PWD)/bst:$(BSTINPUTS)


all:
	make -C exemplos
	@echo
	@echo "Digite \`\`make install'' para instalar o pacote."
	@echo "Por default, os arquivos serao instalados a partir de $(INSTALLDIR)"
	@echo "Pode-se mudar essa configuracao alterando a variavel INSTALLDIR, no Makefile"
	@echo "Isto pode ser feito dititando \`\`make INSTALLDIR=diretorio/desejado install''"
	@echo "Este ultimo comando permite a instalacao sem privilegios de superusuario."

install:
	install -d $(INPUTS) $(DOC)
	cp -R inputs/* $(INPUTS)
	chown -R root.root $(INPUTS)
	mktexlsr
	cp -R exemplos/*.tex exemplos/*.bib exemplos/*.pdf exemplos/*.ps exemplos/*.eps $(DOC)
	cp -a *.txt *.pdf $(DOC)
	chown -R root.root $(DOC)

clean:
	rm -rf *~ inputs/*~
	make -C exemplos clean

distclean: clean
	make -C exemplos distclean

maint-install:
	install -d $(HOME)/pub/delaetex $(HOME)/pub/delaetex/doc
	cp -R inputs/* $(HOME)/pub/delaetex
	cp -R exemplos/* $(HOME)/pub/delaetex/doc
	cp -a *.txt *.pdf $(HOME)/pub/delaetex/doc
	