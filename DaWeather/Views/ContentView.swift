//
//  ContentView.swift
//  DaWeather
//
//  Created by Zach Eriksen on 6/26/19.
//  Copyright © 2019 Zach Eriksen. All rights reserved.
//

import SwiftUI
import Combine

struct ContentView : View {
    @State var location: String = ""
    @State var isShown: Bool = false
    
    
    var isValid: Bool {
        location.count == 5 &&
            0 != Int(location) ?? 0
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                VStack(alignment: .leading) {
                    Text("What is DaWeather?")
                        .font(.title)
                    Text("Please enter a valid zip code")
                        .font(.footnote)
                    TextField("68154", text: $location)
                                        .textFieldStyle(.roundedBorder)
                }
                    
                Spacer()
                
                VStack {
                    NavigationLink(destination: WeatherView(location: location)) {
                        Text("Check DaWeather")
                    }
                    
                    Divider()
                    
                    PresentationLink(destination: WeatherView(location: location)) {
                        Text("Present DaWeather")
                    }
                }
                .disabled(!isValid)
            }
            .navigationBarTitle(Text("DaWeather"))
            .padding()
            
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
