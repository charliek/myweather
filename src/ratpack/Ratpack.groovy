import com.charlieknudsen.myweather.WeatherModule
import com.charlieknudsen.myweather.handlers.ErrorHandler
import com.charlieknudsen.myweather.handlers.IndexHandler
import com.charlieknudsen.myweather.handlers.api.ZipAPIHandler
import ratpack.error.ServerErrorHandler
import ratpack.hystrix.HystrixRatpack
import ratpack.jackson.JacksonModule
import ratpack.rx.RxRatpack

import static ratpack.groovy.Groovy.ratpack

ratpack {
    bindings {
        add new JacksonModule()
        add new WeatherModule()
        init {  ->
            RxRatpack.initialize()
            HystrixRatpack.initialize()
        }
        bind ServerErrorHandler, ErrorHandler

    }
    handlers {
        handler("", registry.get(IndexHandler))

        handler("ping") {
            byMethod {
                get {
                    render "PONG"
                }
            }
        }

        prefix("api") {
            handler("weather/zip/:zip", registry.get(ZipAPIHandler))
        }

        assets "public"
    }
}
