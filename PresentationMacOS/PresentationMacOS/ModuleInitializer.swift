//
//  AppDelegate+DI.swift
//  PresentationMacOS
//
//  Created by a on 11/5/22.
//

import Foundation
import Common
import Domain
import Data

protocol ModuleInitializer : AnyObject {
    var modules:[Any] { get set }
}

extension ModuleInitializer {
    func initModules() {
        modules.append(DataModule().register())
        modules.append(DomainModule().register())
        modules.append(PresentationModule().register())
    }
}
