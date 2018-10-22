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
        /*
        timedForecastView.translatesAutoresizingMaskIntoConstraints = false
        let timedForecastLayout = UICollectionViewFlowLayout()
        timedForecastLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        timedForecastLayout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: 60)
        timedForecastView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 80)
        timedForecastView.collectionViewLayout = timedForecastLayout
        timedForecastView.backgroundColor = UIColor.white
        addSubview(timedForecastView)
        presenter?.activateTimedForecastViewConstraints(view: timedForecastView, anchorView: currentTemperatureLabel)
        
        weekForecastView.translatesAutoresizingMaskIntoConstraints = false
        let weekForecastLayout = UICollectionViewFlowLayout()
        weekForecastLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        weekForecastLayout.itemSize = CGSize(width: 75, height: 60)
        weekForecastView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 80)
        weekForecastView.collectionViewLayout = weekForecastLayout
        weekForecastView.backgroundColor = UIColor.white
        addSubview(weekForecastView)
        presenter?.activateWeekForecastViewConstraints(view: weekForecastView, anchorView: timedForecastView)
 */
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
