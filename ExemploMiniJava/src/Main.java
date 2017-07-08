
import java.io.FileReader;
import java.nio.file.Paths;

public class Main {
    public static void main(String []args){
        String rootPath = Paths.get("").toAbsolutePath().toString();
        String subPath = "\\src\\samples\\";

        String sourcecode = rootPath + subPath + "Exemplo.java";
        
        try {
            Parser p = new Parser(new LexicalAnalyzer(new FileReader(sourcecode)));
            
            Object result = p.parse().value;
            
            
            
            
            
            System.out.println("Compilacao concluida com sucesso...");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
