all: index full dates

index: $(patsubst %.md,%.html,$(wildcard q/*.md)) dates
	rm -f toc.html.in
	for f in q/*.md; do awk '/#/ {print "<div><a href=\"q/" $$2 "html\">" $$0 "</a></div>"; exit }' $$f >>toc.html.in; done
	cat index-header.html.in toc.html.in index-footer.html.in >index.html

full: $(patsubst %.md,%.html,$(wildcard q/*.md))
	pandoc --from markdown --to html5 --standalone --toc -o full.html q/*.md

dates: dates.html

%.html: %.md
	pandoc --from markdown --to html5 --standalone -i $^ -o $@
