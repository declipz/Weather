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

struct ForecastData {
    var date: Date
    var temperature: Int
    var status: String
}

private class FetchedForecast: Mappable {
    var temperature: Int?
    var date: Date?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        temperature <- (map["main.temp"], TransformOf<Int, Double>(fromJSON: { Int($0!) }, toJSON: { $0.map { Double($0) } }))
        date        <- (map["dt_txt"], TransformOf<Date, String>(fromJSON: {
            let dateFormatter = DateFormatter()
            var calendar = Calendar.current
            calendar.timeZone = TimeZone(secondsFromGMT: 0)!
            dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            return dateFormatter.date(from: $0!)
        }, toJSON: { $0.map { $0.description } }))
        temperature <- (map["main.temp"], TransformOf<Int, Double>(fromJSON: {
            Int($0!)
        }, toJSON: { $0.map { Double($0) } }))
    }
}

class OpenWeatherService {
    private let appid = "604fdceb4fa7aca4071f571bdc3027c7"
    
    func fetchCurrentForecast(city: String, completion: @escaping (CurrentForecast?) -> ()) {
        Alamofire.request("https://api.openweathermap.org/data/2.5/forecast?q=\(city)&APPID=\(appid)&units=metric").validate().responseJSON { response in
            switch response.result {
            case .success:
                guard let json = response.result.value as? [String: Any] else { return }
                let currentForecast = CurrentForecast(JSON: json)
                completion(currentForecast)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func fetchTimedForecast(city: String, completion: @escaping ([TimedForecast]) -> ()) {
        Alamofire.request("https://api.openweathermap.org/data/2.5/forecast?q=\(city)&APPID=\(appid)&units=metric").validate().responseJSON { response in
            switch response.result {
            case .success:
                guard let json = response.result.value as? [String: Any],
                    let forecastList = json["list"] as? [[String: Any]] else { return }
                var timedForecastList = [TimedForecast]()
                
                for forecast in forecastList {
                    if timedForecastList.count == 8 { break }
                    if let timedForecast = TimedForecast(JSON: forecast) {
                        timedForecastList.append(timedForecast)
                    }
                }
                completion(timedForecastList)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func fetchWeekForecast(city: String, completion: @escaping ([WeekdayForecast]) -> ()) {
        Alamofire.request("https://api.openweathermap.org/data/2.5/forecast?q=\(city)&APPID=\(appid)&units=metric").validate().responseJSON { response in
            switch response.result {
            case .success:
                guard let json = response.result.value as? [String: Any],
                    let forecastList = json["list"] as? [[String: Any]] else { return }
                var fetchedForecastList = [FetchedForecast]()
                
                for forecast in forecastList {
                    if let fetchedForecast = FetchedForecast(JSON: forecast) {
                        fetchedForecastList.append(fetchedForecast)
                    }
                }
                
                // Used for getting "hour" component from date
                var calendar = Calendar.current
                // Used for getting weekday name
                let dayFormatter = DateFormatter()
                dayFormatter.dateFormat = "EEEE"
                // To avoid time zone differences cast to zero one
                calendar.timeZone = TimeZone(secondsFromGMT: 0)!
                dayFormatter.timeZone = TimeZone(secondsFromGMT: 0)
                
                // Using only 12 AM\PM forecasts to get night\midday temperature
                fetchedForecastList = fetchedForecastList.filter({
                    let hours = calendar.component(.hour, from: $0.date!)
                    return hours == 0 || hours == 12
                })
                
                // Monkey code, needs to be changed
                var index = 1
                var weekForecastList = [WeekdayForecast]()
                while index < fetchedForecastList.count {
                    let currentDate = fetchedForecastList[index].date!
                    let hours = calendar.component(.hour, from: currentDate)
                    if hours != 12 {
                        index += 1
                        continue
                    }
                    let weekDay = dayFormatter.string(from: currentDate)
                    let weekDayForecast = WeekdayForecast(on: weekDay, temperatureAtMidday: fetchedForecastList[index].temperature, temperatureAtNight: fetchedForecastList[index - 1].temperature)
                    weekForecastList.append(weekDayForecast!)
                    index += 2
                }
                
                completion(weekForecastList)
            case .failure(let error):
                print(error)
            }
        }
    }
}
