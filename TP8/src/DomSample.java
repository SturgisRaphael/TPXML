import org.w3c.dom.*;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import java.io.File;

public class DomSample {

    boolean flagMois = false, flagNom = false;

    public void parseXmlFile(String fileName) throws Exception {

        // préparer une usine à fabriquer les analyseurs DOM
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        factory.setValidating(true);

        // construire une analyseur DOM
        DocumentBuilder parser = factory.newDocumentBuilder();

        // analyser et afficher le document XML
        Document doc = parser.parse(new File(fileName));
        //printTree(doc);

    }

    public void printTree(Node n) {
        if (n.getNodeType() == org.w3c.dom.Node.TEXT_NODE) {
            if (flagMois && flagNom){
                System.out.println(n.getNodeValue());
                flagNom = flagMois = false;
            }

        } else if (n instanceof Comment) {

            //System.out.printf("<!-- %s -->", n.getNodeValue());

        } else if (n instanceof Element) {

            if (n.getNodeName() == "mois")
                flagMois = true;
            if (flagMois && n.getNodeName() == "nom")
                flagNom = true;
            //System.out.printf("<%s>", n.getNodeName());
            printTrees(n.getChildNodes());
            //System.out.printf("</%s>", n.getNodeName());

        } else if (n instanceof Document) {

            printTrees(n.getChildNodes());

        }
    }

    public void printTrees(NodeList nodes) {
        for (int i = 0; (i < nodes.getLength()); i++) {
            printTree(nodes.item(i));
        }
    }

    public static void main(String[] args) throws Exception {
        // création d'un document vide
        Document doc = DocumentBuilderFactory.newInstance()
                .newDocumentBuilder().newDocument();
        DomSample dom = new DomSample();
        dom.parseXmlFile("siecle.xml");

    }

}