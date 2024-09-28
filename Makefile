#
# A makefile to convert TechLog.md into a HTML file using pandoc.
#
#
# pandoc is a handy tool for converting between numerous text formats:
# http://johnmacfarlane.net/pandoc/installing.html
PANDOC := pandoc

# generate HTML and Graphviz Flowchart files

all: TechLog.html PostgreSQL.html 2024-07-WorkNotes.html

2024-07-Worknotes.html: 2024-07-Worknotes.md buttondown.css
	$(PANDOC) -f markdown+pandoc_title_block --mathjax -s -c buttondown.css --table-of-contents --embed-resources --standalone -o $@ $<
# pandoc --embed-resources --standalone --mathjax 2024-07-WorkNotes.md -o 2024-07-WorkNotes.html

TechLog.html: TechLog.md buttondown.css
	$(PANDOC) -f markdown+pandoc_title_block -s -c buttondown.css --table-of-contents --embed-resources --standalone -o $@ $<

PostgreSQL.html: PostgreSQL.md buttondown.css
	$(PANDOC) -f markdown+pandoc_title_block -s -c buttondown.css --table-of-contents --embed-resources --standalone -o $@ $<
