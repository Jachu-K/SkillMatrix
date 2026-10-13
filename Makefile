.PHONY: all diagrams slides clean

all: diagrams slides

diagrams:
	cd docs/diagrams && plantuml -tpng -o png *.puml

slides: diagrams
	cd presentation && pdflatex -interaction=nonstopmode slides.tex && pdflatex -interaction=nonstopmode slides.tex

clean:
	cd presentation && rm -f *.aux *.log *.nav *.out *.snm *.toc *.vrb
