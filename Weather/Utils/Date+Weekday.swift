//
//  Date+Weekday.swift
//  Weather
//
//  Created by Vladislav Kondrashkov on 11/18/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import Foundation

extension Date {
    var weekday: Weekday {
        var calendar = Calendar.current
        if let timeZone = TimeZone(secondsFromGMT: 0) {
            calendar.timeZone = timeZone
        }
        let weekday = calendar.component(.weekday, from: self)
        switch weekday {
        case 1:
            return .sunday
        case 2:
            return .monday
        case 3:
            return .tuesday
        case 4:
            return .wednesday
        case 5:
            return .thursday
        case 6:
            return .friday
        case 7:
            return .saturday
        default:
            return .unknown
        }
    }
}
