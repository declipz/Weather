//
//  WeekdayForecast.swift
//  Weather
//
//  Created by Vladislav Kondrashkov on 10/22/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import Foundation
import ObjectMapper

class WeekdayForecast: Mappable {
    
    
    var weekdayName: String?
    var temperatureAtMidday: Int?
    var temperatureAtNight: Int?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
    }
    
    init?(on weekdayName: String?, temperatureAtMidday: Int?, temperatureAtNight: Int?) {
        self.weekdayName = weekdayName
        self.temperatureAtMidday = temperatureAtMidday
        self.temperatureAtNight = temperatureAtNight
    }
}
