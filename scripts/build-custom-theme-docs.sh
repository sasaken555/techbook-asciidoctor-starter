#!/bin/bash -e
rm -f docs/*.pdf

CURRENT_PATH=`pwd`
ASCIIDOCTOR_PDF_DIR=`gem contents asciidoctor-pdf --show-install-dir`

echo ">> Converting AsciiDoc to PDF..."

# Custom themes
asciidoctor-pdf -B ${CURRENT_PATH}/ \
  -r asciidoctor-pdf-cjk \
  -a scripts=cjk \
  -a pdf-style=my-theme.yml \
  -a pdf-stylesdir=${CURRENT_PATH}/themes \
  -a pdf-fontsdir=${CURRENT_PATH}/fonts docs/*.adoc

echo ">> Convert succeeded!"
echo ">> Converted files are following."
ls -1 docs/*.pdf
