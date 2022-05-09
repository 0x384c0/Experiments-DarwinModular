//
//  OpenWeatherMap.swift
//  PresentationMacOS
//
//  Created by a on 9/5/22.
//

import Foundation
import RxSwift
import Common

class OpenWeatherMapApi: BaseApi {
    var baseUrl: String = "https://api.openweathermap.org/data/2.5/"
    let appid = "4c23483851e7e8992de00c00a866cdde"

    func getWeather(lat:Double, lon:Double) -> Single<WeatherDto> {
        createRequest(
            url: "weather",
            parameters: [
                "lat" : lat,
                "lon" : lon,
                "appid" : appid
            ]
        )
    }

    func getForecast(lat:Double, lon:Double) -> Single<ForecastDto> {
        createRequest(
            url: "forecast",
            parameters: [
                "lat" : lat,
                "lon" : lon,
                "appid" : appid
            ]
        )
    }
}
