//
//  WeatherViewController.swift
//  Weather
//
//  Created by Vladislav Kondrashkov on 10/22/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

protocol WeatherView {
    func display(currentCity: String?)
    func display(forecastStatus: String?)
    func display(currentTemperature: Int?)
    func display(weekForecast: [WeekdayForecast])
    func display(timedForecast: [TimedForecast])
}

final class WeatherViewController: UIViewController, WeatherView {
    
    let weatherView = WeatherViewImplementation()
    let timedForecastDataSource = TimedForecastDataSource()
    let weekForecastDataSource = WeekForecastDataSource()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    var presenter: WeatherPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = weatherView
        weatherView.weekForecastView.delegate = self
        weatherView.weekForecastView.dataSource = weekForecastDataSource
        weatherView.timedForecastView.delegate = self
        weatherView.timedForecastView.dataSource = timedForecastDataSource
        
        presenter = WeatherPresenterImplementation(view: self)
        presenter.viewDidLoad()
    }
    
    func display(currentCity: String?) {
        weatherView.cityLabel.text = currentCity
    }
    
    func display(forecastStatus: String?) {
        weatherView.forecastStatusLabel.text = forecastStatus
    }
    
    func display(currentTemperature: Int?) {
        guard let currentTemperature = currentTemperature else { return }
        weatherView.currentTemperatureLabel.text = String(currentTemperature) + "°"
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
        guard let view = view as? WeatherViewImplementation else { return CGSize.zero }
        if collectionView == view.timedForecastView {
            return CGSize(width: 60, height: 90)
        }
        if collectionView == view.weekForecastView {
            return CGSize(width: collectionView.bounds.width, height: 40)
        }
        return CGSize.zero
    }
}
