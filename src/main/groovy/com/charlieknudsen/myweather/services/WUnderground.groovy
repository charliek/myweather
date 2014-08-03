package com.charlieknudsen.myweather.services

import org.apache.commons.configuration.ConfigurationException
import ratpack.func.Action
import ratpack.http.HttpUrlSpec
import ratpack.http.client.HttpClients
import ratpack.http.client.ReceivedResponse
import ratpack.http.client.RequestSpec
import ratpack.launch.LaunchConfig
import ratpack.rx.RxRatpack
import rx.Observable

import javax.inject.Inject

class WUnderground {

    private final LaunchConfig launchConfig
    private final String apiKey

    @Inject
    WUnderground(LaunchConfig launchConfig) {
        this.launchConfig = launchConfig
        this.apiKey = launchConfig.getOther('wunderground.apikey', '')
        if (apiKey.empty) {
            throw new ConfigurationException('wunderground key is required at other.wunderground.apikey')
        }
    }

    public Observable<ReceivedResponse> getZipRequest(final String zip) {
        RxRatpack.observe(HttpClients.httpClient(launchConfig).get(new Action<RequestSpec>() {
            @Override
            void execute(RequestSpec request) throws Exception {
                request.url(new Action<HttpUrlSpec>() {
                    @Override
                    void execute(HttpUrlSpec httpUrlSpec) throws Exception {
                        httpUrlSpec.set("http://api.wunderground.com/api/${apiKey}/conditions/q/${zip}.json".toURI())
                    }
                })
            }
        }))
    }
}
