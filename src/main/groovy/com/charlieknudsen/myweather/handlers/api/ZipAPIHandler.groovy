package com.charlieknudsen.myweather.handlers.api

import com.charlieknudsen.myweather.services.WUnderground
import com.charlieknudsen.myweather.transfer.Conditions
import com.fasterxml.jackson.databind.ObjectMapper
import ratpack.groovy.handling.GroovyContext
import ratpack.groovy.handling.GroovyHandler
import ratpack.http.client.ReceivedResponse
import static ratpack.jackson.Jackson.json

import javax.inject.Inject

class ZipAPIHandler extends GroovyHandler {

    private final ObjectMapper mapper
    private final WUnderground wUnderground

    @Inject
    ZipAPIHandler(ObjectMapper mapper, WUnderground wUnderground) {
        this.wUnderground = wUnderground
        this.mapper = mapper
    }

    @Override
    protected void handle(GroovyContext context) {
        context.with {
            byMethod {
                get {
                    String zip = pathTokens['zip']
                    validateZipInput(zip)
                    wUnderground.getZipRequest(zip)
                        .doOnError { Throwable t ->
                            // TODO figure out how we want to handle errors
                            t.printStackTrace()
                        }
                        .subscribe { ReceivedResponse resp ->
                            Conditions conditions = mapper.readValue(resp.body.inputStream, Conditions)
                            render json(conditions.currentObservation)
                    }
                }
            }
        }
    }

    private void validateZipInput(String zip) {
        if(zip.length() != 5 || ! zip.isInteger()) {
            // TODO figure out validation errors
            throw new IllegalArgumentException('Invalid zip code entered')
        }
    }
}



