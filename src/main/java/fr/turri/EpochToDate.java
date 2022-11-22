package fr.turri;

import org.apache.commons.io.IOUtils;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;

public class EpochToDate {
    public static void main(String[] args) throws IOException {
        long epoch = Long.parseLong(IOUtils.toString(System.in, StandardCharsets.UTF_8).trim());
        Date date = new Date(epoch * 1000);

        SimpleDateFormat sdf;
        sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'");
        sdf.setTimeZone(TimeZone.getTimeZone("UTC"));
        System.out.println(sdf.format(date));
    }
}
