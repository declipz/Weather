//
//  CurrentForecast.swift
//  Weather
//
//  Created by Vladislav Kondrashkov on 11/15/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import Foundation

class CurrentForecast {
    var city: String
    var temperature: String
    var status: String
    
    init(city: String, temperature: String, status: String) {
        self.city = city
        self.temperature = temperature
        self.status = status
    }
}
