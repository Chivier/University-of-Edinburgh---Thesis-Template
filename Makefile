# Makefile for University of Edinburgh Thesis Template
# This template requires LuaLaTeX

# Main document name
MAIN = main

# Build the PDF
all: $(MAIN).pdf

# Compile with LuaLaTeX
$(MAIN).pdf: $(MAIN).tex
	lualatex -interaction=nonstopmode $(MAIN).tex
	bibtex $(MAIN)
	lualatex -interaction=nonstopmode $(MAIN).tex
	lualatex -interaction=nonstopmode $(MAIN).tex

# Clean auxiliary files
clean:
	rm -f *.aux *.bbl *.blg *.log *.out *.toc *.lof *.lot
	rm -f *.fls *.fdb_latexmk *.synctex.gz *.synctex.gz\(busy\)
	rm -f *.nav *.snm *.vrb
	rm -f *.idx *.ilg *.ind
	rm -f *.acn *.acr *.alg *.glg *.glo *.gls
	rm -f *.bcf *.run.xml
	rm -f chapters/*.aux

# Clean everything including PDF
distclean: clean
	rm -f $(MAIN).pdf

# Force rebuild
rebuild: clean all

.PHONY: all clean distclean rebuild