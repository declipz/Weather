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
    private weak var view: WeatherView!
    private let service: OpenWeatherService
    private var calendar = Calendar.current
    
    init(view: WeatherView, service: OpenWeatherService) {
        self.view = view
        self.service = service
    }
    
    func viewDidLoad() {
        if let timeZone = TimeZone(secondsFromGMT: 0) {
            calendar.timeZone = timeZone
        }
        let currentCity = "Minsk"
        // Fetch current forecast
        service.fetchForecast(city: currentCity) { fetchedForecastList in
            if let forecast = fetchedForecastList.first {
                let temperature = String(Int(forecast.temperature)) + "°"
                let currentForecast = CurrentForecast(city: currentCity,
                                                      temperature: temperature,
                                                      status: forecast.status)
                self.view.display(currentForecast: currentForecast)
            }
        }
        // Fetch timed forecast
        service.fetchForecast(city: currentCity) { fetchedForecastList in
            // Passing first element due to it's CurrentForecast and
            // there is no sense to duplicte it to TimedForecast
            let forecastList = fetchedForecastList[1...8]

            var timedForecastList: [TimedForecast] = []
            for forecast in forecastList {
                let temperature = String(Int(forecast.temperature)) + "°"
                let timedForecast = TimedForecast(time: String(forecast.date.hours) + ":00",
                                                  temperature: temperature)
                timedForecastList.append(timedForecast)
            }
            self.view.display(timedForecast: timedForecastList)
        }
        // Fetch week forecast
        service.fetchForecast(city: currentCity) { fetchedForecastList in
            var forecastList: [Forecast] = []
            forecastList = fetchedForecastList.filter({ !self.calendar.isDateInToday($0.date) })
            
            var nightForecast = forecastList.filter({ $0.date.hours == 0 })
            var middayForecast = forecastList.filter({ $0.date.hours == 12 })
            
            var weekdayList: [WeekdayForecast] = []
            for i in 0..<nightForecast.count {
                let temperatureAtMidday = String(Int(middayForecast[i].temperature)) + "°"
                let temperatureAtNight = String(Int(nightForecast[i].temperature)) + "°"
                let weekday = WeekdayForecast(weekdayName: nightForecast[i].date.weekday.rawValue,
                                              temperatureAtMidday: temperatureAtMidday,
                                              temperatureAtNight: temperatureAtNight)
                weekdayList.append(weekday)
            }
            self.view.display(weekForecast: weekdayList)
        }
    }
}
