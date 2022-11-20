package fr.turri;

import org.apache.commons.io.IOUtils;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.Base64;

public class Base64Decoder {
    public static void main(String[] args) throws IOException {
        System.out.write(Base64.getDecoder().decode(IOUtils.toString(System.in, StandardCharsets.UTF_8)));
    }
}
