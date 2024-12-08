import java.io.FileReader;

public class Main {
    public static void main(String[] args) {
        try {
            // Configurar o scanner e o parser
            Scanner scanner = new Scanner(new FileReader("input.txt")); // Substitua por seu arquivo de entrada
            parser parser = new parser(scanner);

            // Parsear e obter a árvore sintática
            SyntaxTreeNode syntaxTree = (SyntaxTreeNode) parser.parse().value;

            // Imprimir a árvore sintática
            System.out.println("Árvore Sintática:");
            syntaxTree.print("");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
