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
    
    var presenter: WeatherPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
        let weatherView = WeatherView()
        presenter = WeatherPresenterImplementation(view: weatherView)
        presenter.configureTimedForecastCollectionView()
        presenter.configureWeekForecastCollectionView()
        presenter.viewDidLoad()
        self.view = weatherView
    }
}

