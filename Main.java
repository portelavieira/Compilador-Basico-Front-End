import java.io.FileReader;
import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.util.List;

public class Main {
    public static void main(String[] args) {
        // Nome do arquivo padrão que será lido
        String filePath = "input.txt";

        try {
            // Verificar se o arquivo existe
            File file = new File(filePath);
            if (!file.exists()) {
                System.err.println("Arquivo '" + filePath + "' não encontrado no diretório atual.");
                return;
            }

            // Inicializar o scanner e o parser
            BufferedReader br = new BufferedReader(new FileReader(file));
            Scanner scanner = new Scanner(br);
            parser p = new parser(scanner);

            // Executar o parser
            @SuppressWarnings("unchecked")
            List<String> syntaxTree = (List<String>) p.parse().value;

            // Imprimir a árvore sintática
            printSyntaxTree(syntaxTree, 0);

        } catch (IOException e) {
            System.err.println("Erro ao ler o arquivo: " + e.getMessage());
        } catch (Exception e) {
            System.err.println("Erro ao executar o parser: " + e.getMessage());
            e.printStackTrace();
        }
    }

    // Função para imprimir a árvore sintática com indentação
    private static void printSyntaxTree(List<String> syntaxTree, int level) {
        for (String node : syntaxTree) {
            // Adicionar indentação para facilitar a leitura
            System.out.println("  ".repeat(level) + node);
        }
    }
}
