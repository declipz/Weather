//
//  WeatherPresenter.swift
//  Weather
//
//  Created by Vladislav Kondrashkov on 10/22/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import Foundation

protocol WeatherPresenter {
    func viewDidLoad()
    func updateData()
    func updateCityLabel()
    func updateForecastStatusLabel()
    func updateCurrentTemperature()
}

class WeatherPresenterImplementation: WeatherPresenter {
    let view: WeatherView?
    var currentCity: String?
    var forecastStatus: String?
    var currentTemperature: Int?
    
    init(view: WeatherView) {
        self.view = view
    }
    
    func viewDidLoad() {
        updateData()
        updateCityLabel()
        updateForecastStatusLabel()
        updateCurrentTemperature()
    }
    
    func updateData() {
        currentCity = "Minsk"
        forecastStatus = "Partly cloudly"
        currentTemperature = 2
    }
    
    func updateCityLabel() {
        view?.display(city: currentCity)
    }
    
    func updateForecastStatusLabel() {
        view?.display(forecastStatus: forecastStatus)
    }
    
    func updateCurrentTemperature() {
        view?.display(currentTemperature: currentTemperature)
    }
}
