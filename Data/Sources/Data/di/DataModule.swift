//
//  DataModule.swift
//  PresentationMacOS
//
//  Created by a on 9/5/22.
//

import Foundation
import Common
import Domain

public class DataModule: BaseModule {
    public init(){}

    public func register() -> BaseModule {
        DIContainer.shared.register(WeatherRemoteDatasource.self) {r in
            WeatherRemoteDatasourceImpl(api: OpenWeatherMapApi())
        }
        return self
    }
}
