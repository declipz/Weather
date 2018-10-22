//
//  TimedForecast.swift
//  Weather
//
//  Created by Vladislav Kondrashkov on 10/22/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import Foundation

class TimedForecast {
    private var time: String
    private var temperature: Int
    
    init(at time: String, is temperature: Int) {
        self.time = time
        self.temperature = temperature
    }
    
    func getTime() -> String {
        return time
    }
    func getTemperature() -> Int {
        return temperature
    }
}
