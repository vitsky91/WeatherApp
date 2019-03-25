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
    
    /// Loading spinner
    ///
    /// - Parameter onView: in what view we should show loading spinner
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

    /// Show alert
    ///
    /// - Parameters:
    ///   - onView: on what view controller should show alert
    ///   - title: title of alert view
    ///   - message: message of alert view
    ///   - animated: should alert shows animated
    ///   - completion: what should we do after, default - nothing(nil)
    func showAlert(onView: UIViewController,
                   title: String,
                   message: String,
                   animated: Bool,
                   completion: (() -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        onView.present(alert, animated: animated, completion: completion)
    }
    
}
