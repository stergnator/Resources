# pandoc is a handy tool for converting between numerous text formats:
# http://johnmacfarlane.net/pandoc/installing.html
PANDOC := pandoc

# generate HTML and Graphviz Flowchart files

all: TechLog.html

TechLog.html: TechLog.md buttondown.css
	$(PANDOC) -f markdown+pandoc_title_block -s -c buttondown.css --table-of-contents --self-contained -o $@ $<

