//
//  TimedForecastPresenter.swift
//  Weather
//
//  Created by Vladislav Kondrashkov on 10/22/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

protocol TimedForecastPresenter {
    var count: Int { get }
    func getItem(at index: Int) -> TimedForecast
    func addItem(_ item: TimedForecast)
    func updateData()
    func configure(collectionView: UICollectionView)
}

class TimedForecastPresenterImplementation: TimedForecastPresenter {
    private var dataSource = TimedForecastDataSource()
    
    required init() {
        updateData()
    }
    
    var count: Int {
        return dataSource.count
    }
    
    func getItem(at index: Int) -> TimedForecast {
        return dataSource.getItem(at: index)
    }
    
    func addItem(_ item: TimedForecast) {
        dataSource.addItem(item)
    }
    
    func configure(collectionView: UICollectionView) {
        collectionView.dataSource = dataSource
        collectionView.delegate = dataSource // Not sure whether it's right or not
        collectionView.register(TimedForecastCellView.self, forCellWithReuseIdentifier: "timedForecastCell")
    }
    
    func updateData() {
        for index in 1...10 {
            let timedForecast = TimedForecast(at: String(index) + " AM", is: index)
            addItem(timedForecast)
        }
    }
}
