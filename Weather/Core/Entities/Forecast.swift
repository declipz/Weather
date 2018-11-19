//
//  Forecast.swift
//  Weather
//
//  Created by Vladislav Kondrashkov on 11/18/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import Foundation
import ObjectMapper

class Forecast: ImmutableMappable {
    let date: Date
    let temperature: Double
    let status: String
    
    required init(map: Map) throws {
        date = try map.value("dt", using: DateTransform())
        temperature = try map.value("main.temp")
        status = try map.value("weather.0.description")
    }
    
    func mapping(map: Map) {
        date >>> (map["dt_txt"], DateTransform())
        temperature >>> map["main.temp"]
        status >>> map["weather.0.description"]
    }

}
