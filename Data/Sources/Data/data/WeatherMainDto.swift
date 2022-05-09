//
//  WeatherMainDto.swift
//  PresentationMacOS
//
//  Created by a on 9/5/22.
//

import Foundation
import Domain

struct WeatherMainDto: WeatherMainModel, Codable {
    let temp: Double?
    let humidity: Double?
}
