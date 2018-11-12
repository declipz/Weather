//
//  WeekForecastPresenter.swift
//  Weather
//
//  Created by Vladislav Kondrashkov on 10/22/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

protocol WeekForecastPresenter {
    func configure(collectionView: UICollectionView)
    func updateData()
}

class WeekForecastPresenterImplementation: WeekForecastPresenter {
    private var dataSource = WeekForecastDataSource()
    
    required init() {
        updateData()
    }
    
    func configure(collectionView: UICollectionView) {
        collectionView.dataSource = dataSource
        collectionView.delegate = dataSource // Not sure whether it's right or not
        collectionView.register(WeekForecastCellView.self, forCellWithReuseIdentifier: "weekForecastCell")
    }
    
    func updateData() {
        for index in 1...10 {
            let weekForecast = WeekdayForecast(on: String(index) + "day", temperatureAtMidday: index, temperatureAtNight: index)
            dataSource.addForecast(weekForecast)
        }
    }
}
