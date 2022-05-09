//
//  WeatherInteractorImpl.swift
//  PresentationMacOS
//
//  Created by a on 9/5/22.
//

import Foundation
import RxSwift
import CoreLocation
import Algorithms

struct WeatherInteractorImpl: WeatherInteractor {
    let remoteDS: WeatherRemoteDatasource

    func getWeather(coordinate: CLLocationCoordinate2D) -> Single<WeatherModel> {
        remoteDS.getWeather(coordinate: coordinate)
    }

    func getForecast(coordinate: CLLocationCoordinate2D) -> Single<[WeatherModel]> {
        remoteDS
            .getForecast(coordinate: coordinate)
            .map {
                let array = $0.weatherForecast.uniqued(on: {$0.date?.split(separator: " ").first})
                return Array(array[1...(array.count - 1)])
            }
    }
}
