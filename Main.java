import java.io.FileReader;
import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.util.List;

public class Main {
    public static void main(String[] args) {
        String filePath = "input.txt";
        try {
            File file = new File(filePath);
            if (!file.exists()) {
                System.err.println("Arquivo '" + filePath + "' não encontrado no diretório atual.");
                return;
            }

            BufferedReader br = new BufferedReader(new FileReader(file));
            Scanner scanner = new Scanner(br);
            parser p = new parser(scanner);

            // Executar o parser
            Object result = p.parse().value;

            if (result instanceof List) {
                @SuppressWarnings("unchecked")
                List<String> syntaxTree = (List<String>) result;
                printSyntaxTree(syntaxTree, 0);
            } else {
                System.err.println("Erro: Resultado do parser não é uma árvore sintática válida.");
            }

        } catch (IOException e) {
            System.err.println("Erro ao ler o arquivo: " + e.getMessage());
        } catch (Exception e) {
            System.err.println("Erro ao executar o parser: " + e.getMessage());
            e.printStackTrace();
        }
    }

    private static void printSyntaxTree(List<String> syntaxTree, int level) {
        if (syntaxTree == null) return;
        for (String node : syntaxTree) {
            System.out.println("  ".repeat(level) + node);
        }
    }
}

