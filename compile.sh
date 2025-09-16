#!/bin/bash

# Compilation script for University of Edinburgh thesis template
# This template requires LuaLaTeX due to fontspec package

echo "Compiling University of Edinburgh thesis..."

# Clean previous build artifacts
echo "Cleaning previous build files..."
rm -f main.aux main.out main.toc main.bbl main.log main.fls main.fdb_latexmk main.synctex.gz

# First LaTeX run
echo "Running LuaLaTeX (pass 1/3)..."
lualatex -interaction=nonstopmode main.tex

# Run BibTeX for bibliography
echo "Processing bibliography..."
bibtex main

# Second LaTeX run (resolve citations)
echo "Running LuaLaTeX (pass 2/3)..."
lualatex -interaction=nonstopmode main.tex

# Third LaTeX run (resolve cross-references)
echo "Running LuaLaTeX (pass 3/3)..."
lualatex -interaction=nonstopmode main.tex

echo "Compilation complete! Check main.pdf"
echo ""
echo "If you encounter errors:"
echo "1. Make sure you have LuaLaTeX installed"
echo "2. Check main.log for detailed error messages"
echo "3. Ensure all image files exist in the figures/ directory"