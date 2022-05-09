import XCTest
import CoreLocation
@testable import Data

final class WeatherRemoteDatasourceImplTests: XCTestCase {
    private var sut: WeatherRemoteDatasourceImpl!

    override func setUp() {
        sut = WeatherRemoteDatasourceImpl(api: OpenWeatherMapApi())
    }

    func testRequestCreatedSuccessfull() throws {
        XCTAssertNoThrow(sut.getWeather(coordinate: CLLocationCoordinate2D(latitude: 1,longitude: 1)))
        XCTAssertNoThrow(sut.getForecast(coordinate: CLLocationCoordinate2D(latitude: 1,longitude: 1)))
    }
}
