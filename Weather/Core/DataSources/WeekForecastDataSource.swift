//
//  WeekForecastDataSource.swift
//  Weather
//
//  Created by Vladislav Kondrashkov on 11/12/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

class WeekForecastDataSource: NSObject, UICollectionViewDataSource {
    var items: [WeekdayForecast] = []
    
    var numberOfForecasts: Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfForecasts
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = items[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "weekForecastCell", for: indexPath) as! WeekForecastCollectionViewCell
        cell.display(weekDay: item.weekdayName, temperatureAtMidday: item.temperatureAtMidday, temperatureAtNight: item.temperatureAtNight)
        
        return cell
    }
}
