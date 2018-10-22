//
//  ViewController.swift
//  Weather
//
//  Created by Vladislav Kondrashkov on 10/21/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var timedForecastView: UICollectionView!
    @IBOutlet weak var weekForecastView: UICollectionView!
    
    var weekForecastPresenter: WeekForecastPresenter?
    var timedForecastPresenter: TimedForecastPresenter?
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        timedForecastPresenter = TimedForecastPresenterImplementation()
        weekForecastPresenter = WeekForecastPresenterImplementation()
        
        // Hardcode
        for index in 1...10 {
            let timedForecast = TimedForecast(at: String(index) + " AM", is: index)
            let weekForecast = WeekdayForecast(on: String(index) + "day", temperatureAtMidday: index, temperatureAtNight: index)
            
            timedForecastPresenter!.addItem(timedForecast)
            weekForecastPresenter!.addItem(weekForecast)
        }
        
        timedForecastView.dataSource = self
        weekForecastView.dataSource = self
        
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.timedForecastView {
            return timedForecastPresenter!.count
        }
        if collectionView == self.weekForecastView {
            return weekForecastPresenter!.count
        }
        // Default value
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.timedForecastView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "timedForecastCell", for: indexPath) as! TimedForecastCellView
            
            let item = timedForecastPresenter!.getItem(at: indexPath.row)
            
            cell.updateTimeLabel(text: item.getTime())
            cell.updateTemperatureLabel(text: item.getTemperature())
            
            return cell
        }
        if collectionView == self.weekForecastView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "weekForecastCell", for: indexPath) as! WeekForecastCellView
            
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
