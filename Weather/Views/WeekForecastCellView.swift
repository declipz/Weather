//
//  WeekForecastCellView.swift
//  Weather
//
//  Created by Vladislav Kondrashkov on 10/21/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

class WeekForecastCellView: UICollectionViewCell {
    @IBOutlet weak var weekDayNameLabel: UILabel!
    @IBOutlet weak var temperatureAtMiddayLabel: UILabel!
    @IBOutlet weak var temperatureAtNightLabel: UILabel!
    
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
