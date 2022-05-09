//
//  LocationDatasource.swift
//  PresentationMacOS
//
//  Created by a on 9/5/22.
//

import Foundation
import CoreLocation
import RxSwift

public protocol LocationDatasource{
    func getLocation() -> Single<CLLocation>
}
