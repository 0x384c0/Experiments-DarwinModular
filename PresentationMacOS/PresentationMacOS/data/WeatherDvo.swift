//
//  WeatherDvo.swift
//  PresentationMacOS
//
//  Created by a on 11/5/22.
//

import Foundation
import Domain

struct WeatherDvo {
    let date: String
    let temp: String
    let humidity: String
    let windSpeed: String

    init(_ model: WeatherModel) {
        date = String(model.date?.split(separator: " ").first ?? "")
        temp = "\(model.mainModel?.temp ?? 0) F"
        humidity = "\(model.mainModel?.humidity ?? 0) %"
        windSpeed = "\(model.windModel?.speed ?? 0) m/s"
    }
}
