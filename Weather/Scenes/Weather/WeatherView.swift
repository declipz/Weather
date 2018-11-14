//
//  WeatherView.swift
//  Weather
//
//  Created by Vladislav Kondrashkov on 10/22/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

protocol WeatherView {
    func display(currentCity: String?)
    func display(forecastStatus: String?)
    func display(currentTemperature: Int?)
    func display(weekForecast: [WeekdayForecast])
    func display(timedForecast: [TimedForecast])
}

final class WeatherViewImplementation: UIView, WeatherView {
    private let timedForecastDataSource = TimedForecastDataSource()
    private let weekForecastDataSource = WeekForecastDataSource()
    private let backgroundImage = UIImageView()
    private let cityLabel = UILabel()
    private let forecastStatusLabel = UILabel()
    private let currentTemperatureLabel = UILabel()
    private lazy var timedForecastView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
    private lazy var weekForecastView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    init(delegate: UICollectionViewDelegate) {
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
        
        timedForecastView = TimedForecastCollectionView(delegate: delegate, dataSource: timedForecastDataSource)
        addSubview(timedForecastView)
        activateTimedForecastViewConstraints(view: timedForecastView, anchorView: currentTemperatureLabel)
        
        weekForecastView = WeekForecastCollectionView(delegate: delegate, dataSource: weekForecastDataSource)
        addSubview(weekForecastView)
        activateWeekForecastViewConstraints(view: weekForecastView, anchorView: timedForecastView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func display(currentCity: String?) {
        cityLabel.text = currentCity
    }
    
    func display(forecastStatus: String?) {
        forecastStatusLabel.text = forecastStatus
    }
    
    func display(currentTemperature: Int?) {
        guard let currentTemperature = currentTemperature else { return }
        currentTemperatureLabel.text = String(currentTemperature) + "°"
    }
    
    func display(weekForecast: [WeekdayForecast]) {
        weekForecastDataSource.removeAllForecasts()
        for forecast in weekForecast {
            weekForecastDataSource.addForecast(forecast)
        }
        weekForecastView.reloadData()
    }
    
    func display(timedForecast: [TimedForecast]) {
        timedForecastDataSource.removeAllForecasts()
        for forecast in timedForecast {
            timedForecastDataSource.addForecast(forecast)
        }
        timedForecastView.reloadData()
    }
}

private typealias PrivateWeatherViewImplementation = WeatherViewImplementation
private extension PrivateWeatherViewImplementation {
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
