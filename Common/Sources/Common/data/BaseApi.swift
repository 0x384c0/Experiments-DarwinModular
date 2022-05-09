//
//  BaseApi.swift
//  PresentationMacOS
//
//  Created by a on 9/5/22.
//

import Foundation
import RxSwift
import Alamofire
import RxAlamofire

public protocol BaseApi {
    var baseUrl: String { get }
}

public extension BaseApi {
    func createRequest<T: Decodable>(
        url:String,
        parameters: [String: Any]? = nil
    ) -> Single<T>{
        print("\(HTTPMethod.get) \(baseUrl + url) \(parameters ?? [:])")
        return RxAlamofire.requestDecodable(
            HTTPMethod.get,
            baseUrl + url,
            parameters: parameters
        )
            .map { $0.1 }
            .asSingle()
    }
}
