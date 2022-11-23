package fr.turri;

import com.martiansoftware.jsap.JSAPResult;
import com.martiansoftware.jsap.Parameter;
import fr.turri.common.CliHelper;
import org.apache.commons.io.IOUtils;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.Base64;

public class Base64Decoder {
    public static void main(String[] args) throws IOException {
        CliHelper.parseAndHandleCliErrorAndHelpFlag(
                "Reads a base64 encoded string (from stdin) and prints the base64 decoded representation",
                new Parameter[]{},
                args);

        System.out.write(Base64.getDecoder().decode(IOUtils.toString(System.in, StandardCharsets.UTF_8)));
    }
}
