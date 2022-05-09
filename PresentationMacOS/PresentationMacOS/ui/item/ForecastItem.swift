//
//  ForecastItem.swift
//  PresentationMacOS
//
//  Created by a on 11/5/22.
//

import Cocoa

class ForecastItem: NSCollectionViewItem {
    static let nubName = "ForecastItem"
    static let identifier = NSUserInterfaceItemIdentifier(rawValue: "ForecastItem")

    @IBOutlet weak var date: NSTextField!
    @IBOutlet weak var temp: NSTextField!
    @IBOutlet weak var humidity: NSTextField!
    @IBOutlet weak var windSpeed: NSTextField!

    func setData(data: WeatherDvo) {
        date.stringValue = data.date
        temp.stringValue = data.temp
        humidity.stringValue = data.humidity
        windSpeed.stringValue = data.windSpeed
    }
}
