//
//  OpenWeatherService.swift
//  Weather
//
//  Created by Vladislav Kondrashkov on 11/15/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

protocol OpenWeatherService {
    func fetchForecast(city: String, completion: @escaping ([Forecast]) -> Void)
}

class OpenWeatherServiceImplementation: OpenWeatherService {
    private let appid = "604fdceb4fa7aca4071f571bdc3027c7"
    
    func fetchForecast(city: String, completion: @escaping ([Forecast]) -> Void) {
        Alamofire.request("https://api.openweathermap.org/data/2.5/forecast?q=\(city)&APPID=\(appid)&units=metric").validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                guard let json = value as? [String: Any],
                    let list = json["list"] as? [[String: Any]] else { return }
                let forecastList = try? Mapper<Forecast>().mapArray(JSONArray: list)
                completion(forecastList ?? [])
            case .failure(let error):
                print(error)
            }
        }
    }
}
