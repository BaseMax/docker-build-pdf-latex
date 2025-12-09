FROM texlive/texlive:latest

WORKDIR /work

ARG TEX_FILE="document.tex"
ARG BUILD_FORMAT="pdf"

ENV TEX_FILE=${TEX_FILE}
ENV BUILD_FORMAT=${BUILD_FORMAT}

CMD ["sh", "-c", " \
    case \"$BUILD_FORMAT\" in \
      pdf) latexmk -pdf -interaction=nonstopmode \"$TEX_FILE\" ;; \
      dvi) latexmk -dvi -interaction=nonstopmode \"$TEX_FILE\" ;; \
      ps)  latexmk -ps  -interaction=nonstopmode \"$TEX_FILE\" ;; \
      slides) latexmk -pdf -interaction=batchmode \"$TEX_FILE\" ;; \
      beamer) latexmk -pdf -interaction=nonstopmode \"$TEX_FILE\" ;; \
      clean) latexmk -c \"$TEX_FILE\" ;; \
      *) echo \"Unknown BUILD_FORMAT: $BUILD_FORMAT\" && exit 1 ;; \
    esac \
"]
