//
//  WeekForecastDataSource.swift
//  Weather
//
//  Created by Vladislav Kondrashkov on 11/12/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

class WeekForecastDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegate {
    private var items: [WeekdayForecast] = []
    
    var count: Int {
        return items.count
    }
    
    func getItem(at index: Int) -> WeekdayForecast {
        return items[index]
    }
    
    func addItem(_ item: WeekdayForecast) {
        items.append(item)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = getItem(at: indexPath.row) ?? WeekdayForecast(on: "Day", temperatureAtMidday: 0, temperatureAtNight: 0)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "weekForecastCell", for: indexPath) as! WeekForecastCellView
        cell.display(weekDay: item.getName(), temperatureAtMidday: item.getTemperatureAtMidday(), temperatureAtNight: item.getTemperatureAtNight())
        
        return cell
    }
}

extension WeekForecastDataSource: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 40)
    }
}
