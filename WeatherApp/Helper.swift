//
//  Helper.swift
//  WeatherApp
//
//  Created by Vitalii Sydorskyi on 3/20/19.
//  Copyright © 2019 Vitalii Sydorskyi. All rights reserved.
//

import Foundation
import UIKit

class Helper {
    
    
    //Check for first launch -> in future can be used for adjusting language
    static func isFirstRun() -> Bool {
        let launchedBefore = UserDefaults.standard.bool(forKey: "launchedBefore")
        if launchedBefore {
            print("already was launched before")
            return launchedBefore
        } else {
            print("first launch!")
            UserDefaults.standard.set(true, forKey: "launchedBefore")
            return launchedBefore
        }
    }
    
}
