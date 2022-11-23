package fr.turri.common;

import com.martiansoftware.jsap.*;

public class CliHelper {
    public static JSAPResult parseAndHandleCliErrorAndHelpFlag(String description, Parameter[] parameters, String[] args) {
        JSAP jsap = buildJSAP(args, parameters);
        JSAPResult config = jsap.parse(args);

        if (!config.success()) {
            printParseError(jsap, config);
            System.exit(1);
        }
        if (config.getBoolean("help")) {
            printHelpMessage(description, jsap);
            System.exit(0);
        }

        return config;
    }

    private static JSAP buildJSAP(String[] args, Parameter[] parameters) {
        JSAP jsap = new JSAP();

        try {
            jsap.registerParameter(new Switch("help")
                    .setLongFlag("help")
                    .setShortFlag('h'));

            for (Parameter param: parameters ) {
                jsap.registerParameter(param);
            }
        } catch (JSAPException e){
            throw new RuntimeException("Something went really wrong", e);
        }

        return jsap;
    }

    private static void printParseError(JSAP jsap, JSAPResult config) {
        for(@SuppressWarnings("rawtypes") java.util.Iterator errs = config.getErrorMessageIterator() ; errs.hasNext();) {
            System.err.println(errs.next());
        }
        System.err.println("");
        System.err.println("Usage:");
        System.err.println(jsap.getUsage());
    }

    private static void printHelpMessage(String description, JSAP jsap) {
        System.out.println(description);
        System.out.println();
        System.out.println("Usage:");
        System.out.println(jsap.getUsage());
    }
}
