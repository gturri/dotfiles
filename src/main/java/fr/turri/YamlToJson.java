package fr.turri;

import com.google.gson.GsonBuilder;
import org.yaml.snakeyaml.Yaml;
import org.yaml.snakeyaml.parser.ParserException;

import java.util.Map;

public class YamlToJson {
    public static void main(String[] args) {
        try {
            Map<String, Object> parsedYaml = new Yaml().load(System.in);
            System.out.println(new GsonBuilder().setPrettyPrinting().create().toJson(parsedYaml));
        } catch (ParserException e) {
            System.err.println("Failed to parse the yaml document: " + e.getMessage());
            System.exit(1);
        }
    }
}
