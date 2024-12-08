import java.io.StringReader;
import java.util.List;

public class Main {
    public static void main(String[] args) {
        // Exemplo de entrada a ser analisada
        String inputCode = """
            int x;
            if (x + 5) {
                while (x - 2) {
                    x = x / 3;
                }
            }
            """;

        try {
            // Criação de um Scanner para analisar o código de entrada
            Scanner scanner = new Scanner(new StringReader(inputCode));
            
            // Criação do analisador sintático com o Scanner
            parser parser = new parser(scanner);
            
            // Início do processo de análise sintática
            @SuppressWarnings("unchecked")
            List<String> result = (List<String>) parser.parse().value;
            
            // Exibição dos resultados
            System.out.println("Resultado da Análise Sintática:");
            for (String line : result) {
                System.out.println(line);
            }
        } catch (Exception e) {
            System.err.println("Erro durante a análise sintática: " + e.getMessage());
            e.printStackTrace();
        }
    }
}
