//
//  WeatherView.swift
//  Weather
//
//  Created by Vladislav Kondrashkov on 10/22/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

final class WeatherView: UIView {
    private let backgroundImage = UIImageView()
    private let cityLabel = UILabel()
    private let forecastStatusLabel = UILabel()
    private let currentTemperatureLabel = UILabel()
    private let timedForecastLayout = UICollectionViewFlowLayout()
    lazy var timedForecastView = UICollectionView(frame: CGRect.zero, collectionViewLayout: timedForecastLayout)
    private let weekForecastLayout = UICollectionViewFlowLayout()
    lazy var weekForecastView = UICollectionView(frame: CGRect.zero, collectionViewLayout: weekForecastLayout)
    
    init() {
        super.init(frame: CGRect.zero)
        backgroundImage.image = UIImage(named: "background")
        addSubview(backgroundImage)
        activateBackgroundConstraints(view: backgroundImage)
        
        cityLabel.font = .boldSystemFont(ofSize: 34)
        cityLabel.textColor = .white
        addSubview(cityLabel)
        activateCityLabelConstraints(view: cityLabel)
        
        forecastStatusLabel.font = .boldSystemFont(ofSize: 17)
        forecastStatusLabel.textColor = .white
        addSubview(forecastStatusLabel)
        activateForecastStatusLabelConstraints(view: forecastStatusLabel, anchorView: cityLabel)
        
        currentTemperatureLabel.font = .boldSystemFont(ofSize: 54)
        currentTemperatureLabel.textColor = .white
        addSubview(currentTemperatureLabel)
        activateCurrentTemperatureLabelConstraints(view: currentTemperatureLabel, anchorView: forecastStatusLabel)
        
        timedForecastLayout.scrollDirection = .horizontal
        timedForecastView.backgroundColor = .clear
        timedForecastView.register(TimedForecastCellView.self, forCellWithReuseIdentifier: "timedForecastCell")
        
        addSubview(timedForecastView)
        activateTimedForecastViewConstraints(view: timedForecastView, anchorView: currentTemperatureLabel)
        
        weekForecastLayout.scrollDirection = .vertical
        weekForecastView.backgroundColor = .clear
        addSubview(weekForecastView)
        activateWeekForecastViewConstraints(view: weekForecastView, anchorView: timedForecastView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func display(city: String?) {
        cityLabel.text = city
    }
    
    func display(forecastStatus: String?) {
        forecastStatusLabel.text = forecastStatus
    }
    
    func display(currentTemperature: Int?) {
        guard let currentTemperature = currentTemperature else { return }
        currentTemperatureLabel.text = String(currentTemperature) + "°"
    }
}

private typealias PrivateWeatherView = WeatherView
private extension PrivateWeatherView {
    func activateBackgroundConstraints(view: UIView) {
        guard let superview = view.superview else { return }
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.centerXAnchor.constraint(equalTo: superview.centerXAnchor),
            view.centerYAnchor.constraint(equalTo: superview.centerYAnchor),
            view.heightAnchor.constraint(equalTo: superview.heightAnchor),
            view.widthAnchor.constraint(equalTo: superview.widthAnchor)
            ])
    }
    
    func activateCityLabelConstraints(view: UIView) {
        guard let superview = view.superview else { return }
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.centerXAnchor.constraint(equalTo: superview.centerXAnchor),
            view.topAnchor.constraint(equalTo: superview.topAnchor, constant: 40)
            ])
    }
    
    func activateForecastStatusLabelConstraints(view: UIView, anchorView: UIView) {
        guard let superview = view.superview else { return }
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.centerXAnchor.constraint(equalTo: superview.centerXAnchor),
            view.topAnchor.constraint(equalTo: anchorView.bottomAnchor, constant: 10)
            ])
    }
    
    func activateCurrentTemperatureLabelConstraints(view: UIView, anchorView: UIView) {
        guard let superview = view.superview else { return }
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.centerXAnchor.constraint(equalTo: superview.centerXAnchor),
            view.topAnchor.constraint(equalTo: anchorView.bottomAnchor, constant: 10)
            ])
    }
    
    func activateTimedForecastViewConstraints(view: UIView, anchorView: UIView) {
        guard let superview = view.superview else { return }
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.centerXAnchor.constraint(equalTo: superview.centerXAnchor),
            view.topAnchor.constraint(equalTo: anchorView.bottomAnchor, constant: 20),
            view.heightAnchor.constraint(equalToConstant: 90),
            view.widthAnchor.constraint(equalTo: superview.widthAnchor)
            ])
    }
    
    func activateWeekForecastViewConstraints(view: UIView, anchorView: UIView) {
        guard let superview = view.superview else { return }
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.centerXAnchor.constraint(equalTo: superview.centerXAnchor),
            view.topAnchor.constraint(equalTo: anchorView.bottomAnchor, constant: 5),
            view.heightAnchor.constraint(equalToConstant: 350),
            view.widthAnchor.constraint(equalTo: superview.widthAnchor)
            ])
    }
}
