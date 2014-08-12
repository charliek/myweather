package com.charlieknudsen.myweather.handlers

import com.charlieknudsen.myweather.services.WUnderground
import com.charlieknudsen.myweather.transfer.Conditions
import com.fasterxml.jackson.databind.ObjectMapper
import groovy.util.logging.Slf4j
import ratpack.groovy.handling.GroovyContext
import ratpack.groovy.handling.GroovyHandler
import ratpack.http.client.ReceivedResponse

import javax.inject.Inject

import static ratpack.groovy.Groovy.groovyTemplate

@Slf4j
class IndexHandler extends GroovyHandler {
    private final ObjectMapper mapper
    private final WUnderground wUnderground

    @Inject
    IndexHandler(ObjectMapper mapper, WUnderground wUnderground) {
        this.wUnderground = wUnderground
        this.mapper = mapper
    }

    @Override
    protected void handle(GroovyContext context) {
        context.with {
            byMethod {
                get {
                    String zip = context.request.getQueryParams().get('zip') ?: '55116'
                    log.info("Looking up zip code $zip")
                    wUnderground.getZipRequest(zip)
                    .single()
                    .subscribe { ReceivedResponse resp ->
                        Conditions conditions = mapper.readValue(resp.body.inputStream, Conditions)
                        render groovyTemplate("index.html", weather: conditions.currentObservation, title: 'hello')
                    }
                }
            }
        }
    }
}

