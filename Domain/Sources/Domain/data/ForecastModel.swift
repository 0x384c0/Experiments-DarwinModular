//
//  ForecastModel.swift
//  PresentationMacOS
//
//  Created by a on 11/5/22.
//

import Foundation

public protocol ForecastModel {
    var weatherForecast: [WeatherModel] { get }
}
