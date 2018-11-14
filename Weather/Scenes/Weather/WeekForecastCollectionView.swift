//
//  WeekForecastCollectionVIew.swift
//  Weather
//
//  Created by Vladislav Kondrashkov on 11/14/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

class WeekForecastCollectionView: UICollectionView {
    
    private let weekForecastLayout = UICollectionViewFlowLayout()
    
    init(delegate: UICollectionViewDelegate, dataSource: UICollectionViewDataSource) {
        super.init(frame: CGRect.zero, collectionViewLayout: weekForecastLayout)
        weekForecastLayout.scrollDirection = .vertical
        self.collectionViewLayout = weekForecastLayout
        self.backgroundColor = .clear
        self.dataSource = dataSource
        self.delegate = delegate
        register(WeekForecastCollectionViewCell.self, forCellWithReuseIdentifier: "weekForecastCell")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
