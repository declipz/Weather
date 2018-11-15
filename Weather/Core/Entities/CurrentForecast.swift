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
    var temperature: Int
    var status: String
    
    init(in city: String, is temperature: Int, status: String) {
        self.city = city
        self.temperature = temperature
        self.status = status
    }
}
