//
//  TimedForecastCellView.swift
//  Weather
//
//  Created by Vladislav Kondrashkov on 10/22/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

final class TimedForecastCollectionViewCell: UICollectionViewCell {
    private let timeLabel = UILabel()
    private let temperatureLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        timeLabel.font = .boldSystemFont(ofSize: 17)
        timeLabel.textColor = .white
        contentView.addSubview(timeLabel)
        activateTimeLabelConstraints(view: timeLabel)
        
        temperatureLabel.font = .boldSystemFont(ofSize: 17)
        temperatureLabel.textColor = .white
        contentView.addSubview(temperatureLabel)
        activateTemperatureLabelConstraints(view: temperatureLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func display(time: String?, temperature: Int?) {
        timeLabel.text = time
        temperatureLabel.text = String(temperature ?? 0) + "°"
    }
}

private typealias PrivateTimedForecastCellView = TimedForecastCollectionViewCell
private extension PrivateTimedForecastCellView {
    func activateTimeLabelConstraints(view: UIView) {
        guard let superview = view.superview else { return }
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: superview.topAnchor, constant: 10),
            view.centerXAnchor.constraint(equalTo: superview.centerXAnchor)
            ])
    }
    
    func activateTemperatureLabelConstraints(view: UIView) {
        guard let superview = view.superview else { return }
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -10),
            view.centerXAnchor.constraint(equalTo: superview.centerXAnchor)
            ])
    }
}
