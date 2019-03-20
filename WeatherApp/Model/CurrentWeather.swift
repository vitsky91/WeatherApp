//
//  CurrentWeather.swift
//  WeatherApp
//
//  Created by Vitalii Sydorskyi on 3/20/19.
//  Copyright © 2019 Vitalii Sydorskyi. All rights reserved.
//

import Foundation

class CurrentWeather {
    var temp: Int
    var tempMin: Int
    var tempMax: Int
    
    struct WeatherKeys {
        static let temp = "temp"
        static let tempMin = "tempMin"
        static let tempMax = "tempMax"
    }
    
    init(weatherDictionary: [String:Any]) {
        temp = weatherDictionary[WeatherKeys.temp] as! Int
        tempMin = weatherDictionary[WeatherKeys.tempMin] as! Int
        tempMax = weatherDictionary[WeatherKeys.tempMax] as! Int
    }
    
    /*
     
     
 
     */
    
}
