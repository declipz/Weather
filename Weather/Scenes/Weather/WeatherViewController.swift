//
//  WeatherViewController.swift
//  Weather
//
//  Created by Vladislav Kondrashkov on 10/22/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

final class WeatherViewController: UIViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    var timedForecastPresenter: TimedForecastPresenter?
    var weekForecastPresenter: WeekForecastPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let weatherView = WeatherView()
        timedForecastPresenter = TimedForecastPresenterImplementation()
        weekForecastPresenter = WeekForecastPresenterImplementation()
        
        timedForecastPresenter?.configure(collectionView: weatherView.timedForecastView)
        
        weatherView.weekForecastView.dataSource = self
        weatherView.weekForecastView.delegate = self
        weatherView.weekForecastView.register(WeekForecastCellView.self, forCellWithReuseIdentifier: "weekForecastCell")

        self.view = weatherView
    }
}

extension WeatherViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let view = self.view as? WeatherView
        let width = view?.bounds.width ?? 0;
        if collectionView == view?.timedForecastView {
            return CGSize(width: 60, height: 90)
        }
        if collectionView == view?.weekForecastView {
            return CGSize(width: width, height: 40)
        }
        return CGSize.zero
    }
}

extension WeatherViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let view = self.view as? WeatherView
        if collectionView == view?.timedForecastView {
            return timedForecastPresenter?.count ?? 0
        }
        if collectionView == view?.weekForecastView {
            return weekForecastPresenter?.count ?? 0
        }
        // Default value
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let view = self.view as? WeatherView
        if collectionView == view?.timedForecastView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "timedForecastCell", for: indexPath) as! TimedForecastCellView
            
            let item = timedForecastPresenter?.getItem(at: indexPath.row) ?? TimedForecast(at: "Day", is: 0)
            
            cell.display(time: item.getTime(), temperature: item.getTemperature())

            return cell
        }
        if collectionView == view?.weekForecastView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "weekForecastCell", for: indexPath) as! WeekForecastCellView
            
            let item = weekForecastPresenter?.getItem(at: indexPath.row) ?? WeekdayForecast(on: "Day", temperatureAtMidday: 0, temperatureAtNight: 0)
            
            cell.display(weekDay: item.getName(), temperatureAtMidday: item.getTemperatureAtMidday(), temperatureAtNight: item.getTemperatureAtNight())
            
            return cell
        }
        // Default value
        let cell = UICollectionViewCell()
        return cell
    }
}

