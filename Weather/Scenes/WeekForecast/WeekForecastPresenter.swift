//
//  WeekForecastPresenter.swift
//  Weather
//
//  Created by Vladislav Kondrashkov on 10/22/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

protocol WeekForecastPresenter {
    var count: Int { get }
    func getItem(at index: Int) -> WeekdayForecast
    func addItem(_ item: WeekdayForecast)
    func configure(collectionView: UICollectionView)
    func updateData()
}

class WeekForecastPresenterImplementation: WeekForecastPresenter {
    private var dataSource = WeekForecastDataSource()
    
    required init() {
        updateData()
    }
    
    var count: Int {
        return dataSource.count
    }
    
    func getItem(at index: Int) -> WeekdayForecast {
        return dataSource.getItem(at: index)
    }
    
    func addItem(_ item: WeekdayForecast) {
        dataSource.addItem(item)
    }
    
    func configure(collectionView: UICollectionView) {
        collectionView.dataSource = dataSource
        collectionView.delegate = dataSource // Not sure whether it's right or not
        collectionView.register(WeekForecastCellView.self, forCellWithReuseIdentifier: "weekForecastCell")
    }
    
    func updateData() {
        for index in 1...10 {
            let weekForecast = WeekdayForecast(on: String(index) + "day", temperatureAtMidday: index, temperatureAtNight: index)
            dataSource.addItem(weekForecast)
        }
    }
}
