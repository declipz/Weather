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
        view.display(currentCity: "Minsk")
        view.display(forecastStatus: "Partly cloudly")
        view.display(currentTemperature: 2)
        
        var timedForecastItems: [TimedForecast] = []
        var weekForecastItems: [WeekdayForecast] = []
        for index in 1...10 {
            let timedForecast = TimedForecast(at: String(index) + " AM", is: index)
            timedForecastItems.append(timedForecast)
            
            let weekForecast = WeekdayForecast(on: String(index) + "day", temperatureAtMidday: index, temperatureAtNight: index)
            weekForecastItems.append(weekForecast)
        }
        view.display(timedForecast: timedForecastItems)
        view.display(weekForecast: weekForecastItems)
    }
}
