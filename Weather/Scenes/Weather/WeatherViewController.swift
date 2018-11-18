//
//  WeatherViewController.swift
//  Weather
//
//  Created by Vladislav Kondrashkov on 10/22/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

protocol WeatherView {
    func display(currentForecast: CurrentForecast)
    func display(weekForecast: [WeekdayForecast])
    func display(timedForecast: [TimedForecast])
}

final class WeatherViewController: UIViewController, WeatherView {
    let weatherView = WeatherViewContent()
    let timedForecastDataSource = TimedForecastDataSource()
    let weekForecastDataSource = WeekForecastDataSource()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    var presenter: WeatherPresenter!
    
    override func loadView() {
        view = weatherView
        weatherView.weekForecastView.delegate = self
        weatherView.weekForecastView.dataSource = weekForecastDataSource
        weatherView.timedForecastView.delegate = self
        weatherView.timedForecastView.dataSource = timedForecastDataSource
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        
    }
    
    func display(currentForecast: CurrentForecast) {
        weatherView.cityLabel.text = currentForecast.city
        weatherView.currentTemperatureLabel.text = currentForecast.temperature
        weatherView.forecastStatusLabel.text = currentForecast.status
    }
    
    func display(weekForecast: [WeekdayForecast]) {
        weekForecastDataSource.items = []
        for forecast in weekForecast {
            weekForecastDataSource.items.append(forecast)
        }
        weatherView.weekForecastView.reloadData()
    }
    
    func display(timedForecast: [TimedForecast]) {
        timedForecastDataSource.items = []
        for forecast in timedForecast {
            timedForecastDataSource.items.append(forecast)
        }
        weatherView.timedForecastView.reloadData()
    }
}

extension WeatherViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == weatherView.timedForecastView {
            return CGSize(width: 60, height: 90)
        }
        if collectionView == weatherView.weekForecastView {
            return CGSize(width: collectionView.bounds.width, height: 40)
        }
        return CGSize.zero
    }
}
