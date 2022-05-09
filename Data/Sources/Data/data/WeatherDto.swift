//
//  WeatherDto.swift
//  PresentationMacOS
//
//  Created by a on 9/5/22.
//

import Foundation
import Domain

struct WeatherDto: Codable {
    let main: WeatherMainDto?
    let wind: WindDto?
    let dt_txt: String?
}

extension WeatherDto: WeatherModel {
    var mainModel: WeatherMainModel? { main }
    var windModel: WindModel? { wind }
    var date: String? { dt_txt }
}
