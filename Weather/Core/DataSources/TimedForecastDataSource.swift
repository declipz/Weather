//
//  TimedForecastDataSource.swift
//  Weather
//
//  Created by Vladislav Kondrashkov on 11/12/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

class TimedForecastDataSource: NSObject, UICollectionViewDataSource {
    private var items: [TimedForecast] = []
    
    var numberOfForecasts: Int {
        return items.count
    }
    
    func retrieveItem(at index: Int) -> TimedForecast {
        return items[index]
    }
    
    func addForecast(_ item: TimedForecast) {
        items.append(item)
    }
    
    func removeAllForecasts() {
        items = []
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfForecasts
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = retrieveItem(at: indexPath.row)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "timedForecastCell", for: indexPath) as! TimedForecastCollectionViewCell
        cell.display(time: item.time, temperature: item.temperature)
        
        return cell
    }
}
