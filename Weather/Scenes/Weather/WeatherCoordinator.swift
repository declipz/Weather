//
//  WeatherCoordinator.swift
//  Weather
//
//  Created by Vladislav Kondrashkov on 11/18/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

class WeatherCoordinator: Coordinator {
    private var window: UIWindow
    private var weatherViewController = WeatherViewController()
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let service = OpenWeatherServiceImplementation()
        let presenter = WeatherPresenterImplementation(view: weatherViewController, service: service)
        weatherViewController.presenter = presenter
        window.rootViewController = weatherViewController
        window.makeKeyAndVisible()
    }
}
