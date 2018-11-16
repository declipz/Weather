//
//  WeekForecastCellView.swift
//  Weather
//
//  Created by Vladislav Kondrashkov on 10/22/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

final class WeekForecastCollectionViewCell: UICollectionViewCell {
    private var weekDayNameLabel = UILabel()
    private var temperatureAtMiddayLabel = UILabel()
    private var temperatureAtNightLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        weekDayNameLabel.font = .boldSystemFont(ofSize: 17)
        weekDayNameLabel.textColor = .white
        contentView.addSubview(weekDayNameLabel)
        activateWeekdayLabelConstraints(view: weekDayNameLabel)
        
        temperatureAtNightLabel.font = .boldSystemFont(ofSize: 17)
        temperatureAtNightLabel.textColor = .lightGray
        contentView.addSubview(temperatureAtNightLabel)
        activateTemperatureAtNightLabelConstraints(view: temperatureAtNightLabel)
        
        temperatureAtMiddayLabel.font = .boldSystemFont(ofSize: 17)
        temperatureAtMiddayLabel.textColor = .white
        contentView.addSubview(temperatureAtMiddayLabel)
        activateTemperatureAtMiddayLabelConstraints(view: temperatureAtMiddayLabel, anchorView: temperatureAtNightLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func display(weekDay: String?, temperatureAtMidday: Int?, temperatureAtNight: Int?) {
        weekDayNameLabel.text = weekDay
        temperatureAtMiddayLabel.text = String(temperatureAtMidday ?? 0) + "°"
        temperatureAtNightLabel.text = String(temperatureAtNight ?? 0) + "°"
    }
}

private typealias PrivateWeekForecastCellView = WeekForecastCollectionViewCell
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
