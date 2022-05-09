//
//  File.swift
//  
//
//  Created by a on 12/5/22.
//

import Foundation
import RxSwift
import CoreLocation
@testable import Domain

class MockDS: WeatherRemoteDatasource {
    func getWeather(coordinate: CLLocationCoordinate2D) -> Single<WeatherModel> {
        Single.just(MockWeatherModel(date: "2000-01-01 01:00:00"))
    }

    func getForecast(coordinate: CLLocationCoordinate2D) -> Single<ForecastModel> {
        Single.just(MockForecastModel(weatherForecast: [
            MockWeatherModel(date: "2000-01-01 01:00:00"),
            MockWeatherModel(date: "2000-01-01 02:00:00"),
            MockWeatherModel(date: "2000-01-02 01:00:00"),
            MockWeatherModel(date: "2000-01-02 02:00:00"),
            MockWeatherModel(date: "2000-01-03 02:00:00"),
        ]))
    }
}

struct MockWeatherModel:WeatherModel {
    var mainModel: WeatherMainModel? { MockWeatherMainModel() }
    var windModel: WindModel? { MockWindModel() }
    var date: String?
}

struct MockWeatherMainModel: WeatherMainModel {
    var temp: Double? = 69
    var humidity: Double? = 42
}

struct MockWindModel: WindModel {
    var speed: Double? = 420
}

struct MockForecastModel: ForecastModel{
    var weatherForecast: [WeatherModel]
}
