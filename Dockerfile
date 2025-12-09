FROM texlive/texlive:latest

WORKDIR /work

CMD ["latexmk", "-pdf", "-interaction=nonstopmode", "backend-assignment.tex"]
