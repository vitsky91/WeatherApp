//
//  ViewController.swift
//  WeatherApp
//
//  Created by Vitalii Sydorskyi on 3/20/19.
//  Copyright © 2019 Vitalii Sydorskyi. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    
    let locationManager = CLLocationManager()
    let networkManager = NetworkManager()
    
    var currentLocation = CLLocation()
    
    var spinnerView: UIView!
    
    @IBOutlet weak var temperature: UILabel!
    @IBOutlet weak var humidity: UILabel!
    @IBOutlet weak var pressure: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.showSpinner(onView: self.view)
        self.getLocation()
    }
    
    func getLocation() {
        let isServiceEnabled: Bool = CLLocationManager.locationServicesEnabled()
        let autorizationStatus = CLLocationManager.authorizationStatus()
        
        if isServiceEnabled {
            if autorizationStatus == .denied ||
                autorizationStatus == .notDetermined ||
                autorizationStatus == .restricted {
                locationManager.requestWhenInUseAuthorization()
            }
            
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.delegate = self
            locationManager.startUpdatingLocation()
        } else {
            print("Please enable location service")
        }
    }
    
    func setWeather() {
        networkManager.getWeatherByCoordinates(currentLocation.coordinate.latitude,
                                               currentLocation.coordinate.longitude)
        { (currentWeather) in
            if let currentWeather = currentWeather {
                DispatchQueue.main.async {
                    if let temperature = currentWeather.temperature {
                        self.temperature.text = "\(temperature)°"
                    } else {
                        self.temperature.text = "-"
                    }
                    
                    if let humidity = currentWeather.humidity {
                        self.humidity.text = "\(humidity)"
                        self.humidity.sizeToFit()
                    } else {
                        self.humidity.text = "-"
                    }
                    
                    if let pressure = currentWeather.pressure {
                        self.pressure.text = "\(pressure) gPa"
                        self.pressure.sizeToFit()
                    } else {
                        self.pressure.text = "-"
                    }
                }
                self.removeSpinner()
            }
        }
    }
    
    override var prefersStatusBarHidden: Bool { return true }
    
}

extension ViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        locationManager.stopUpdatingLocation()
        if let location = locations.first {
            self.currentLocation = location
        }
        
        self.setWeather()
    }
    
}
