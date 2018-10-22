//
//  TimedForecastCellView.swift
//  Weather
//
//  Created by Vladislav Kondrashkov on 10/22/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

class TimedForecastCellView: UICollectionViewCell {
    let timeLabel = UILabel()
    let temperatureLabel = UILabel()
    
    var presenter: TimedForecastPresenter?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        presenter = TimedForecastPresenterImplementation()
        
        timeLabel.text = "2 AM"
        timeLabel.font = UIFont.boldSystemFont(ofSize: 17)
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.textColor = UIColor.white
        addSubview(timeLabel)
        activateTimeLabelConstraints(view: timeLabel)
        
        temperatureLabel.text = "2°"
        temperatureLabel.font = UIFont.boldSystemFont(ofSize: 17)
        temperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        temperatureLabel.textColor = UIColor.white
        addSubview(temperatureLabel)
        activateTemperatureLabelConstraints(view: temperatureLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateTimeLabel(text: String) {
        self.timeLabel.text = text
    }
    
    func updateTemperatureLabel(text: Int) {
        self.temperatureLabel.text = String(text)
    }
    
    func configure(time: String, temperature: Int) {
        self.timeLabel.textColor = UIColor.white
        self.timeLabel.text = time
        self.temperatureLabel.textColor = UIColor.white
        self.temperatureLabel.text = String(temperature)
    }
}

private typealias PrivateTimedForecastCellView = TimedForecastCellView
private extension PrivateTimedForecastCellView {
    func activateTimeLabelConstraints(view: UIView) {
        guard let superview = view.superview else {
            return
        }
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: superview.topAnchor),
            view.centerXAnchor.constraint(equalTo: superview.centerXAnchor)
            ])
    }
    
    func activateTemperatureLabelConstraints(view: UIView) {
        guard let superview = view.superview else {
            return
        }
        NSLayoutConstraint.activate([
            view.bottomAnchor.constraint(equalTo: superview.bottomAnchor),
            view.centerXAnchor.constraint(equalTo: superview.centerXAnchor)
            ])
    }
}
