import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import org.w3c.dom.*;

import java.io.File;

public class SampleCreateDom {

    private Document tree;
    private boolean flagMois;
    private boolean flagNom;

    public Document getTree() {
        return tree;
    }

    public void parseXmlFile(String fileName) throws Exception {

        // préparer une usine à fabriquer les analyseurs DOM
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        factory.setValidating(true);

        // construire une analyseur DOM
        DocumentBuilder parser = factory.newDocumentBuilder();

        // analyser et afficher le document XML
        tree = parser.parse(new File(fileName));

    }

    public static void main(String[] args) throws Exception {
        //Parse document XML
        SampleCreateDom dom = new SampleCreateDom();
        dom.parseXmlFile("siecle.xml");

        // création d'un document vide
        Document doc = DocumentBuilderFactory.newInstance()
                .newDocumentBuilder().newDocument();

        // ajout de noeuds
        Element racine = doc.createElement("noms");
        dom.fetchName(racine, dom.getTree(), doc);
        doc.appendChild(racine);

        // sérialisation
        TransformerFactory myFactory = TransformerFactory.newInstance();
        Transformer transformer = myFactory.newTransformer();

        transformer.setOutputProperty(OutputKeys.ENCODING, "iso-8859-1");
        transformer.setOutputProperty(OutputKeys.INDENT, "yes");

        transformer.transform(new DOMSource(doc),
                new StreamResult(System.out));
    }

    private void fetchName(Element racine, Node n, Document doc) {
        if (n.getNodeType() == org.w3c.dom.Node.TEXT_NODE) {
            if (flagMois && flagNom){
                Element nom = doc.createElement("nom");
                nom.appendChild(doc.createTextNode(n.getNodeValue()));
                racine.appendChild(nom);
                flagNom = flagMois = false;
            }

        } else if (n instanceof Comment) {

            //System.out.printf("<!-- %s -->", n.getNodeValue());

        } else if (n instanceof Element) {

            if (n.getNodeName().equals("mois"))
                flagMois = true;
            if (flagMois && n.getNodeName().equals("nom"))
                flagNom = true;
            //System.out.printf("<%s>", n.getNodeName());
            fetchNames(racine, n.getChildNodes(), doc);
            //System.out.printf("</%s>", n.getNodeName());

        } else if (n instanceof Document) {

            fetchNames(racine, n.getChildNodes(), doc);

        }
    }

    private void fetchNames(Element racine, NodeList childNodes, Document doc) {
        for (int i = 0; (i < childNodes.getLength()); i++) {
            fetchName(racine, childNodes.item(i), doc);
        }
    }

}
