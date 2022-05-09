//
//  DomainModule.swift.swift
//  PresentationMacOS
//
//  Created by a on 9/5/22.
//

import Foundation
import Common

public class DomainModule: BaseModule {
    public init(){}

    public func register() -> BaseModule {
        DIContainer.shared.register(WeatherInteractor.self) {r in
            WeatherInteractorImpl(remoteDS: r.resolve(WeatherRemoteDatasource.self)!)
        }
        return self
    }
}
