//
//  WeatherIconView.swift
//  DaWeather
//
//  Created by Zach Eriksen on 7/10/19.
//  Copyright © 2019 Zach Eriksen. All rights reserved.
//

import SwiftUI

struct WeatherIconView : View {
    var icon: String
    
    var body: some View {
        guard let weatherIcon = WeatherIcon(rawValue: icon) else {
            return Image(systemName: "questionmark")
        }
        return weatherIcon.image
    }
}

//#if DEBUG
//struct WeatherIconView_Previews : PreviewProvider {
//    static var previews: some View {
//        WeatherIconView()
//    }
//}
//#endif
