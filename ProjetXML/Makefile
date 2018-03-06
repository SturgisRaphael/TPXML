dtd:
	xmllint --valid --noout master.xml

xsd:
	xmllint -schema --noout master.xml #TODO: retrouver la bonne commande

web:
	mkdir -p www
	xsltproc xsl/master.xsl master.xml

tidy:
	tidy -im www/index.html
	
xq:
	java -cp saxon/saxon9he.jar net.sf.saxon.Query indent=no xq.txt > www/xq.xhtml

java:

all:
	dtd xsd web tidy xq java
	
clean:
	rm -r www

