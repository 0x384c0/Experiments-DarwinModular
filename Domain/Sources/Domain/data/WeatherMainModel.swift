//
//  WeatherMainModel.swift
//  PresentationMacOS
//
//  Created by a on 9/5/22.
//

import Foundation

public protocol WeatherMainModel {
    var temp: Double? { get }
    var humidity: Double? { get }
}
