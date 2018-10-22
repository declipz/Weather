//
//  WeekForecastCellView.swift
//  Weather
//
//  Created by Vladislav Kondrashkov on 10/22/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

class WeekForecastCellView: UICollectionViewCell {
    var weekDayNameLabel = UILabel()
    var temperatureAtMiddayLabel = UILabel()
    var temperatureAtNightLabel = UILabel()
    
    func updateWeekDayNameLabel(text: String) {
        weekDayNameLabel.text = text
    }
    func updateTemperatureAtMiddayLabel(text: Int) {
        temperatureAtMiddayLabel.text = String(text)
    }
    func updateTemperatureAtNightLabel(text: Int) {
        temperatureAtNightLabel.text = String(text)
    }
}
