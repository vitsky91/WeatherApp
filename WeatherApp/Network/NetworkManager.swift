//
//  NetworkRequest.swift
//  WeatherApp
//
//  Created by Vitalii Sydorskyi on 3/20/19.
//  Copyright © 2019 Vitalii Sydorskyi. All rights reserved.
//

import Foundation
import Alamofire

final class NetworkManager {
    
    func getWeatherByCoordinates(_ lat: Double, _ lon: Double, completion: @escaping (CurrentWeather?) -> Void) {
        
        /// Setup request parameters
        let keyAPI = "213a683e43f9c04006135217e02dda1b"
        let systemOfMeasurement = "metric" //From API: Temperature is available in Fahrenheit(imperial), Celsius(metric) and Kelvin(leave empty - used by default) units
        
        let openweatherURL = "https://api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(lon)&appid=\(keyAPI)&units=\(systemOfMeasurement)"
        
        /// Request
        Alamofire.request(openweatherURL).responseJSON { (response) in
            if let jsonDictionary = response.result.value as? [String : Any] {
                /// Parse weather
                if let weatherDictionary = jsonDictionary["main"] as? [String : Any] {
                    let currentWeather = CurrentWeather(weatherDictionary: weatherDictionary)
                    completion(currentWeather)
                } else {
                    completion(nil)
                }
            }
        }
    }
    
}
