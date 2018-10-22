//
//  WeatherPresenter.swift
//  Weather
//
//  Created by Vladislav Kondrashkov on 10/22/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

protocol WeatherPresenter {
    func activateBackgroundConstraints(view: UIView)
    func activateCityLabelConstraints(view: UIView)
    func activateForecastStatusLabelConstraints(view: UIView, anchorView: UIView)
    func activateCurrentTemperatureLabelConstraints(view: UIView, anchorView: UIView)
    func activateTimedForecastViewConstraints(view: UIView, anchorView: UIView)
    func activateWeekForecastViewConstraints(view: UIView, anchorView: UIView)
}

class WeatherPresenterImplementation: WeatherPresenter {
    let view: WeatherView?
    
    init(view: WeatherView) {
        self.view = view
    }
    
    func activateBackgroundConstraints(view: UIView) {
        guard let superview = view.superview else {
            return
        }
        NSLayoutConstraint.activate([
            view.centerXAnchor.constraint(equalTo: superview.centerXAnchor),
            view.centerYAnchor.constraint(equalTo: superview.centerYAnchor),
            view.heightAnchor.constraint(equalTo: superview.heightAnchor),
            view.widthAnchor.constraint(equalTo: superview.widthAnchor)
            ])
    }
    
    func activateCityLabelConstraints(view: UIView) {
        guard let superview = view.superview else {
            return
        }
        NSLayoutConstraint.activate([
            view.centerXAnchor.constraint(equalTo: superview.centerXAnchor),
            view.topAnchor.constraint(equalTo: superview.topAnchor, constant: 40)
            ])
    }
    
    func activateForecastStatusLabelConstraints(view: UIView, anchorView: UIView) {
        guard let superview = view.superview else {
            return
        }
        NSLayoutConstraint.activate([
            view.centerXAnchor.constraint(equalTo: superview.centerXAnchor),
            view.topAnchor.constraint(equalTo: anchorView.bottomAnchor, constant: 10)
            ])
    }
    
    func activateCurrentTemperatureLabelConstraints(view: UIView, anchorView: UIView) {
        guard let superview = view.superview else {
            return
        }
        NSLayoutConstraint.activate([
            view.centerXAnchor.constraint(equalTo: superview.centerXAnchor),
            view.topAnchor.constraint(equalTo: anchorView.bottomAnchor, constant: 10)
            ])
    }
    
    func activateTimedForecastViewConstraints(view: UIView, anchorView: UIView) {
        guard let superview = view.superview else {
            return
        }
        NSLayoutConstraint.activate([
            view.centerXAnchor.constraint(equalTo: superview.centerXAnchor),
            view.topAnchor.constraint(equalTo: anchorView.bottomAnchor, constant: 20)
            ])
    }
    
    func activateWeekForecastViewConstraints(view: UIView, anchorView: UIView) {
        guard let superview = view.superview else {
            return
        }
        NSLayoutConstraint.activate([
            view.centerXAnchor.constraint(equalTo: superview.centerXAnchor),
            view.topAnchor.constraint(equalTo: anchorView.bottomAnchor, constant: 5)
            ])
    }
    
    
}
