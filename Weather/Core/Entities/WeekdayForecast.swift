//
//  WeekdayForecast.swift
//  Weather
//
//  Created by Vladislav Kondrashkov on 10/22/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import Foundation

class WeekdayForecast {
    var weekdayName: String
    var temperatureAtMidday: String
    var temperatureAtNight: String
    
    init(weekdayName: String, temperatureAtMidday: String, temperatureAtNight: String) {
        self.weekdayName = weekdayName
        self.temperatureAtMidday = temperatureAtMidday
        self.temperatureAtNight = temperatureAtNight
    }
}
