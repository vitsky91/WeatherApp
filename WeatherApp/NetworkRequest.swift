//
//  NetworkRequest.swift
//  WeatherApp
//
//  Created by Vitalii Sydorskyi on 3/20/19.
//  Copyright © 2019 Vitalii Sydorskyi. All rights reserved.
//

import Foundation
import Alamofire

class NetworkRequest {
    
    let city = "Zaporizhzhya"
    let keyAPI = "213a683e43f9c04006135217e02dda1b"
    
    func parser() {
        let openweatherURL = "https://api.openweathermap.org/data/2.5/forecast?q=\(city)&appid=\(keyAPI)"
        
        Alamofire.request(openweatherURL).responseJSON { (response) in
            
            if let json = response.result.value {
//                print("JSON: \(json)") // serialized json response

            }
            
        }
    }
    
}
