//
//  ViewController.swift
//  PresentationMacOS
//
//  Created by a on 9/5/22.
//

import Cocoa
import RxSwift
import Domain
import Common

class WeatherViewController: NSViewController {
    // MARK: UI
    @IBOutlet weak var temp: NSTextField!
    @IBOutlet weak var humidity: NSTextField!
    @IBOutlet weak var windSpeed: NSTextField!
    @IBOutlet weak var forecastCollectionView: NSCollectionView!
    @IBOutlet weak var loadingIndicator: NSProgressIndicator!

    // MARK: UI LifeCYcle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollection()
        bindViewModel()
    }

    override func viewDidAppear() {
        viewModel.reload()
    }

    // MARK: MVVM
    private let viewModel = WeatherViewModel(
        interactor: DIContainer.shared.resolve(WeatherInteractor.self)!,
        coordinator: DIContainer.shared.resolve(WeatherCoordinator.self)!
    )
    private let disposeBag = DisposeBag()
    private var forecast = [WeatherDvo]()
    private  func bindViewModel(){
        viewModel.weather
            .observe(on: MainScheduler.instance)
            .subscribe {[weak self] event in
                guard let self = self else { return }
                if let data = event.element {
                    self.temp.stringValue = data.temp
                    self.humidity.stringValue = data.humidity
                    self.windSpeed.stringValue = data.windSpeed
                }
            }
            .disposed(by: disposeBag)
        viewModel.forecast
            .observe(on: MainScheduler.instance)
            .subscribe {[weak self] event in
                self?.forecast = event.element ?? []
                self?.forecastCollectionView.reloadData()
            }
            .disposed(by: disposeBag)
        viewModel.error
            .observe(on: MainScheduler.instance)
            .subscribe {event in
                if let error  = event.element{
                    NSAlert(error: error).runModal()
                }
            }
            .disposed(by: disposeBag)
        viewModel.loading
            .observe(on: MainScheduler.instance)
            .subscribe {[weak self] event in
                if event.element ?? false {
                    self?.loadingIndicator.startAnimation(nil)
                } else {
                    self?.loadingIndicator.stopAnimation(nil)
                }
            }
            .disposed(by: disposeBag)
    }

    // MARK: Other
    private func setupCollection(){
        forecastCollectionView.register(NSNib(nibNamed: ForecastItem.nubName, bundle: nil), forItemWithIdentifier: ForecastItem.identifier)
    }
}

extension WeatherViewController: NSCollectionViewDelegate, NSCollectionViewDataSource {
    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        forecast.count
    }

    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        guard let item = collectionView.makeItem(withIdentifier: ForecastItem.identifier, for: indexPath) as? ForecastItem else { return NSCollectionViewItem()}
        item.setData(data: forecast[indexPath.item])
        return item
    }
}
