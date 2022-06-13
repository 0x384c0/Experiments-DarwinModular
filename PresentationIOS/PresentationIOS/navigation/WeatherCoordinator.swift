//
//  WeatherCoordinator.swift
//  PresentationIOS
//
//  Created by  on 13/6/22.
//

import UIKit
import CloudKit

class WeatherCoordinator{
    func openSettings() {
        let alert = UIAlertController(
            title: "LOCATION_ALERT_TEXT".localized,
            message: "LOCATION_ALERT_BUTTON".localized,
            preferredStyle: .actionSheet
        )
        alert.addAction(UIAlertAction(title: "OK".localized, style: .default, handler: { _ in
            self.openSystemSettings()
        }))
        let root = UIApplication.shared.connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .flatMap { $0.windows }
            .first { $0.isKeyWindow }?
            .rootViewController
        if let root = root {
            root.present(alert, animated: true)
        } else {
            openSystemSettings()
        }
    }

    private func openSystemSettings(){
        if let settingsUrl = URL(string: UIApplication.openSettingsURLString)  {
            UIApplication.shared.open(settingsUrl, options: [:]) { _ in}
        }
    }
}
