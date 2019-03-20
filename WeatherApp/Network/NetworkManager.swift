//
//  NetworkRequest.swift
//  WeatherApp
//
//  Created by Vitalii Sydorskyi on 3/20/19.
//  Copyright © 2019 Vitalii Sydorskyi. All rights reserved.
//

import Foundation
import Alamofire

class NetworkManager {
    
    static func getWeather() {
        
        let city = "Zaporizhzhya"
        let keyAPI = "213a683e43f9c04006135217e02dda1b"
        
        let openweatherURL = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(keyAPI)"
        
        Alamofire.request(openweatherURL).responseJSON { (response) in
            let jsonDictionary = response.result.value as? [String : Any]
            print(jsonDictionary)
            
        }
    }
    
}
