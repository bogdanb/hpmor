#!/bin/sh
cd /opt/hpmor-tex/hpmor
ls /home/sites/hpmor.com/htdocs/util/stripped/ | grep -v '\.' | while read i; do
  ./tools/html2tex.pl </home/sites/hpmor.com/htdocs/util/stripped/$i > tmp
  fold -s tmp > ./auto-src/hpmor-chapter-`printf "%03i" $i`.tex
  rm tmp
done

