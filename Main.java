import java.io.*;
import java_cup.runtime.Symbol;

public class Main {
    public static void main(String[] args) {
        try {
            // Define o caminho do arquivo diretamente no código
            String filePath = "input.txt"; // Altere o caminho para o arquivo desejado
            BufferedReader reader = new BufferedReader(new FileReader(filePath));
            
            // Cria o scanner que vai fazer a análise léxica
            Scanner scanner = new Scanner(reader);
            
            // Cria o parser que vai fazer a análise sintática
            parser parser = new parser(scanner);

            System.out.println("Analisando o arquivo: " + filePath);

            // Lê e processa o arquivo linha por linha
            String input;
            while ((input = reader.readLine()) != null) {
                // Faz o reset do scanner para aceitar a nova entrada
                scanner.yyreset(new StringReader(input));

                try {
                    // Faz o parsing do código
                    Symbol result = parser.parse();

                    // Exibe o resultado da análise sintática
                    System.out.println("Parsing successful! Result: " + result.value);

                } catch (Exception e) {
                    System.out.println("Parsing failed: " + e.getMessage());
                    e.printStackTrace();
                }
            }

            // Fecha o BufferedReader
            reader.close();

        } catch (IOException e) {
            System.out.println("Erro ao abrir ou ler o arquivo: " + e.getMessage());
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
