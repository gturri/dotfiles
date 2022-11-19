package fr.turri;

import com.google.gson.GsonBuilder;
import org.yaml.snakeyaml.Yaml;

import java.util.Map;

public class YamlToJson {
    public static void main(String[] args) {
        Map<String, Object> parsedYaml = new Yaml().load(System.in);
        System.out.println(new GsonBuilder().setPrettyPrinting().create().toJson(parsedYaml));
    }
}
