//
//  WeatherDvo.swift
//  PresentationIOS
//
//  Created by  on 13/6/22.
//

import Foundation
import Domain

fileprivate let TEMP_UNIT = "F"
fileprivate let HUMIDITY_UNIT = "%"
fileprivate let SPEED_UNIT = "m/s"

struct WeatherDvo {
    let date: String
    let temp: String
    let humidity: String
    let windSpeed: String

    init(_ model: WeatherModel) {
        date = String((model.date ?? "TODAY".localized).split(separator: " ").first ?? "")
        temp = "\(model.mainModel?.temp ?? 0) \(TEMP_UNIT)"
        humidity = "\(model.mainModel?.humidity ?? 0) \(HUMIDITY_UNIT)"
        windSpeed = "\(model.windModel?.speed ?? 0) \(SPEED_UNIT)"
    }

    init(
        date: String,
        temp: String,
        humidity: String,
        windSpeed: String
    ) {
        self.date = date
        self.temp = temp
        self.humidity = humidity
        self.windSpeed = windSpeed
    }
}
