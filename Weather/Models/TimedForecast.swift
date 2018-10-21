//
//  TimedForecast.swift
//  Weather
//
//  Created by Vladislav Kondrashkov on 10/21/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import Foundation

class TimedForecast {
    private var time: Date
    private var temperature: Int
    
    init(at time: Date, is temperature: Int) {
        self.time = time
        self.temperature = temperature
    }
    
    func getTime() -> Date {
        return self.time
    }
    func getTemperature() -> Int {
        return self.temperature
    }
}
