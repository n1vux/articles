#
# pandoc -s -o ext4magic.html --css pandoc.css   -f markdown  ext4magic.md 
fn=$1; shift
echo ${fn%.*}
pandoc -s -o ${fn%.*}.html --css pandoc.css   -f markdown  ${fn%.*}.md 
