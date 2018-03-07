dtd:
	xmllint --valid --noout master.xml

xsd:
	xmllint -schema master.xsd master.xml --noout

web:
	mkdir -p www
	xsltproc xsl/master.xsl master.xml

tidy:
	tidy -m www/index.html
	tidy -m www/intervenants.html
	tidy -m www/unites.html
	tidy -m www/intervenants/*
	tidy -m www/unites/*
	
xq:
	java -cp saxon/saxon9he.jar net.sf.saxon.Query indent=no xq.txt > www/xq.xhtml

java:

all: dtd xsd web tidy xq java
	
clean:
	rm -r www

