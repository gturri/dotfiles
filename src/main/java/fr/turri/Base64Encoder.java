package fr.turri;

import org.apache.commons.io.IOUtils;

import java.io.IOException;
import java.util.Base64;

public class Base64Encoder {
    public static void main(String[] args) throws IOException {
        System.out.print(Base64.getEncoder().encodeToString(IOUtils.toByteArray(System.in)));
    }
}
