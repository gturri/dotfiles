package fr.turri;

import com.martiansoftware.jsap.Parameter;
import fr.turri.common.CliHelper;
import org.apache.commons.io.IOUtils;

import java.io.IOException;
import java.util.Base64;

public class Base64Encoder {
    public static void main(String[] args) throws IOException {
        CliHelper.parseAndHandleCliErrorAndHelpFlag("Reads a stream of bytes (from stdin) and prints the base64 encoded representation",
                new Parameter[]{},
                args);

        System.out.print(Base64.getEncoder().encodeToString(IOUtils.toByteArray(System.in)));
    }
}
