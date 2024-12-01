import java.io.*;

public class Main {
    public static void main(String[] args) {
        try {
            BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
            Yylex scanner = new Yylex(reader);  // Scanner gerado pelo JFlex (ajustado para o nome Yylex)
            Parser parser = new parser(scanner);  // Parser gerado pelo CUP

            System.out.println("Enter expressions (end with semicolon ';'):");
            System.out.println("Type 'exit' to quit.");

            while (true) {
                System.out.print("> ");
                String input = reader.readLine();
                if (input == null || input.equalsIgnoreCase("exit")) break;

                // Reinicia o scanner com a nova entrada
                scanner.yyreset(new StringReader(input));

                // Realiza o parsing da entrada
                try {
                    parser.parse();
                } catch (Exception e) {
                    System.err.println("Parsing error: " + e.getMessage());
                }
            }
        } catch (Exception e) {
            System.err.println("Error: " + e.getMessage());
            e.printStackTrace();
        }
    }
}
