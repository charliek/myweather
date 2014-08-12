package com.charlieknudsen.myweather.handlers

import groovy.util.logging.Slf4j
import org.codehaus.groovy.runtime.StackTraceUtils
import ratpack.error.ServerErrorHandler
import ratpack.handling.Context

import static ratpack.groovy.Groovy.groovyTemplate

@Slf4j
class ErrorHandler implements ServerErrorHandler {

    @Override
    void error(Context context, Exception e) {
        log.warn("Exception encountered", e)
        context.with {
            render groovyTemplate("error.html",
                    exception: e,
                    sanitizedException: StackTraceUtils.deepSanitize(e))
        }
    }
}