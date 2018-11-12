//
//  WeatherViewController.swift
//  Weather
//
//  Created by Vladislav Kondrashkov on 10/22/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

final class WeatherViewController: UIViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    var timedForecastPresenter: TimedForecastPresenter?
    var weekForecastPresenter: WeekForecastPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let weatherView = WeatherView()
        timedForecastPresenter = TimedForecastPresenterImplementation()
        weekForecastPresenter = WeekForecastPresenterImplementation()
        
        timedForecastPresenter?.configure(collectionView: weatherView.timedForecastView)
        weekForecastPresenter?.configure(collectionView: weatherView.weekForecastView)

        self.view = weatherView
    }
}

