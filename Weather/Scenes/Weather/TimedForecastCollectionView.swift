//
//  TimedForecastCollectionView.swift
//  Weather
//
//  Created by Vladislav Kondrashkov on 11/14/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

class TimedForecastCollectionView: UICollectionView {

    private let timedForecastLayout = UICollectionViewFlowLayout()
    
    init(delegate: UICollectionViewDelegate, dataSource: UICollectionViewDataSource) {
        super.init(frame: CGRect.zero, collectionViewLayout: timedForecastLayout)
        timedForecastLayout.scrollDirection = .horizontal
        self.collectionViewLayout = timedForecastLayout
        self.backgroundColor = .clear
        self.dataSource = dataSource
        self.delegate = delegate
        register(TimedForecastCollectionViewCell.self, forCellWithReuseIdentifier: "timedForecastCell")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
