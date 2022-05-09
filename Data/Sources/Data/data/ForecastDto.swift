//
//  ForecastDto.swift
//  PresentationMacOS
//
//  Created by a on 11/5/22.
//

import Foundation
import Domain

struct ForecastDto: Codable {
    var list = [WeatherDto]()
}

extension ForecastDto: ForecastModel {
    var weatherForecast: [WeatherModel] { list }
}
