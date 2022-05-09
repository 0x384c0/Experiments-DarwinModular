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

struct MockWeatherModel:WeatherModel {
    var mainModel: WeatherMainModel? { MockWeatherMainModel() }
    var windModel: WindModel? { MockWindModel() }
    var date: String?
}

struct MockWeatherMainModel: WeatherMainModel {
    var temp: Double? = nil
    var humidity: Double? = 42
}

struct MockWindModel: WindModel {
    var speed: Double? = 420
}
