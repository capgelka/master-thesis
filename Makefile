LATEX=latex -interaction=nonstopmode
PDFLATEX=pdflatex -interaction=nonstopmode
DATE=$(shell date +%Y-%m-%d)

master-thesis = master-thesis
PARTS = intro.tex part1.tex conclusion.tex title.tex

$(master-thesis).pdf:$(master-thesis).tex bib $(PARTS)
	$(PDFLATEX) $(master-thesis).tex && evince $(master-thesis).pdf || evince $(master-thesis).pdf

pre-bib: $(master-thesis).tex $(PARTS)
	$(PDFLATEX) $(master-thesis).tex || echo "errors occured"

bib: $(master-thesis).bib $(master-thesis).aux pre-bib
	bibtex master-thesis

$(master-thesis).ps:$(master-thesis).tex
	$(LATEX) $(master-thesis).tex || echo "some errors"

pdf: $(master-thesis).pdf

ps: $(master-thesis).ps

view: pdf
	evince $(master-thesis).pdf


.PHONY: default pdf $(master-thesis).pdf view
default: view

