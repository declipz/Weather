//
//  TimedForecast.swift
//  Weather
//
//  Created by Vladislav Kondrashkov on 10/22/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import Foundation

class TimedForecast {
    var time: String
    var temperature: String

    init(time: String, temperature: String) {
        self.time = time
        self.temperature = temperature
    }
}
