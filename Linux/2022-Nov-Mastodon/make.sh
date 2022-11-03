#! /bin/bash

set -x

fn=$1; shift
# fn=Socials.md
fnroot=${fn%.*}

echo ${fn%.*}
extensions="+pipe_tables"
tpfx="--title-prefix=NatickF(L)OSS"
flags="$tpfx --toc --toc-depth=1"
pandoc -s -o ${fn%.*}.html --css pandoc.css $flags -f markdown$extensions  ${fn%.*}.md 

# +implicit_header_references+auto_identifiers 
## if slides desired with Slidy
  pandoc $tpfx --from=markdown --css pandoc.css --to=slidy --template=slidy-template.Thtml   $fn --slide-level=3 -o $fn.slidy.html
   perl -plE 's/^:::(?x: \s* notes \b)?\s*$//d;' $fn > $fnroot-notes.md
   pandoc $tpfx --from=markdown --css pandoc.css --to=html -s --toc --toc-depth=1 $fnroot-notes.md  -o $fn.doc.html; echo $?; 
