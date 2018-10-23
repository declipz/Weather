//
//  WeekForecastPresenter.swift
//  Weather
//
//  Created by Vladislav Kondrashkov on 10/22/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

protocol WeekForecastPresenter {
    var count: Int { get }
    func getItem(at index: Int) -> WeekdayForecast
    func addItem(_ item: WeekdayForecast)
    func updateData()
}

class WeekForecastPresenterImplementation: WeekForecastPresenter {
    private var items: [WeekdayForecast] = []
    
    required init() {
        updateData()
    }
    
    var count: Int {
        return items.count
    }
    
    func getItem(at index: Int) -> WeekdayForecast {
        return items[index]
    }
    
    func addItem(_ item: WeekdayForecast) {
        items.append(item)
    }
    
    func updateData() {
        items = []
        for index in 1...10 {
            let weekForecast = WeekdayForecast(on: String(index) + "day", temperatureAtMidday: index, temperatureAtNight: index)
            addItem(weekForecast)
        }
    }
}
