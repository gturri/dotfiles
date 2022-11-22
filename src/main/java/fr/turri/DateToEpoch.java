package fr.turri;

import fr.turri.jiso8601.Iso8601Deserializer;
import org.apache.commons.io.IOUtils;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.Date;

public class DateToEpoch {
    public static void main(String[] args) throws IOException {
        Date date = Iso8601Deserializer.toDate(IOUtils.toString(System.in, StandardCharsets.UTF_8));
        System.out.println(date.getTime() / 1000);
    }
}
