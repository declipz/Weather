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
    
    var presenter: WeekForecastPresenter?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        presenter = WeekForecastPresenterImplementation()
        
        weekDayNameLabel.text = "Monday"
        weekDayNameLabel.font = UIFont.boldSystemFont(ofSize: 17)
        weekDayNameLabel.translatesAutoresizingMaskIntoConstraints = false
        weekDayNameLabel.textColor = UIColor.white
        addSubview(weekDayNameLabel)
        activateWeekdayLabelConstraints(view: weekDayNameLabel)
        
        temperatureAtNightLabel.text = "2"
        temperatureAtNightLabel.font = UIFont.boldSystemFont(ofSize: 17)
        temperatureAtNightLabel.translatesAutoresizingMaskIntoConstraints = false
        temperatureAtNightLabel.textColor = UIColor.white
        addSubview(temperatureAtNightLabel)
        activateTemperatureAtNightLabelConstraints(view: temperatureAtNightLabel)
        
        temperatureAtMiddayLabel.text = "10"
        temperatureAtMiddayLabel.font = UIFont.boldSystemFont(ofSize: 17)
        temperatureAtMiddayLabel.translatesAutoresizingMaskIntoConstraints = false
        temperatureAtMiddayLabel.textColor = UIColor.white
        addSubview(temperatureAtMiddayLabel)
        activateTemperatureAtMiddayLabelConstraints(view: temperatureAtMiddayLabel, anchorView: temperatureAtNightLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateWeekDayNameLabel(text: String) {
        weekDayNameLabel.text = text
    }
    func updateTemperatureAtMiddayLabel(text: Int) {
        temperatureAtMiddayLabel.text = String(text)
    }
    func updateTemperatureAtNightLabel(text: Int) {
        temperatureAtNightLabel.text = String(text)
    }
    
    func configure(weekDay: String, temperatureAtMidday: Int, temperatureAtNight: Int) {
        self.weekDayNameLabel.textColor = UIColor.white
        self.weekDayNameLabel.text = weekDay
        self.temperatureAtMiddayLabel.textColor = UIColor.white
        self.temperatureAtMiddayLabel.text = String(temperatureAtMidday)
        self.temperatureAtNightLabel.textColor = UIColor.lightGray
        self.temperatureAtNightLabel.text = String(temperatureAtNight)
    }
}

private typealias PrivateWeekForecastCellView = WeekForecastCellView
private extension PrivateWeekForecastCellView {
    func activateWeekdayLabelConstraints(view: UIView) {
        guard let superview = view.superview else {
            return
        }
        NSLayoutConstraint.activate([
            view.leftAnchor.constraint(equalTo: superview.leftAnchor, constant: 10),
            view.centerYAnchor.constraint(equalTo: superview.centerYAnchor)
            ])
    }
    
    func activateTemperatureAtNightLabelConstraints(view: UIView) {
        guard let superview = view.superview else {
            return
        }
        NSLayoutConstraint.activate([
            view.rightAnchor.constraint(equalTo: superview.rightAnchor, constant: -10),
            view.centerYAnchor.constraint(equalTo: superview.centerYAnchor)
            ])
    }
    
    func activateTemperatureAtMiddayLabelConstraints(view: UIView, anchorView: UIView) {
        guard let superview = view.superview else {
            return
        }
        NSLayoutConstraint.activate([
            view.rightAnchor.constraint(equalTo: anchorView.leftAnchor, constant: -10),
            view.centerYAnchor.constraint(equalTo: superview.centerYAnchor)
            ])
    }
}
