package com.charlieknudsen.myweather.handlers

import ratpack.groovy.handling.GroovyContext
import ratpack.groovy.handling.GroovyHandler

import javax.inject.Inject

import static ratpack.groovy.Groovy.groovyTemplate

class IndexHandler extends GroovyHandler {

    @Inject
    IndexHandler() {

    }

    @Override
    protected void handle(GroovyContext context) {
        context.with {
            byMethod {
                get {
                    render groovyTemplate("index.html", title: "My Ratpack App")
                }
            }
        }
    }
}

