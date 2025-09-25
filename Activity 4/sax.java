import org.xml.sax.*;
import org.xml.sax.helpers.DefaultHandler;
import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;

public class sax {
    public static void main(String[] args) {
        try {
            SAXParserFactory factory = SAXParserFactory.newInstance();
            SAXParser saxParser = factory.newSAXParser();
            DefaultHandler handler = new DefaultHandler() {
                String currentElement = "";
                String name = "";
                double total = 0;
                int count = 0;

                public void startElement(String uri, String localName, String qName, Attributes attributes) {
                    currentElement = qName;
                }
                public void characters(char[] ch, int start, int length) {
                    String value = new String(ch, start, length).trim();
                    if (value.length() == 0) return;
                    switch (currentElement) {
                        case "name":
                            name = value;
                            break;
                        case "exam":
                            total += Double.parseDouble(value);
                            count++;
                            break;
                    }
                }
                public void endElement(String uri, String localName, String qName) {
                    if (qName.equals("student")) {
                        double average = total / count;
                        System.out.printf("%s\t%.2f%n", name, average);
                        total = 0;
                        count = 0;
                    }
                }
            };
            saxParser.parse("exams.xml", handler);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
