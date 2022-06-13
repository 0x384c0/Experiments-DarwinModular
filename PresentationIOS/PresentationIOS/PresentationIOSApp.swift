//
//  PresentationIOSApp.swift
//  PresentationIOS
//
//  Created by on 13/6/22.
//

import SwiftUI
import Common
import Domain

@main
struct PresentationIOSApp: App, ModuleInitializer {
    init() {
        modules = initModules()
    }

    var modules: [Any]

    var body: some Scene {
        WindowGroup {
            WeatherView(viewModel: WeatherViewModelImpl(
                interactor: DIContainer.shared.resolve(WeatherInteractor.self)!,
                coordinator: DIContainer.shared.resolve(WeatherCoordinator.self)!
            ))
        }
    }
}
