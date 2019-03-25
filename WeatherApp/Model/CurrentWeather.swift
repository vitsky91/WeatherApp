//
//  CurrentWeather.swift
//  WeatherApp
//
//  Created by Vitalii Sydorskyi on 3/20/19.
//  Copyright © 2019 Vitalii Sydorskyi. All rights reserved.
//

import Foundation

class CurrentWeather {
    
    ///Temporary model
    var temperature: Int?
    var humidity: Int?
    var pressure: Int?
    
    struct WeatherKeys {
        static let temperature = "temp"
        static let humidity = "humidity"
        static let pressure = "pressure"
    }
    
    init(weatherDictionary: [String:Any]) {
        if let temp = weatherDictionary[WeatherKeys.temperature] as? Double { temperature = Int(temp) }
        humidity = weatherDictionary[WeatherKeys.humidity] as? Int
        pressure = weatherDictionary[WeatherKeys.pressure] as? Int
    }
}
