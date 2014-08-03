package com.charlieknudsen.myweather

import com.charlieknudsen.myweather.services.WUnderground
import com.fasterxml.jackson.databind.DeserializationFeature
import com.fasterxml.jackson.databind.ObjectMapper
import com.fasterxml.jackson.databind.PropertyNamingStrategy
import com.fasterxml.jackson.databind.SerializationFeature
import com.google.inject.AbstractModule;
import com.google.inject.Scopes;

public class WeatherModule extends AbstractModule {

    @Override
    protected void configure() {
        bind(ObjectMapper).toInstance(buildObjectMapper())
        bind(WUnderground.class).in(Scopes.SINGLETON);
    }

    static ObjectMapper buildObjectMapper() {
        return new ObjectMapper()
                .setPropertyNamingStrategy(PropertyNamingStrategy.CAMEL_CASE_TO_LOWER_CASE_WITH_UNDERSCORES)
                .disable(DeserializationFeature.FAIL_ON_IGNORED_PROPERTIES)
                .disable(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES)
                .disable(SerializationFeature.FAIL_ON_EMPTY_BEANS)
    }

}