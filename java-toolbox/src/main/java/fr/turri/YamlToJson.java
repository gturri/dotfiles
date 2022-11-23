package fr.turri;

import com.google.gson.GsonBuilder;
import com.martiansoftware.jsap.Parameter;
import fr.turri.common.CliHelper;
import org.yaml.snakeyaml.Yaml;
import org.yaml.snakeyaml.parser.ParserException;

import java.util.Map;

public class YamlToJson {
    public static void main(String[] args) {
        CliHelper.parseAndHandleCliErrorAndHelpFlag(
                "Reads a json document (from stdin) and converts it to yaml.\n" +
                        "(This is not supposed to be very useful since yaml is a superset of json, but it gives a " +
                        "look and feel closer to what people new to yaml might expect)",
                new Parameter[]{},
                args);

        try {
            Map<String, Object> parsedYaml = new Yaml().load(System.in);
            System.out.println(new GsonBuilder().setPrettyPrinting().create().toJson(parsedYaml));
        } catch (ParserException e) {
            System.err.println("Failed to parse the yaml document: " + e.getMessage());
            System.exit(1);
        }
    }
}
