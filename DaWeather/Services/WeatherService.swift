//
//  WeatherService.swift
//  DaWeather
//
//  Created by Zach Eriksen on 7/3/19.
//  Copyright © 2019 Zach Eriksen. All rights reserved.
//

import Foundation


struct WeatherService {
    private let base = "https://api.openweathermap.org/data/2.5/weather?"
    private let key = "fee115205fbe7fe93bae2a86baad8e7f"
    private let decoder = JSONDecoder()
    
    static let shared = WeatherService()
    
    enum APIError: Error {
        case noResponse
        case jsonDecodingError(error: Error)
        case networkError(error: Error)
    }
    
    /*
     /// https://samples.openweathermap.org/data/2.5/weather?zip=94040&appid=fee115205fbe7fe93bae2a86baad8e7f
     {
     "coord": {"lon": -122.08,"lat": 37.39},
     "weather": [
     {
     "id": 800,
     "main": "Clear",
     "description": "clear sky",
     "icon": "01d"
     }
     ],
     "base": "stations",
     "main": {
     "temp": 296.71,
     "pressure": 1013,
     "humidity": 53,
     "temp_min": 294.82,
     "temp_max": 298.71
     },
     "visibility": 16093,
     "wind": {
     "speed": 1.5,
     "deg": 350
     },
     "clouds": {
     "all": 1
     },
     "dt": 1560350645,
     "sys": {
     "type": 1,
     "id": 5122,
     "message": 0.0139,
     "country": "US",
     "sunrise": 1560343627,
     "sunset": 1560396563
     },
     "timezone": -25200,
     "id": 420006353,
     "name": "Mountain View",
     "cod": 200
     }
     */
    func getWeather(forZip zip: Int, completionHandler: @escaping (Result<TodayWeather, APIError>) -> Void) {
        var components = URLComponents(url: URL(string: base)!, resolvingAgainstBaseURL: true)!
        components.queryItems = [
            URLQueryItem(name: "zip", value: "\(zip)"),
            URLQueryItem(name: "appid", value: key)
        ]
        
        var request = URLRequest(url: components.url!)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                DispatchQueue.main.async {
                    completionHandler(.failure(.noResponse))
                }
                return
            }
            guard error == nil else {
                DispatchQueue.main.async {
                    completionHandler(.failure(.networkError(error: error!)))
                }
                return
            }
            do {
                let object = try self.decoder.decode(TodayWeather.self, from: data)
                DispatchQueue.main.async {
                    completionHandler(.success(object))
                }
            } catch let error {
                DispatchQueue.main.async {
                    completionHandler(.failure(.jsonDecodingError(error: error)))
                }
            }
        }
        task.resume()
    }
}
