//
//  TimedForecast.swift
//  Weather
//
//  Created by Vladislav Kondrashkov on 10/22/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import Foundation
import ObjectMapper

class TimedForecast: Mappable {
    var time: String?
    var temperature: Int?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        time <- (map["dt_txt"], TransformOf<String, String>(fromJSON: {
            let dateFormatter = DateFormatter()
            var calendar = Calendar.current
            calendar.timeZone = TimeZone(secondsFromGMT: 0)!
            dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            let date = dateFormatter.date(from: $0!)
            let hours = calendar.component(.hour, from: date!)
            return String(hours) + ":00"
        }, toJSON: { $0.map { String($0) } }))
        temperature <- (map["main.temp"], TransformOf<Int, Double>(fromJSON: {
            Int($0!)
        }, toJSON: { $0.map { Double($0) } }))
    }
    
    init?(at time: String?, is temperature: Int?) {
        self.time = time
        self.temperature = temperature
    }
}
