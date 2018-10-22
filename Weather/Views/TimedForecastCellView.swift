//
//  TimedForecastCellView.swift
//  Weather
//
//  Created by Vladislav Kondrashkov on 10/21/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

class TimedForecastCellView: UICollectionViewCell{    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!

    func updateTimeLabel(text: String) {
        self.timeLabel.text = text
    }
    
    func updateTemperatureLabel(text: Int) {
        self.temperatureLabel.text = String(text)
    }
    
}
