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
    
    /// Check for first launch -> in future can be used for adjusting language used NSLocalizedString or city pick or smth else what needed on first app launch
    /// - Returns: returns first run or not
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
