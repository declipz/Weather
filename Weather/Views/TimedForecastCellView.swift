//
//  TimedForecastCellView.swift
//  Weather
//
//  Created by Vladislav Kondrashkov on 10/22/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

class TimedForecastCellView: UICollectionViewCell {
    private let timeLabel = UILabel()
    private let temperatureLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        timeLabel.text = "2 AM"
        timeLabel.font = .boldSystemFont(ofSize: 17)
        timeLabel.textColor = .white
        contentView.addSubview(timeLabel)
        activateTimeLabelConstraints(view: timeLabel)
        
        temperatureLabel.text = "2°"
        temperatureLabel.font = .boldSystemFont(ofSize: 17)
        temperatureLabel.textColor = .white
        contentView.addSubview(temperatureLabel)
        activateTemperatureLabelConstraints(view: temperatureLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateTimeLabel(text: String) {
        timeLabel.text = text
    }
    
    func updateTemperatureLabel(text: Int) {
        temperatureLabel.text = String(text)
    }
    
    func display(time: String, temperature: Int) {
        timeLabel.textColor = .white
        timeLabel.text = time
        temperatureLabel.textColor = .white
        temperatureLabel.text = String(temperature) + "°"
    }
}

private typealias PrivateTimedForecastCellView = TimedForecastCellView
private extension PrivateTimedForecastCellView {
    func activateTimeLabelConstraints(view: UIView) {
        guard let superview = view.superview else { return }
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: superview.topAnchor),
            view.centerXAnchor.constraint(equalTo: superview.centerXAnchor)
            ])
    }
    
    func activateTemperatureLabelConstraints(view: UIView) {
        guard let superview = view.superview else { return }
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.bottomAnchor.constraint(equalTo: superview.bottomAnchor),
            view.centerXAnchor.constraint(equalTo: superview.centerXAnchor)
            ])
    }
}
