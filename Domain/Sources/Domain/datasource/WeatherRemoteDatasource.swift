//
//  WeatherRemoteDatasource.swift
//  PresentationMacOS
//
//  Created by a on 9/5/22.
//

import CoreLocation
import RxSwift

public protocol WeatherRemoteDatasource {
    func getWeather(coordinate: CLLocationCoordinate2D) -> Single<WeatherModel>
    func getForecast(coordinate: CLLocationCoordinate2D) -> Single<ForecastModel>
}
