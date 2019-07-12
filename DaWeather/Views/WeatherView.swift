//
//  WeatherView.swift
//  DaWeather
//
//  Created by Zach Eriksen on 7/3/19.
//  Copyright © 2019 Zach Eriksen. All rights reserved.
//

import SwiftUI
import Combine

class WeatherModel: BindableObject {
    var didChange = PassthroughSubject<Void, Never>()
    
    var weather: TodayWeather? {
        didSet {
            didChange.send(())
        }
    }
    
    // MARK: Tempurature
    var temp: String {
        "\(kelvinToFahrenheit(weather?.main?.temp ?? 0))"
    }
    
    var tempMin: String {
        "\(kelvinToFahrenheit(weather?.main?.tempMin ?? 0))"
    }
    
    var tempMax: String {
        "\(kelvinToFahrenheit(weather?.main?.tempMax ?? 0))"
    }
    
    func kelvinToFahrenheit(_ k: Double) -> String {
        String(format: "%0.2f °F", ((k - 273.15) * (9.0/5.0)) + 32.0)
    }
    
    func getWeather(zip: String) {
        guard let zipInt = Int(zip) else {
            print("\(zip) is not an Int")
            return
        }
        WeatherService.shared.getWeather(forZip: zipInt) { (result) in
            switch result {
            case .success(let weather):
                self.weather = weather
            case .failure(let error):
                print(error)
            }
        }
    }
}


struct WeatherView: View {
    @ObjectBinding var model = WeatherModel()
    
    var location: String
    
    var icon: String {
        model.weather?.weather?.first?.icon ?? "questionmark"
    }
    
    var body: some View {
        VStack {
            WeatherIconView(icon: icon)
                .foregroundColor(Color.yellow)
                .font(.custom("sun", size: 100))
                .padding()
            LocationDescriptionView(model: model)
        }
        .padding()
            .navigationBarTitle(Text(location))
            .onAppear {
                self.load()
        }
    }
    
    func load() {
        model.getWeather(zip: location)
    }
}
