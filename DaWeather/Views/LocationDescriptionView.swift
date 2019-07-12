//
//  LocationDescriptionView.swift
//  DaWeather
//
//  Created by Zach Eriksen on 7/12/19.
//  Copyright © 2019 Zach Eriksen. All rights reserved.
//

import SwiftUI

struct LocationDescriptionView : View {
    @ObjectBinding var model: WeatherModel
    
    var body: some View {
        VStack {
        if model.weather == nil {
            LoadingView()
        } else {
            VStack(alignment: .leading) {
                Text("\(model.weather?.name ?? "???")").font(.largeTitle)
                // Array of Weather
                Text("\(model.weather?.weather?.first?.main ?? "???")")
                // Temp
                Text(model.temp)
                    .font(.largeTitle)
                Divider()
                // Humidity
                Text("Humidity: \(model.weather?.main?.humidity ?? 0)")
                Divider()
                HStack {
                    Text("min: \(model.tempMin)")
                    Spacer()
                    Text("-")
                    Spacer()
                    Text("max: \(model.tempMax)")
                }
                Divider()
                
            }
        }
        }
    }
}

//#if DEBUG
//struct LocationDescriptionView_Previews : PreviewProvider {
//    static var previews: some View {
//        LocationDescriptionView()
//    }
//}
//#endif
