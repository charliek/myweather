import com.charlieknudsen.myweather.WeatherModule
import com.charlieknudsen.myweather.handlers.IndexHandler
import com.charlieknudsen.myweather.handlers.ZipHandler
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
    }
    handlers {
        handler("", registry.get(IndexHandler))

        prefix("api") {
            handler("weather/zip/:zip", registry.get(ZipHandler))
        }

        assets "public"
    }
}
