//
//  AppCoordinator.swift
//  Weather
//
//  Created by Vladislav Kondrashkov on 11/18/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

protocol Coordinator {
    func start()
}

class AppCoordinator: Coordinator {
    private let service: OpenWeatherService
    private let window: UIWindow
    
    init(window: UIWindow, service: OpenWeatherService) {
        self.window = window
        self.service = service
    }
    
    func start() {
        let weatherCoordinator = WeatherCoordinator(window: window, service: service)
        weatherCoordinator.start()
    }
}
