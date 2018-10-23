//
//  WeatherView.swift
//  Weather
//
//  Created by Vladislav Kondrashkov on 10/22/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

protocol WeatherDelegate {
    func updateCityLabel(cityLabel: UILabel)
    func updateForecastStatusLabel(forecastStatusLabel: UILabel)
    func updateCurrentTemperature(currentTemperatureLabel: UILabel)
}

final class WeatherView: UIView {
    var presenter: WeatherPresenter?
    var delegate: WeatherDelegate?
    
    private let backgroundImage = UIImageView()
    private let cityLabel = UILabel()
    private let forecastStatusLabel = UILabel()
    private let currentTemperatureLabel = UILabel()
    var timedForecastView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout())
    private let timedForecastLayout = UICollectionViewFlowLayout()
    var weekForecastView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout())
    private let weekForecastLayout = UICollectionViewFlowLayout()
    
    
    init() {
        super.init(frame: CGRect.zero)
        
        presenter = WeatherPresenterImplementation(view: self)
        
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
        timedForecastLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        timedForecastLayout.itemSize = CGSize(width: 60, height: 70)
        let timedForecastFrame = CGRect(x: 0, y: 200, width: UIScreen.main.bounds.width, height: 90)
        timedForecastView = UICollectionView(frame: timedForecastFrame, collectionViewLayout: timedForecastLayout)
        timedForecastView.backgroundColor = UIColor.clear
        addSubview(timedForecastView)
        activateTimedForecastViewConstraints(view: timedForecastView, anchorView: currentTemperatureLabel)
        
        weekForecastLayout.scrollDirection = .vertical
        weekForecastLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        weekForecastLayout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: 70)
        let weekForecastFrame = CGRect(x: 0, y: 300, width: UIScreen.main.bounds.width, height: 380)
        weekForecastView = UICollectionView(frame: weekForecastFrame, collectionViewLayout: weekForecastLayout)
        weekForecastView.backgroundColor = .clear
        addSubview(weekForecastView)
        activateWeekForecastViewConstraints(view: weekForecastView, anchorView: timedForecastView)
        
        delegate?.updateCityLabel(cityLabel: cityLabel)
        delegate?.updateForecastStatusLabel(forecastStatusLabel: forecastStatusLabel)
        delegate?.updateCurrentTemperature(currentTemperatureLabel: currentTemperatureLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private typealias PrivateWeatherView = WeatherView
private extension PrivateWeatherView {
    final func activateBackgroundConstraints(view: UIView) {
        guard let superview = view.superview else { return }
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.centerXAnchor.constraint(equalTo: superview.centerXAnchor),
            view.centerYAnchor.constraint(equalTo: superview.centerYAnchor),
            view.heightAnchor.constraint(equalTo: superview.heightAnchor),
            view.widthAnchor.constraint(equalTo: superview.widthAnchor)
            ])
    }
    
    final func activateCityLabelConstraints(view: UIView) {
        guard let superview = view.superview else { return }
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.centerXAnchor.constraint(equalTo: superview.centerXAnchor),
            view.topAnchor.constraint(equalTo: superview.topAnchor, constant: 40)
            ])
    }
    
    final func activateForecastStatusLabelConstraints(view: UIView, anchorView: UIView) {
        guard let superview = view.superview else { return }
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.centerXAnchor.constraint(equalTo: superview.centerXAnchor),
            view.topAnchor.constraint(equalTo: anchorView.bottomAnchor, constant: 10)
            ])
    }
    
    final func activateCurrentTemperatureLabelConstraints(view: UIView, anchorView: UIView) {
        guard let superview = view.superview else { return }
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.centerXAnchor.constraint(equalTo: superview.centerXAnchor),
            view.topAnchor.constraint(equalTo: anchorView.bottomAnchor, constant: 10)
            ])
    }
    
    final func activateTimedForecastViewConstraints(view: UIView, anchorView: UIView) {
        guard let superview = view.superview else { return }
        NSLayoutConstraint.activate([
            view.centerXAnchor.constraint(equalTo: superview.centerXAnchor),
            view.topAnchor.constraint(equalTo: anchorView.bottomAnchor, constant: 20)
            ])
    }
    
    final func activateWeekForecastViewConstraints(view: UIView, anchorView: UIView) {
        guard let superview = view.superview else { return }
        NSLayoutConstraint.activate([
            view.centerXAnchor.constraint(equalTo: superview.centerXAnchor),
            view.topAnchor.constraint(equalTo: anchorView.bottomAnchor, constant: 5)
            ])
    }
}
