//
//  WeatherView.swift
//  Weather
//
//  Created by Vladislav Kondrashkov on 10/22/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

class WeatherView: UIView {
    var presenter: WeatherPresenter?
    
    let backgroundImage = UIImageView()
    let cityLabel = UILabel()
    let forecastStatusLabel = UILabel()
    let currentTemperatureLabel = UILabel()
    var timedForecastView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout.init())
    let timedForecastLayout = UICollectionViewFlowLayout.init()
    /*
    let timedForecastView = UICollectionView()
    let weekForecastView = UICollectionView()
 */
    
    
    init() {
        super.init(frame: CGRect.zero)
        
        presenter = WeatherPresenterImplementation(view: self)
        
        backgroundImage.image = UIImage(named: "background")
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        addSubview(backgroundImage)
        presenter?.activateBackgroundConstraints(view: backgroundImage)
        
        cityLabel.text = "Minsk"
        cityLabel.font = UIFont.boldSystemFont(ofSize: 34)
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        cityLabel.textColor = UIColor.white
        addSubview(cityLabel)
        presenter?.activateCityLabelConstraints(view: cityLabel)
        
        forecastStatusLabel.text = "Partly cloudly"
        forecastStatusLabel.font = UIFont.boldSystemFont(ofSize: 17)
        forecastStatusLabel.translatesAutoresizingMaskIntoConstraints = false
        forecastStatusLabel.textColor = UIColor.white
        addSubview(forecastStatusLabel)
        presenter?.activateForecastStatusLabelConstraints(view: forecastStatusLabel, anchorView: cityLabel)
        
        currentTemperatureLabel.text = "2"
        currentTemperatureLabel.font = UIFont.boldSystemFont(ofSize: 54)
        currentTemperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        currentTemperatureLabel.textColor = UIColor.white
        addSubview(currentTemperatureLabel)
        presenter?.activateCurrentTemperatureLabelConstraints(view: currentTemperatureLabel, anchorView: forecastStatusLabel)
        
        timedForecastLayout.scrollDirection = .horizontal
        timedForecastLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        timedForecastLayout.itemSize = CGSize(width: 60, height: 70)
        let timedForecastFrame = CGRect(x: 0, y: 200, width: UIScreen.main.bounds.width, height: 80)
        timedForecastView = UICollectionView(frame: timedForecastFrame, collectionViewLayout: timedForecastLayout)
        timedForecastView.backgroundColor = UIColor.clear
        addSubview(timedForecastView)
        presenter?.activateTimedForecastViewConstraints(view: timedForecastView, anchorView: currentTemperatureLabel)        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
