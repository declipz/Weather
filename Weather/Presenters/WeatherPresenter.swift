//
//  WeatherPresenter.swift
//  Weather
//
//  Created by Vladislav Kondrashkov on 10/22/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

protocol WeatherPresenter {

}

class WeatherPresenterImplementation: WeatherPresenter {
    let view: WeatherView?
    
    init(view: WeatherView) {
        self.view = view
    }
}
