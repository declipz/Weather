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
    
    init(view: WeatherView) {
        self.view = view
    }
    
    func viewDidLoad() {
        let service = OpenWeatherService()
        DispatchQueue.global(qos: .userInitiated).async {
            service.fetchCurrentForecast(city: "Minsk") { currentForecast in
                DispatchQueue.main.async {
                    if let currentForecast = currentForecast {
                        self.view.display(currentCity: currentForecast.city)
                        self.view.display(forecastStatus: currentForecast.status)
                        self.view.display(currentTemperature: currentForecast.temperature)
                    }
                }
            }
        }
        DispatchQueue.global(qos: .userInitiated).async {
            service.fetchTimedForecast(city: "Minsk") { timedForecastList in
                DispatchQueue.main.async {
                    self.view.display(timedForecast: timedForecastList)
                }
            }
        }
        DispatchQueue.global(qos: .userInitiated).async {
            service.fetchWeekForecast(city: "Minsk") { weekForecastList in
                DispatchQueue.main.async {
                    self.view.display(weekForecast: weekForecastList)
                }
            }
        }
    }
}
