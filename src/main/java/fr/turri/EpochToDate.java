package fr.turri;

import com.martiansoftware.jsap.*;
import fr.turri.common.CliHelper;
import org.apache.commons.io.IOUtils;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;

public class EpochToDate {
    private static final String LOCAL_TIME_OPTION = "localTime";

    public static void main(String[] args) throws IOException {
        JSAPResult config = CliHelper.parseAndHandleCliErrorAndHelpFlag(
                "Convert epoch time (eg: 1599537600) to date (in iso 8601 format)",
                new Parameter[]{new Switch(LOCAL_TIME_OPTION).setLongFlag("localtime").setShortFlag('l')},
                args);

        long epoch = Long.parseLong(IOUtils.toString(System.in, StandardCharsets.UTF_8).trim());
        Date date = new Date(epoch * 1000);

        SimpleDateFormat sdf;
        if (config.getBoolean(LOCAL_TIME_OPTION)) {
            sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");
        } else {
            sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'");
            sdf.setTimeZone(TimeZone.getTimeZone("UTC"));
        }
        System.out.println(sdf.format(date));
    }
}
