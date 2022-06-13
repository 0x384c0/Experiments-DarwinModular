//
//  ContentView.swift
//  PresentationIOS
//
//  Created by on 13/6/22.
//

import SwiftUI

struct WeatherView<VM: WeatherViewModel>: View {
    @StateObject var viewModel: VM
    
    var body: some View {
        if viewModel.loading {
            VStack{
                Spacer()
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                Spacer()
            }
        }
        List(viewModel.forecast, id: \.date) { forecastDvo in
            WeatherItemRow(dvo: forecastDvo)
                .padding()
        }
        .errorAlert(error: $viewModel.error)
        .onAppear(perform: { viewModel.reload() })
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(viewModel: WeatherViewModelMockImpl())
    }
}
