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
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let weatherCoordinator = WeatherCoordinator(window: window)
        weatherCoordinator.start()
    }
}
