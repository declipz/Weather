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
        
        for index in 1...10 {
            let timedForecast = TimedForecast(at: String(index) + " AM", is: index)
            let weekForecast = WeekdayForecast(on: String(index) + "day", temperatureAtMidday: index, temperatureAtNight: index)
            
            timedForecastPresenter!.addItem(timedForecast)
            weekForecastPresenter!.addItem(weekForecast)
        }
        
        weatherView.timedForecastView.dataSource = self
        weatherView.timedForecastView.delegate = self
        weatherView.timedForecastView.register(TimedForecastCellView.self, forCellWithReuseIdentifier: "timedForecastCell")
        
        weatherView.weekForecastView.dataSource = self
        weatherView.weekForecastView.delegate = self
        weatherView.weekForecastView.register(WeekForecastCellView.self, forCellWithReuseIdentifier: "weekForecastCell")

        self.view = weatherView
    }
}

extension WeatherViewController: UICollectionViewDataSource, UICollectionViewDelegate {
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
            
            let item = timedForecastPresenter!.getItem(at: indexPath.row)
            
            cell.configure(time: item.getTime(), temperature: item.getTemperature())

            return cell
        }
        if collectionView == view.weekForecastView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "weekForecastCell", for: indexPath) as! WeekForecastCellView
            
            let item = weekForecastPresenter!.getItem(at: indexPath.row)
            
            cell.configure(weekDay: item.getName(), temperatureAtMidday: item.getTemperatureAtMidday(), temperatureAtNight: item.getTemperatureAtNight())
            
            return cell
        }
        // Default value
        let cell = UICollectionViewCell()
        return cell
    }
}

