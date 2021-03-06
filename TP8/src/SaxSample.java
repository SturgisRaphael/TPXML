import org.xml.sax.Attributes;
import org.xml.sax.InputSource;
import org.xml.sax.SAXParseException;
import org.xml.sax.XMLReader;
import org.xml.sax.helpers.DefaultHandler;
import org.xml.sax.helpers.XMLReaderFactory;

import java.util.Map;

public class SaxSample extends DefaultHandler {

    int nbElements = 0;
    int nbCharacters = 0;
    private boolean isInDay = false;
    private boolean isInName = false;

    // méthodes d'analyse et de traitement des évènements

    public void parseXmlFile(String fileName) throws Exception {

        // créer un analyseur SAX par défaut
        XMLReader xr = XMLReaderFactory.createXMLReader();

        // fixer le(s) gestionnaire(s) d'évènements
        xr.setContentHandler(this);
        xr.setErrorHandler(this);
        // xr.setDTDHandler(this);

        // fixer les comportements
        xr.setFeature("http://xml.org/sax/features/validation", true);

        // analyser la source XML
        xr.parse(new InputSource(fileName));
    }



    // Travail à faire en début d'analyse
    @Override
    public void startDocument() {
        nbElements = 0;
        nbCharacters = 0;
        isInDay = false;
        isInName = false;
    }

    // Travail à faire en fin d'analyse
    @Override
    public void endDocument() {
        System.out.println();
        System.out.println("nbElements = " + nbElements);
        System.out.println("nbCharacters = " + nbCharacters);
    }



    @Override
    public void startElement(String uri, String name, String qName,
                             Attributes atts) {
        if(qName == "nom")
            isInName = true;
        if(qName == "jour")
            isInDay = true;
        //System.out.println("<" + qName + ">");
        nbElements++;
    }

    @Override
    public void endElement(String uri, String name, String qName) {
        if(qName == "nom")
            isInName = false;
        if(qName == "jour")
            isInDay = false;
        //System.out.println("</" + qName + ">");
    }

    @Override
    public void characters(char ch[], int start, int length) {
        nbCharacters += (length);
        if(isInDay && isInName) {
            for (int i = start; i < start + length; i++) {
                switch (ch[i]) {
                    case '&':
                        System.out.print("&amp;");
                        break;
                    case '<':
                        System.out.print("&lt;");
                        break;
                    case '>':
                        System.out.print("&gt;");
                        break;
                    default:
                        System.out.print(ch[i]);
                        break;
                }
            }
            System.out.println();
        }
    }

    @Override
    public void error(SAXParseException e) {
        System.err.printf("Erreur non fatale (ligne %d, col %d) : %s\n",
                e.getLineNumber(), e.getColumnNumber(), e.getMessage());
    }

    @Override
    public void fatalError(SAXParseException e) {
        System.err.printf("Erreur fatale : %s\n", e.getMessage());
    }

    @Override
    public void warning(SAXParseException e) {
        System.err.printf("warning : %s\n", e.getMessage());
    }

    public static void main(String args[]) throws Exception {
        SaxSample parser = new SaxSample();
        parser.parseXmlFile("siecle.xml");
    }
}
