//
//  PresentationModule.swift
//  PresentationIOS
//
//  Created by  on 13/6/22.
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
