package fr.turri;

import com.google.gson.Gson;
import com.google.gson.JsonSyntaxException;
import com.martiansoftware.jsap.Parameter;
import fr.turri.common.CliHelper;
import org.yaml.snakeyaml.Yaml;

import java.io.InputStreamReader;
import java.util.Map;

public class JsonToYaml {
    public static void main(String[] args) {
        CliHelper.parseAndHandleCliErrorAndHelpFlag(
                "Reads a yaml document (from stdin) and converts it to json",
                new Parameter[]{},
                args);

        try {
            Map parsedJson = new Gson().fromJson(new InputStreamReader(System.in), Map.class);
            System.out.println(new Yaml().dump(parsedJson));
        } catch(JsonSyntaxException e) {
            System.err.println("Failed to parse the json document: " + e.getMessage());
            System.exit(1);
        }
    }
}
