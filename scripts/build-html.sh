#!/bin/bash -e

echo ">> Converting AsciiDoc to HTML..."

asciidoctor docs/*.adoc

echo ">> Convert succeeded!"
echo ">> Converted files are following."
ls -1 docs/*.html
