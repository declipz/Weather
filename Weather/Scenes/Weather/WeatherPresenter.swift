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
        view.display(currentCity: "Minsk")
        view.display(forecastStatus: "Partly cloudly")
        view.display(currentTemperature: 2)
        
        if let path = Bundle.main.path(forResource: "APIKeys", ofType: "plist"),
            let keys = NSDictionary(contentsOfFile: path),
            let appid = keys["OpenWeather API Key"] as? String {
            let service = OpenWeatherService()
            service.fetchData(in: "Minsk", using: appid) { timedForecastData, weekForecastData in
                self.view.display(timedForecast: timedForecastData)
                self.view.display(weekForecast: weekForecastData)
            }
        }
    }
}
