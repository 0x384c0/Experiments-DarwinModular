//
//  WeatherItemRow.swift
//  PresentationIOS
//
//  Created by  on 13/6/22.
//

import SwiftUI

struct WeatherItemRow: View {
    let dvo: WeatherDvo

    var body: some View {
        VStack{
            Text(dvo.date)
            VStack(alignment: .leading) {
                HStack {
                    Text("Temperature:")
                    Spacer()
                    Text(dvo.temp)
                }
                Spacer(minLength: 8)
                HStack {
                    Text("Humidity:")
                    Spacer()
                    Text(dvo.humidity)
                }
                Spacer(minLength: 8)
                HStack {
                    Text("Wind Speed:")
                    Spacer()
                    Text(dvo.windSpeed)
                }
            }
        }
    }
}
