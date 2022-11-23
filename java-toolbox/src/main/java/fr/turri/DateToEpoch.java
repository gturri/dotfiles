package fr.turri;

import com.martiansoftware.jsap.Parameter;
import fr.turri.common.CliHelper;
import fr.turri.jiso8601.Iso8601Deserializer;
import org.apache.commons.io.IOUtils;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.Date;

public class DateToEpoch {
    public static void main(String[] args) throws IOException {
        CliHelper.parseAndHandleCliErrorAndHelpFlag(
                "Reads (on stdin) a date represented as iso8601 (eg: 2022-09-08T04:00:00Z) and prints corresponding epoch time",
                new Parameter[]{},
                args);

        Date date = Iso8601Deserializer.toDate(IOUtils.toString(System.in, StandardCharsets.UTF_8).trim());
        System.out.println(date.getTime() / 1000);
    }
}
