//
//  WeekdayForecast.swift
//  Weather
//
//  Created by Vladislav Kondrashkov on 10/21/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import Foundation

class WeekdayForecast {
    private var weekdayName: String
    private var temperatureAtMidday: Int
    private var temperatureAtNight: Int
    
    init(on weekdayName: String, temperatureAtMidday: Int, temperatureAtNight: Int) {
        self.weekdayName = weekdayName
        self.temperatureAtMidday = temperatureAtMidday
        self.temperatureAtNight = temperatureAtNight
    }
    
    func getName() -> String {
        return self.weekdayName
    }
    func getTemperatureAtMidday() -> Int {
        return self.temperatureAtMidday
    }
    func getTemperatureAtNight() -> Int {
        return self.temperatureAtNight
    }
}
