//
//  WeatherViewModel.swift
//  PresentationMacOS
//
//  Created by a on 9/5/22.
//

import Foundation
import CoreLocation
import RxSwift
import AppKit
import Domain

class WeatherViewModel: NSObject {
    //MARK: injections
    init(interactor: WeatherInteractor, coordinator: WeatherCoordinator){
        self.interactor = interactor
        self.coordinator = coordinator
    }
    private let interactor: WeatherInteractor
    private let coordinator: WeatherCoordinator

    //MARK: binding
    let loading = PublishSubject<Bool>()
    let error = PublishSubject<Error>()
    let weather = PublishSubject<WeatherDvo>()
    let forecast = PublishSubject<[WeatherDvo]>()

    func reload() {
        getMyLocation()
    }

    //MARK: private
    private let disposeBag = DisposeBag()

    private func getWeather(coordinate: CLLocationCoordinate2D) {
        loading.onNext(true)
        Single.zip(
            interactor.getWeather(coordinate: coordinate)
                .map{ WeatherDvo($0) }
                .do(onSuccess: { [weak self] model in self?.weather.onNext(model) }),
            interactor.getForecast(coordinate: coordinate)
                .map{ $0.map{ WeatherDvo($0) }}
                .do(onSuccess: { [weak self] model in self?.forecast.onNext(model) })
        ){_,_ in }
            .subscribe(
                onSuccess: {[weak self] _ in
                    self?.loading.onNext(false)
                },
                onFailure: { [weak self] e in
                    self?.error.onNext(e)
                }
            )
            .disposed(by: disposeBag)
    }

    // MARK: Location
    private let locationManager = CLLocationManager()
    private func getMyLocation() {
        locationManager.delegate = self
        locationManager.requestLocation()
    }
}


extension WeatherViewModel: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        switch manager.authorizationStatus{
        case .notDetermined: manager.requestLocation()
        case .denied: coordinator.openSettings()
        default: self.error.onNext(error)
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let coordinate = locations.first?.coordinate {
            getWeather(coordinate: coordinate)
        }
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch manager.authorizationStatus {
        case .authorized: reload()
        default: coordinator.openSettings()
        }
    }
}
