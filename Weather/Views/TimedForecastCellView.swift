//
//  TimedForecastCellView.swift
//  Weather
//
//  Created by Vladislav Kondrashkov on 10/22/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

class TimedForecastCellView: UICollectionViewCell{
    let timeLabel = UILabel()
    let temperatureLabel = UILabel()
    
    func updateTimeLabel(text: String) {
        self.timeLabel.text = text
    }
    
    func updateTemperatureLabel(text: Int) {
        self.temperatureLabel.text = String(text)
    }
}
