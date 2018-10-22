//
//  WeatherViewController.swift
//  Weather
//
//  Created by Vladislav Kondrashkov on 10/22/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    var timedForecastPresenter: TimedForecastPresenter?
    var weekForecastPresenter: WeekForecastPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        let weatherView = WeatherView()
        self.timedForecastPresenter = TimedForecastPresenterImplementation()
        self.weekForecastPresenter = WeekForecastPresenterImplementation()
        /*
        weatherView.timedForecastView.dataSource = self
        weatherView.weekForecastView.dataSource = self
        weatherView.timedForecastView.register(TimedForecastCellView.self, forCellWithReuseIdentifier: "timedForecastCell")
        weatherView.weekForecastView.register(WeekForecastCellView.self, forCellWithReuseIdentifier: "weekForecastCell")
        */
        self.view = weatherView
    }
}
/*
extension WeatherViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let view = self.view as! WeatherView
        if collectionView == view.timedForecastView {
            return timedForecastPresenter!.count
        }
        if collectionView == view.weekForecastView {
            return weekForecastPresenter!.count
        }
        // Default value
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let view = self.view as! WeatherView
        if collectionView == view.timedForecastView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "timedForecastCell", for: indexPath) as! TimedForecastCellView
            
            timedForecastPresenter!.activateTimeLabelConstraints(view: cell.timeLabel)
            timedForecastPresenter!.activateTemperatureLabelConstraints(view: cell.temperatureLabel)
            
            let item = timedForecastPresenter!.getItem(at: indexPath.row)
            
            cell.updateTimeLabel(text: item.getTime())
            cell.updateTemperatureLabel(text: item.getTemperature())
            
            return cell
        }
        if collectionView == view.weekForecastView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "weekForecastCell", for: indexPath) as! WeekForecastCellView
            
            weekForecastPresenter!.activateWeekdayLabelConstraints(view: cell.weekDayNameLabel)
            weekForecastPresenter!.activateTemperatureAtNightLabelConstraints(view: cell.temperatureAtNightLabel)
            weekForecastPresenter!.activateTemperatureAtMiddayLabelConstraints(view: cell.temperatureAtMiddayLabel, anchorView: cell.temperatureAtNightLabel)
            
            let item = weekForecastPresenter!.getItem(at: indexPath.row)
            
            cell.updateWeekDayNameLabel(text: item.getName())
            cell.updateTemperatureAtNightLabel(text: item.getTemperatureAtNight())
            cell.updateTemperatureAtMiddayLabel(text: item.getTemperatureAtMidday())
            
            return cell
        }
        // Default value
        let cell = UICollectionViewCell()
        return cell
    }
}
 */
