import XCTest
import RxSwift
import RxBlocking
import CoreLocation
import Common
@testable import Domain

final class WeatherInteractorImplTests: XCTestCase {
    private var sut: WeatherInteractorImpl!

    override func setUp() {
        sut = WeatherInteractorImpl(remoteDS: MockDS() as WeatherRemoteDatasource)
    }


    func testGetWeatherSuccessfull(){
        let data = try? sut
            .getWeather(coordinate: CLLocationCoordinate2D(latitude: 1, longitude: 1))
            .toBlocking(timeout: 1)
            .first()
        XCTAssertEqual(data?.mainModel?.humidity, 42)
    }

    func testGetForecastSuccessfull(){
        let data = try? sut
            .getForecast(coordinate: CLLocationCoordinate2D(latitude: 1, longitude: 1))
            .toBlocking(timeout: 1)
            .first()
        XCTAssertEqual(data?.count, 2)

    }
}
