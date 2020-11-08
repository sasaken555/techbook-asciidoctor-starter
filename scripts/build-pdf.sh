#!/bin/bash -e

CURRENT_PATH=`pwd`
#ASCIIDOCTOR_PDF_DIR=`gem contents asciidoctor-pdf --show-install-dir`
ASCIIDOCTOR_PDF_DIR=`bundle info asciidoctor-pdf --path`

echo ">> Converting AsciiDoc to PDF..."

# Use default theme and fonts w/ Japanese fallback.
asciidoctor-pdf -B ${CURRENT_PATH}/ \
  -r asciidoctor-pdf-cjk \
  -a scripts=cjk \
  -a pdf-style=default-with-fallback-font-theme.yml \
  -a pdf-stylesdir=${ASCIIDOCTOR_PDF_DIR}/data/themes \
  -a pdf-fontsdir=${ASCIIDOCTOR_PDF_DIR}/data/fonts docs/*.adoc

echo ">> Convert succeeded!"
echo ">> Converted files are following."
ls -1 docs/*.pdf
