//
//  WeatherDvo.swift
//  PresentationMacOS
//
//  Created by a on 11/5/22.
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
        date = String(model.date?.split(separator: " ").first ?? "")
        temp = "\(model.mainModel?.temp ?? 0) \(TEMP_UNIT)"
        humidity = "\(model.mainModel?.humidity ?? 0) \(HUMIDITY_UNIT)"
        windSpeed = "\(model.windModel?.speed ?? 0) \(SPEED_UNIT)"
    }
}
