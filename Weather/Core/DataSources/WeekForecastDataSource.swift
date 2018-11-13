//
//  WeekForecastDataSource.swift
//  Weather
//
//  Created by Vladislav Kondrashkov on 11/12/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

class WeekForecastDataSource: NSObject, UICollectionViewDataSource {
    private var items: [WeekdayForecast] = []
    
    var numberOfForecasts: Int {
        return items.count
    }
    
    func retrieveItem(at index: Int) -> WeekdayForecast {
        return items[index]
    }
    
    func addForecast(_ item: WeekdayForecast) {
        items.append(item)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfForecasts
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = retrieveItem(at: indexPath.row)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "weekForecastCell", for: indexPath) as! WeekForecastCellView
        cell.display(weekDay: item.getName(), temperatureAtMidday: item.getTemperatureAtMidday(), temperatureAtNight: item.getTemperatureAtNight())
        
        return cell
    }
}
