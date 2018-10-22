//
//  WeekForecastCellView.swift
//  Weather
//
//  Created by Vladislav Kondrashkov on 10/22/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

class WeekForecastCellView: UICollectionViewCell {
    private var weekDayNameLabel = UILabel()
    private var temperatureAtMiddayLabel = UILabel()
    private var temperatureAtNightLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        weekDayNameLabel.text = "Monday"
        weekDayNameLabel.font = .boldSystemFont(ofSize: 17)
        weekDayNameLabel.textColor = .white
        addSubview(weekDayNameLabel)
        activateWeekdayLabelConstraints(view: weekDayNameLabel)
        
        temperatureAtNightLabel.text = "2"
        temperatureAtNightLabel.font = .boldSystemFont(ofSize: 17)
        temperatureAtNightLabel.textColor = .white
        addSubview(temperatureAtNightLabel)
        activateTemperatureAtNightLabelConstraints(view: temperatureAtNightLabel)
        
        temperatureAtMiddayLabel.text = "10"
        temperatureAtMiddayLabel.font = .boldSystemFont(ofSize: 17)
        temperatureAtMiddayLabel.textColor = .white
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
    
    func display(weekDay: String, temperatureAtMidday: Int, temperatureAtNight: Int) {
        weekDayNameLabel.textColor = .white
        weekDayNameLabel.text = weekDay
        temperatureAtMiddayLabel.textColor = .white
        temperatureAtMiddayLabel.text = String(temperatureAtMidday) + "°"
        temperatureAtNightLabel.textColor = .lightGray
        temperatureAtNightLabel.text = String(temperatureAtNight) + "°"
    }
}

private typealias PrivateWeekForecastCellView = WeekForecastCellView
private extension PrivateWeekForecastCellView {
    func activateWeekdayLabelConstraints(view: UIView) {
        guard let superview = view.superview else { return }
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.leftAnchor.constraint(equalTo: superview.leftAnchor, constant: 10),
            view.centerYAnchor.constraint(equalTo: superview.centerYAnchor)
            ])
    }
    
    func activateTemperatureAtNightLabelConstraints(view: UIView) {
        guard let superview = view.superview else { return }
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.rightAnchor.constraint(equalTo: superview.rightAnchor, constant: -10),
            view.centerYAnchor.constraint(equalTo: superview.centerYAnchor)
            ])
    }
    
    func activateTemperatureAtMiddayLabelConstraints(view: UIView, anchorView: UIView) {
        guard let superview = view.superview else { return }
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.rightAnchor.constraint(equalTo: anchorView.leftAnchor, constant: -10),
            view.centerYAnchor.constraint(equalTo: superview.centerYAnchor)
            ])
    }
}
