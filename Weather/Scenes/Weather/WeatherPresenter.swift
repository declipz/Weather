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
    func configureWeekForecastCollectionView(delegate: WeatherViewController)
    func configureTimedForecastCollectionView(delegate: WeatherViewController)
    func updateData()
    func updateCityLabel()
    func updateForecastStatusLabel()
    func updateCurrentTemperature()
}

class WeatherPresenterImplementation: WeatherPresenter {
    let view: WeatherView!
    let weekForecastDataSource = WeekForecastDataSource()
    let timedForecastDataSource = TimedForecastDataSource()
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
    
    func configureWeekForecastCollectionView(delegate: WeatherViewController) {
        view.weekForecastView.dataSource = weekForecastDataSource
        view.weekForecastView.delegate = delegate
        view.weekForecastView.register(WeekForecastCollectionViewCell.self, forCellWithReuseIdentifier: "weekForecastCell")
    }
    
    func configureTimedForecastCollectionView(delegate: WeatherViewController) {
        view.timedForecastView.dataSource = timedForecastDataSource
        view.timedForecastView.delegate = delegate
        view.timedForecastView.register(TimedForecastCollectionViewCell.self, forCellWithReuseIdentifier: "timedForecastCell")
    }
    
    func updateData() {
        currentCity = "Minsk"
        forecastStatus = "Partly cloudly"
        currentTemperature = 2
        
        for index in 1...10 {
            let timedForecast = TimedForecast(at: String(index) + " AM", is: index)
            timedForecastDataSource.addForecast(timedForecast)
            
            let weekForecast = WeekdayForecast(on: String(index) + "day", temperatureAtMidday: index, temperatureAtNight: index)
            weekForecastDataSource.addForecast(weekForecast)
        }
    }
    
    func updateCityLabel() {
        view.display(city: currentCity)
    }
    
    func updateForecastStatusLabel() {
        view.display(forecastStatus: forecastStatus)
    }
    
    func updateCurrentTemperature() {
        view.display(currentTemperature: currentTemperature)
    }
}
