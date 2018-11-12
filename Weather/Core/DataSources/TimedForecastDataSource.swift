//
//  TimedForecastDataSource.swift
//  Weather
//
//  Created by Vladislav Kondrashkov on 11/12/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

class TimedForecastDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegate {
    private var items: [TimedForecast] = []
    
    var count: Int {
        return items.count
    }
    
    func getItem(at index: Int) -> TimedForecast {
        return items[index]
    }
    
    func addItem(_ item: TimedForecast) {
        items.append(item)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = getItem(at: indexPath.row)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "timedForecastCell", for: indexPath) as! TimedForecastCellView
        cell.display(time: item.getTime(), temperature: item.getTemperature())
        
        return cell
    }
}

extension TimedForecastDataSource: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 60, height: 90)
    }
}
