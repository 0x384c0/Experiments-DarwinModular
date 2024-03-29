# Weather App
A sample darwin app that shows today weather and forecast for current device location

![tests workflow](https://github.com/0x384c0/Experiments-DarwinModular/actions/workflows/build-darwin.yml/badge.svg)

<img src="/media/app.jpg" height="300"> <img src="/media/app_ios.jpeg" height="300">

### Build Requirements
- Xcode 13.2.1

### Modules
App has single feature - WeatherApp\
Feature split in to 4 modules
- [PresentationMacOS](/PresentationMacOS) - contains MacOS Presentation Layer
- [PresentationIOS](/PresentationIOS) - contains iOS Presentation Layer
- [Domain](/Domain) - contains Domain layer with business logic
- [Data](/Data) - contains Data layer with REST API requests
  
### Communication between layers

1. UI ([MacOS](/PresentationMacOS/PresentationMacOS/ui/WeatherViewController.swift)/[iOS](/PresentationIOS/PresentationIOS/ui/WeatherView.swift)) calls functions from ViewModel ([MacOS](/PresentationMacOS/PresentationMacOS/ui/WeatherViewModel.swift)/[iOS](/PresentationIOS/PresentationIOS/ui/WeatherViewModel.swift)).
1. ViewModel executes Use cases from [Interactor](/Domain/Sources/Domain/interactors/WeatherInteractorImpl.swift).
1. Use case obtains data from [DataSource](/Data/Sources/Data/datasource/WeatherRemoteDatasourceImpl.swift)
1. Repository returns data from a [Api](/Data/Sources/Data/datasource/api/OpenWeatherMapApi.swift).
1. Information flows back to the UI to be displayed.

### Dependencies

1. [RxSwift](https://github.com/ReactiveX/RxSwift.git)
1. [Swinject](https://github.com/Swinject/Swinject.git)
1. [Alamofire](https://github.com/Alamofire/Alamofire.git)

### Test coverage
- [domain](/Domain/Tests/DomainTests/WeatherInteractorImplTests.swift)
- [data source](/Data/Tests/DataTests/WeatherRemoteDatasourceImplTests.swift)
- [data mapping](/PresentationMacOS/Tests/WeatherDvoTests.swift)

### TODO
- replace https://openweathermap.org/api with https://www.weatherapi.com/
- make a fancy app design, based on weatherapi.com icons
- add swiftlint
- use [dedicated data mappers](https://medium.com/jesus-medina/mapping-data-between-layers-db8ad93f0f8f) for each layer instead of protocol inheritance 
