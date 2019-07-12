//
//  Weather.swift
//  DaWeather
//
//  Created by Zach Eriksen on 7/3/19.
//  Copyright © 2019 Zach Eriksen. All rights reserved.
//

import Foundation
import SwiftUI

// MARK: - TodayWeather
struct TodayWeather: Codable {
    let coord: Coord?
    let weather: [Weather]?
    let base: String?
    let main: Main?
    let visibility: Int?
    let wind: Wind?
    let clouds: Clouds?
    let dt: Int?
    let sys: Sys?
    let timezone, id: Int?
    let name: String?
    let cod: Int?
}

// MARK: - Clouds
struct Clouds: Codable {
    let all: Int?
}

// MARK: - Coord
struct Coord: Codable {
    let lon, lat: Double?
}

// MARK: - Main
struct Main: Codable {
    let temp: Double?
    let pressure, humidity: Int?
    let tempMin, tempMax: Double?
    
    enum CodingKeys: String, CodingKey {
        case temp, pressure, humidity
        case tempMin = "temp_min"
        case tempMax = "temp_max"
    }
}

// MARK: - Sys
struct Sys: Codable {
    let type, id: Int?
    let message: Double?
    let country: String?
    let sunrise, sunset: Int?
}

// MARK: - Weather
struct Weather: Codable {
    let id: Int?
    let main, weatherDescription, icon: String?
    
    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
    
    
}

// MARK: - Wind
struct Wind: Codable {
    let speed: Double?
    let deg: Double?
    let gust: Double?
}


enum WeatherIcon: String {
    case d_clearSky = "01d"
    case d_fewClouds = "02d"
    case d_scatteredClouds = "03d"
    case d_brokenClouds = "04d"
    case d_showerRain = "09d"
    case d_rain = "10d"
    case d_thunderstorm = "11d"
    case d_snow = "13d"
    case d_mist = "50d"
    case n_clearSky = "01n"
    case n_fewClouds = "02n"
    case n_scatteredClouds = "03n"
    case n_brokenClouds = "04n"
    case n_showerRain = "09n"
    case n_rain = "10n"
    case n_thunderstorm = "11n"
    case n_snow = "13n"
    case n_mist = "50n"
    
    var image: Image {
        switch self {
        case .d_clearSky:
            return Image(systemName: "sun.max")
        case .n_clearSky:
            return Image(systemName: "moon")
        case .d_fewClouds, .d_brokenClouds, .d_scatteredClouds:
            return Image(systemName: "sun.cloud.fill")
        case .n_fewClouds, .n_brokenClouds, .n_scatteredClouds:
            return Image(systemName: "cloud")
        case .d_rain:
            return Image(systemName: "cloud.heavyrain.fill")
        case .n_rain:
            return Image(systemName: "cloud.heavyrain")
        case .d_showerRain:
            return Image(systemName: "cloud.rain.fill")
        case .n_showerRain:
            return Image(systemName: "cloud.rain")
        case .d_snow, .n_snow:
            return Image(systemName: "snow")
        case .d_mist:
            return Image(systemName: "cloud.fog.fill")
        case .n_mist:
            return Image(systemName: "cloud.fog")
            
        default:
            return Image(systemName: "questionmark")
        }
    }
}
