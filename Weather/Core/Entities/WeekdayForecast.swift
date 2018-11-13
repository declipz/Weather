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
    var temperatureAtMidday: Int
    var temperatureAtNight: Int
    
    init(on weekdayName: String, temperatureAtMidday: Int, temperatureAtNight: Int) {
        self.weekdayName = weekdayName
        self.temperatureAtMidday = temperatureAtMidday
        self.temperatureAtNight = temperatureAtNight
    }
}
