//
//  WeatherViewModel.swift
//  PresentationIOS
//
//  Created by  on 13/6/22.
//

import Foundation
import CoreLocation
import RxSwift
import Domain

protocol WeatherViewModel: ObservableObject {
    var forecast: [WeatherDvo] { get }
    var loading: Bool { get }
    var error: Error? { get set }
    func reload()
}

class WeatherViewModelImpl: NSObject, WeatherViewModel, ObservableObject {
    //MARK: injections
    init(interactor: WeatherInteractor, coordinator: WeatherCoordinator){
        self.interactor = interactor
        self.coordinator = coordinator
    }
    private let interactor: WeatherInteractor
    private let coordinator: WeatherCoordinator

    //MARK: binding
    @Published private(set) var forecast = [WeatherDvo]()
    @Published private(set) var loading = false
    @Published var error: Error?

    func reload() {
        getMyLocation()
    }

    //MARK: private
    private let disposeBag = DisposeBag()

    private func getWeather(coordinate: CLLocationCoordinate2D) {
        loading = true
        Single.zip(
            interactor.getWeather(coordinate: coordinate)
                .map{ WeatherDvo($0) },
            interactor.getForecast(coordinate: coordinate)
                .map{ $0.map{ WeatherDvo($0) }}
        ){ today, forecast in [today] + forecast }
            .do(onSuccess: { forecast in self.forecast = forecast })
            .subscribe(
                onSuccess: {[weak self] _ in
                    self?.loading = false
                },
                onFailure: { [weak self] e in
                    self?.error = e
                }
            )
            .disposed(by: disposeBag)
    }

    // MARK: Location
    private let locationManager = CLLocationManager()
    private func getMyLocation() {
        loading = true
        locationManager.delegate = self
        locationManager.requestLocation()
    }
}

extension WeatherViewModelImpl: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        loading = false
        switch manager.authorizationStatus {
        case .notDetermined: manager.requestWhenInUseAuthorization()
        case .authorizedWhenInUse: manager.requestLocation()
        case .denied: coordinator.openSettings()
        default: self.error = error
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        loading = false
        if let coordinate = locations.first?.coordinate {
            getWeather(coordinate: coordinate)
        }
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch manager.authorizationStatus {
        case .notDetermined: manager.requestWhenInUseAuthorization()
        case .authorized: reload()
        case .denied: coordinator.openSettings()
        default: break
        }
    }
}


class WeatherViewModelMockImpl: WeatherViewModel, ObservableObject {
    var forecast: [WeatherDvo] = (1...10).map { id in
        WeatherDvo(
            date: "Date \(id)",
            temp: "\(id) F",
            humidity: "\(Float(id) * 0.8) %",
            windSpeed: "\(Float(id) * 1.2) m/s"
        )
    }
    var loading: Bool = false
    var error: Error?
    func reload() { }
}
