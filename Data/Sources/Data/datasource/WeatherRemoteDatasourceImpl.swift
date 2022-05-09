//
//  WeatherRemoteDatasourceImpl.swift
//  PresentationMacOS
//
//  Created by a on 9/5/22.
//

import CoreLocation
import RxSwift
import Domain

struct WeatherRemoteDatasourceImpl: WeatherRemoteDatasource {
    let api: OpenWeatherMapApi

    func getWeather(coordinate: CLLocationCoordinate2D) -> Single<WeatherModel> {
        return api
            .getWeather(lat: coordinate.latitude, lon: coordinate.longitude)
            .map { $0 as WeatherModel }
    }

    func getForecast(coordinate: CLLocationCoordinate2D) -> Single<ForecastModel> {
        return api
            .getForecast(lat: coordinate.latitude, lon: coordinate.longitude)
            .map { $0 as ForecastModel }
    }
}
