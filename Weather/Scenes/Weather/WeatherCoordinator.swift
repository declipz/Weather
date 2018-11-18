//
//  WeatherCoordinator.swift
//  Weather
//
//  Created by Vladislav Kondrashkov on 11/18/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

class WeatherCoordinator: Coordinator {
    private var presenter: WeatherPresenter!
    private var view: WeatherView!
    private var service: OpenWeatherService
    private var window: UIWindow
    
    init(window: UIWindow, service: OpenWeatherService) {
        self.window = window
        self.service = service
    }
    
    func start() {
        let viewController = WeatherViewController()
        view = viewController
        presenter = WeatherPresenterImplementation(view: view)
        window.rootViewController = viewController
        window.makeKeyAndVisible()
    }
}
