//
//  ModelTests.swift
//  PresentationMacOSTests
//
//  Created by a on 12/5/22.
//

import XCTest
@testable import PresentationMacOS

class WeatherDvoTests: XCTestCase {
    private var sut:WeatherDvo!

    override func setUpWithError() throws {
        sut = WeatherDvo(MockWeatherModel(date: "2000-01-01 01:00:00"))
    }

    func testMappingSuccessfull() throws {
        XCTAssertEqual(sut.humidity, "42.0 %")
        XCTAssertEqual(sut.windSpeed, "420.0 m/s")
    }

    func testMappingNil() throws {
        XCTAssertEqual(sut.temp, "0.0 F")
    }
}
