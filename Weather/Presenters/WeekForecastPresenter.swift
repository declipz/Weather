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
}


class WeekForecastPresenterImplementation: WeekForecastPresenter {
    private var items: [WeekdayForecast] = []
    
    var count: Int {
        return items.count
    }
    
    func getItem(at index: Int) -> WeekdayForecast {
        return items[index]
    }
    
    func addItem(_ item: WeekdayForecast) {
        items.append(item)
    }
    
}
