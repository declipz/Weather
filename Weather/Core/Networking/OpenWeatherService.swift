//
//  OpenWeatherService.swift
//  Weather
//
//  Created by Vladislav Kondrashkov on 11/15/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import Foundation
import Alamofire

struct ForecastData {
    var date: Date
    var temperature: Int
    var status: String
}

class OpenWeatherService {
    func fetchData(in city: String, using appid: String, completion: @escaping (CurrentForecast, [TimedForecast], [WeekdayForecast]) -> ()) {
        Alamofire.request("https://api.openweathermap.org/data/2.5/forecast?q=\(city)&APPID=\(appid)&units=metric").validate().responseJSON { response in
            switch response.result {
            case .success:
                
                let dateFormatter = DateFormatter()
                let dayFortmatter = DateFormatter()
                var calendar = Calendar.current
                let timeZone = TimeZone(secondsFromGMT: 0)
                calendar.timeZone = timeZone!
                dateFormatter.timeZone = timeZone
                dayFortmatter.locale = Locale(identifier: "en_US_POSIX")
                dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
                dayFortmatter.dateFormat = "EEEE"
                
                var weekForecastData = [WeekdayForecast]()
                var timedForecastData = [TimedForecast]()
                var currentForecast = CurrentForecast(in: "--", is: 0, status: "--") // Needs to be changed
                var forecastList = [ForecastData]()
                if let data = response.result.value as? [String: Any],
                    let list = data["list"] as? [[String: Any]] {
                    for item in list {
                        guard let dateString = item["dt_txt"] as? String,
                            let date = dateFormatter.date(from: dateString),
                            let main = item["main"] as? [String: Any],
                            let doubleTemperature = main["temp"] as? Double,
                            let weather = item["weather"] as? [[String: Any]],
                            let status = weather[0]["description"] as? String else { return }
                        //let weekDay = dayFortmatter.string(from: date)
                        //let hours = calendar.component(.hour, from: date)
                        let temperature = Int(doubleTemperature)
                        forecastList.append(ForecastData(date: date, temperature: temperature, status: status))
                    }
                    
                    for item in forecastList {
                        if timedForecastData.count == 0 {
                            currentForecast.city = city
                            currentForecast.status = item.status
                            currentForecast.temperature = item.temperature
                        }
                        if timedForecastData.count < 8 {
                            let hoursValue = calendar.component(.hour, from: item.date)
                            let hours = String(hoursValue) + ":00"
                            timedForecastData.append(TimedForecast(at: hours, is: item.temperature))
                        }
                    }
                    
                    var currentNightTemperature: Int?
                    var currentDayTemperature: Int?
                    var currentWeekDay: String?
                    for item in forecastList {
                        if calendar.isDateInToday(item.date) { continue }
                        let hours = calendar.component(.hour, from: item.date)
                        if hours == 0 {
                            currentNightTemperature = item.temperature
                        }
                        if hours == 12 {
                            currentDayTemperature = item.temperature
                            currentWeekDay = dayFortmatter.string(from: item.date)
                        }
                        if let nightTemperature = currentNightTemperature,
                            let dayTemperature = currentDayTemperature,
                            let weekDay = currentWeekDay {
                            weekForecastData.append(WeekdayForecast(on: weekDay, temperatureAtMidday: dayTemperature, temperatureAtNight: nightTemperature))
                            currentNightTemperature = nil
                            currentDayTemperature = nil
                            currentWeekDay = nil
                        }
                    }
                }
                completion(currentForecast, timedForecastData, weekForecastData)
            case .failure(let error):
                print(error)
            }
        }
    }
}
