package fr.turri;

import com.martiansoftware.jsap.*;
import org.apache.commons.io.IOUtils;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;

public class EpochToDate {
    private static final String LOCAL_TIME_OPTION = "localTime";

    public static void main(String[] args) throws IOException {
        JSAPResult config = handleCommandLine(args);

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

    private static JSAPResult handleCommandLine(String[] args) {
        JSAP jsap = new JSAP();

        try {
            jsap.registerParameter(new Switch("help")
                    .setLongFlag("help")
                    .setShortFlag('h'));
            jsap.registerParameter(new Switch(LOCAL_TIME_OPTION)
                    .setLongFlag("localtime")
                    .setShortFlag('l'));
        } catch(JSAPException e) {
            throw new RuntimeException("Something went really wrong", e);
        }

        JSAPResult config = jsap.parse(args);

        if (!config.success()) {
            for(@SuppressWarnings("rawtypes") java.util.Iterator errs = config.getErrorMessageIterator() ; errs.hasNext();) {
                System.err.println(errs.next());
            }
            System.err.println(jsap.getUsage());
            System.exit(1);
        }
        if (config.getBoolean("help")) {
            System.out.println(jsap.getUsage());
            System.exit(0);
        }

        return config;
    }
}
