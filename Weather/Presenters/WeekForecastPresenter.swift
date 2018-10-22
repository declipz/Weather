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
    func activateWeekdayLabelConstraints(view: UIView)
    func activateTemperatureAtNightLabelConstraints(view: UIView)
    func activateTemperatureAtMiddayLabelConstraints(view: UIView, anchorView: UIView)
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
    
    func activateWeekdayLabelConstraints(view: UIView) {
        guard let superview = view.superview else {
            return
        }
        NSLayoutConstraint.activate([
            view.leftAnchor.constraint(equalTo: superview.leftAnchor, constant: 10),
            view.centerYAnchor.constraint(equalTo: superview.centerYAnchor)
            ])
    }
    
    func activateTemperatureAtNightLabelConstraints(view: UIView) {
        guard let superview = view.superview else {
            return
        }
        NSLayoutConstraint.activate([
            view.rightAnchor.constraint(equalTo: superview.rightAnchor, constant: 10),
            view.centerYAnchor.constraint(equalTo: superview.centerYAnchor)
            ])
    }
    
    func activateTemperatureAtMiddayLabelConstraints(view: UIView, anchorView: UIView) {
        guard let superview = view.superview else {
            return
        }
        NSLayoutConstraint.activate([
            view.rightAnchor.constraint(equalTo: anchorView.leftAnchor, constant: 10),
            view.centerYAnchor.constraint(equalTo: superview.centerYAnchor)
            ])
    }
}
