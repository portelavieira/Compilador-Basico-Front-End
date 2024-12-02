import java.io.*;

public class Main {
    public static void main(String[] args) {
        try {
            // Lê o arquivo de entrada `input.txt`
            BufferedReader reader = new BufferedReader(new FileReader("input.txt"));
            scanner scanner = new scanner(reader); // Criação da instância do scanner
            parser parser = new parser(scanner);  // Passa o scanner para o parser

            System.out.println("Iniciando análise léxica e sintática do arquivo input.txt:");

            // Executa a análise sintática (que inclui a análise léxica)
            parser.parse();

            System.out.println("Análise concluída.");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
