//
//  File.swift
//  PresentationMacOS
//
//  Created by a on 9/5/22.
//

import Foundation

public protocol WeatherModel {
    var mainModel: WeatherMainModel? { get }
    var windModel: WindModel? { get }
    var date: String? { get }
}
