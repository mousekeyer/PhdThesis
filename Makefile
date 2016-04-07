TEX = pdflatex -shell-escape -interaction=nonstopmode -file-line-error
#PRE =  $(TEX) -ini -job-name="preamble" "&pdflatex preamble.tex\dump"
BIB = bibtex

.PHONY: all view

all : ./Thesis.pdf

view :
	    open Thesis.pdf

Thesis.pdf : Thesis.tex Thesis.bbl Thesis.blg
	    $(TEX) Thesis.tex

Thesis.bbl Thesis.blg : Bibliography.bib Thesis.aux
	    $(BIB) Thesis

Thesis.aux : Thesis.tex
	    $(TEX) Thesis.tex

Thesis.bib : Thesis.tex
	    $(TEX) Thesis.tex

#preamble.fmt : preamble.tex
#	    $(PRE) preamble.tex
