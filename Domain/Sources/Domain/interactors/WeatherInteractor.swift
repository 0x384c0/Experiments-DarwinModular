//
//  WeatherInteractor.swift
//  PresentationMacOS
//
//  Created by a on 9/5/22.
//

import Foundation
import RxSwift
import CoreLocation

public protocol WeatherInteractor {
    func getWeather(coordinate: CLLocationCoordinate2D) -> Single<WeatherModel>
    func getForecast(coordinate: CLLocationCoordinate2D) -> Single<[WeatherModel]>
}
