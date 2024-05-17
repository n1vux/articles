# scripts 
#
# use make -r --debug=v to debug ignoring default rules


# what do we not generate? declare those explicitly
RawPages=README.md

NoneSuch=$(RawPages:.html=.md)

# explicit expansion now, instead of deferred
MarkDown=$(filter-out $(RawPages),$(wildcard *.md))

Pages=$(MarkDown:.md=.html)


STYLE=pandoc.css

report:
	@echo MD: $(MarkDown)
	@echo PG: $(Pages)
	@echo RP: $(RawPages)
	@echo NS: $(NoneSuch)

all: report $(Pages) $(RawPages)
	git status

$(NoneSuch):
	@echo Nothing done for $@

extensions=
# extensions="+pipe_tables"
flags=

# $(Pages): %.html: %.md
$(Pages): 
	pandoc -s -o $@ --css pandoc.css $(flags) -f markdown$(extensions)  $>



# foo.docx: foo.tex
#	pandoc foo.tex --from latex --to docx > foo.docx

# clean:
#	rm $(objects)
