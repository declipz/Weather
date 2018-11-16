//
//  CurrentForecast.swift
//  Weather
//
//  Created by Vladislav Kondrashkov on 11/15/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import Foundation
import ObjectMapper

class CurrentForecast: Mappable {
    var city: String?
    var temperature: Int?
    var status: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        city        <- map["city.name"]
        temperature <- (map["list.0.main.temp"], TransformOf<Int, Double>(fromJSON: {
            Int($0!)
        }, toJSON: { $0.map { Double($0) } }))
        status      <- map["list.0.weather.0.description"]
    }
    
    init?(city: String?, temperature: Int?, status: String?) {
        self.city = city
        self.temperature = temperature
        self.status = status
    }
}
