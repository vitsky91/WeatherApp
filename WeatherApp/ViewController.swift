//
//  ViewController.swift
//  WeatherApp
//
//  Created by Vitalii Sydorskyi on 3/20/19.
//  Copyright © 2019 Vitalii Sydorskyi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UISearchResultsUpdating {
    
    let request = NetworkRequest()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationController()
    }
    
    fileprivate func setupNavigationController() {
        self.navigationItem.title = "Weather App"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        
    }
    
    
    //MARK: - UISearchResultsUpdating
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
    
    @IBAction func click() {
        request.parser()
        print("vasya")
    }
    
}

