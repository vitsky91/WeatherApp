//
//  Extensions.swift
//  WeatherApp
//
//  Created by Vitalii Sydorskyi on 3/25/19.
//  Copyright © 2019 Vitalii Sydorskyi. All rights reserved.
//

import Foundation
import UIKit

extension ViewController {
    
    func showSpinner(onView: UIView) {
        let spinnerView = UIView(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let activityIndicator = UIActivityIndicatorView(style: .whiteLarge)
        activityIndicator.startAnimating()
        activityIndicator.center = spinnerView.center
        
        DispatchQueue.main.async {
            spinnerView.addSubview(activityIndicator)
            onView.addSubview(spinnerView)
        }
        
        self.spinnerView = spinnerView
    }
    
    func removeSpinner() {
        DispatchQueue.main.async {
            if self.spinnerView != nil {
                self.spinnerView.removeFromSuperview()
                self.spinnerView = nil
            }
        }
    }
    
}
