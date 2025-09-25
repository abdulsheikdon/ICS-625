import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import org.w3c.dom.*;

public class dom {
    public static void main(String[] args) {
        try {
            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            DocumentBuilder builder = factory.newDocumentBuilder();
            Document doc = builder.parse("exams.xml");
            doc.getDocumentElement().normalize();
            NodeList students = doc.getElementsByTagName("student");

            for (int i = 0; i < students.getLength(); i++) {
                Node studentNode = students.item(i);

                if (studentNode.getNodeType() == Node.ELEMENT_NODE) {
                    Element studentElement = (Element) studentNode;

                    String name = studentElement.getElementsByTagName("name")
                                    .item(0).getTextContent();

                    NodeList exams = studentElement.getElementsByTagName("exam");
                    double total = 0;
                    for (int j = 0; j < exams.getLength(); j++) {
                        total += Double.parseDouble(exams.item(j).getTextContent());
                    }

                    double average = total / exams.getLength();
                    System.out.printf("%s\t%.2f%n", name, average);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}


