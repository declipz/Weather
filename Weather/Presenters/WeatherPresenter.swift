//
//  WeatherPresenter.swift
//  Weather
//
//  Created by Vladislav Kondrashkov on 10/22/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

protocol WeatherPresenter {
    func updateData()
}

class WeatherPresenterImplementation: WeatherPresenter {
    let view: WeatherView?
    var currentCity: String?
    var forecastStatus: String?
    var currentTemperature: Int?
    
    init(view: WeatherView) {
        self.view = view
        view.delegate = self
        updateData()
    }
    
    func updateData() {
        currentCity = "Minsk"
        forecastStatus = "Partly cloudly"
        currentTemperature = 2
    }
}

private typealias WeatherDelegateImplementation = WeatherPresenterImplementation
extension WeatherDelegateImplementation: WeatherDelegate {
    func updateCityLabel(cityLabel: UILabel) {
        cityLabel.text = currentCity
    }
    
    func updateForecastStatusLabel(forecastStatusLabel: UILabel) {
        forecastStatusLabel.text = forecastStatus
    }
    
    func updateCurrentTemperature(currentTemperatureLabel: UILabel) {
        currentTemperatureLabel.text = String(currentTemperature ?? 0) + "°"
    }
}
