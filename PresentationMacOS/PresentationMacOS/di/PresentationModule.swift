//
//  PresentationModule.swift
//  PresentationMacOS
//
//  Created by a on 11/5/22.
//

import Foundation
import Common

class PresentationModule: BaseModule {
    func register() -> BaseModule {
        DIContainer.shared.register(WeatherCoordinator.self) {r in
            WeatherCoordinator()
        }
        return self
    }
}
