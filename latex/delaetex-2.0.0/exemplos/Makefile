BIBINPUTS:=:
BSTINPUTS:=../bst:$(BSTINPUTS):
TEXINPUTS:=../inputs:$(TEXINPUTS):

all: doc

doc: 	delaetex.ps delaetex.pdf \
	delaeletter.ps delaeletter.pdf \
	spf.ps spf.pdf \
	modeloseminario.ps modeloseminario.pdf \
	modeloppgee2003revisada.ps modeloppgee2003revisada.pdf \
	presentation.pdf presentation1.pdf presentation2.pdf presentation3.pdf \
	delaearticle.ps delaearticle.pdf \
	plan.ps plan.pdf

delaetex.ps: delaetex.dvi
	dvips delaetex

delaetex.pdf: delaetex.dvi
	dvipdf delaetex

delaetex.dvi: delaetex.tex delaetex.aux delaetex.bbl fig.eps ../inputs/*
	latex delaetex
	latex delaetex

delaetex.aux: delaetex.tex
	latex delaetex

delaetex.bbl: exemplo.bib
	bibtex delaetex
	latex delaetex

delaeletter.ps: delaeletter.dvi
	dvips delaeletter

delaeletter.pdf: delaeletter.dvi
	dvipdf delaeletter

delaeletter.dvi: delaeletter.tex delaeletter.aux ../inputs/*
	latex delaeletter
	latex delaeletter

delaeletter.aux: delaeletter.tex
	latex delaeletter
	
spf.ps: spf.dvi
	dvips spf

spf.pdf: spf.dvi
	dvipdf spf

spf.dvi: spf.tex spf.aux ../inputs/*
	latex spf
	latex spf

spf.aux: spf.tex
	latex spf.tex

plan.ps: plan.dvi
	dvips plan

plan.pdf: plan.dvi
	dvipdf plan

plan.dvi: plan.tex plan.aux plan.bbl ../inputs/*
	latex plan
	latex plan

plan.aux: plan.tex
	latex plan.tex	

plan.bbl: plan.bib
	bibtex plan
	latex plan

modeloseminario.ps: modeloseminario.dvi
	dvips modeloseminario

modeloseminario.pdf: modeloseminario.dvi
	dvipdf modeloseminario

modeloseminario.dvi: modeloseminario.tex modeloseminario.aux modeloseminario.bbl fe.eps ../inputs/*
	latex modeloseminario
	latex modeloseminario

modeloseminario.aux: modeloseminario.tex
	latex modeloseminario

modeloseminario.bbl: modelo.bib
	bibtex modeloseminario
	latex modeloseminario

modeloppgee2003revisada.ps: modeloppgee2003revisada.dvi
	dvips modeloppgee2003revisada

modeloppgee2003revisada.pdf: modeloppgee2003revisada.dvi
	dvipdf modeloppgee2003revisada

modeloppgee2003revisada.dvi: modeloppgee2003revisada.tex modeloppgee2003revisada.aux modeloppgee2003revisada.bbl motor.eps eco.eps ../inputs/*
	latex modeloppgee2003revisada
	latex modeloppgee2003revisada

modeloppgee2003revisada.aux: modeloppgee2003revisada.tex
	latex modeloppgee2003revisada

modeloppgee2003revisada.bbl: modeloppgee2003revisada.bib
	bibtex modeloppgee2003revisada
	latex modeloppgee2003revisada

presentation.ps: presentation.dvi
	dvips presentation

presentation.pdf: presentation.ps
	ps2pdf -sPAPERSIZE=a4 presentation.ps

presentation.dvi: presentation.tex presentation.aux ../inputs/*
	latex presentation
	latex presentation

presentation.aux: presentation.tex
	latex presentation

presentation1.ps: presentation1.dvi
	dvips presentation1

presentation1.pdf: presentation1.ps
	ps2pdf -sPAPERSIZE=a4 presentation1.ps

presentation1.dvi: presentation1.tex presentation1.aux ../inputs/*
	latex presentation1
	latex presentation1

presentation1.aux: presentation1.tex
	latex presentation1

presentation2.ps: presentation2.dvi
	dvips presentation2

presentation2.pdf: presentation2.ps
	ps2pdf -sPAPERSIZE=a4 presentation2.ps

presentation2.dvi: presentation2.tex presentation2.aux ../inputs/*
	latex presentation2
	latex presentation2

presentation2.aux: presentation2.tex
	latex presentation2

presentation3.ps: presentation3.dvi
	dvips presentation3

presentation3.pdf: presentation3.ps
	ps2pdf -sPAPERSIZE=a4 presentation3.ps

presentation3.dvi: presentation3.tex presentation3.aux ../inputs/*
	latex presentation3
	latex presentation3

presentation3.aux: presentation3.tex
	latex presentation3

delaearticle.ps: delaearticle.dvi
	dvips delaearticle

delaearticle.pdf: delaearticle.dvi
	dvipdf delaearticle

delaearticle.dvi: delaearticle.tex delaearticle.aux ../inputs/*
	latex delaearticle
	latex delaearticle

delaearticle.aux: delaearticle.tex
	latex delaearticle

clean:
	rm -rf *.aux *.bbl *.blg *.lof *.log *.lot *.log *.toc *~ *.out

distclean: clean
	rm -rf *.pdf *.dvi *.ps
