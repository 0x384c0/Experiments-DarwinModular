//
//  WeatherCoordinator.swift
//  PresentationMacOS
//
//  Created by a on 11/5/22.
//

import Cocoa
import Common

class WeatherCoordinator {
    func openSettings() {
        if let window = NSApplication.shared.windows.first{
            let alert = NSAlert()
            alert.messageText = "LOCATION_ALERT_TEXT".localized
            alert.addButton(withTitle: "LOCATION_ALERT_BUTTON".localized)
            alert.beginSheetModal(for: window) { _ in
                if let url = URL(string: "x-apple.systempreferences:com.apple.preference.security?Privacy"){
                    NSWorkspace.shared.open(url)
                }
            }
        }
    }
}
