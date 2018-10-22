//
//  TimedForecastPresenter.swift
//  Weather
//
//  Created by Vladislav Kondrashkov on 10/22/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

protocol TimedForecastPresenter {
    init()
    var count: Int { get }
    func getItem(at index: Int) -> TimedForecast
    func addItem(_ item: TimedForecast)
    func loadData()
}

class TimedForecastPresenterImplementation: TimedForecastPresenter {
    private var items: [TimedForecast] = []
    
    required init() {
        self.loadData()
    }
    
    var count: Int {
        return items.count
    }
    
    func getItem(at index: Int) -> TimedForecast {
        return items[index]
    }
    
    func addItem(_ item: TimedForecast) {
        items.append(item)
    }
    
    func loadData() {
        for index in 1...10 {
            let timedForecast = TimedForecast(at: String(index) + " AM", is: index)
            self.addItem(timedForecast)
        }
    }
}
