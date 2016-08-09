//
//  WeatherService.swift
//  Live_Weather
//
//  Created by Nikhil Ajay Bachhav on 7/26/16.
//  Copyright © 2016 Nikhil Ajay Bachhav_18479. All rights reserved.
//

import Foundation
protocol WeatherServiceDelegate {
    func setWeather(weather: Weather)

}

class WeatherService{
    
    var  deleagte: WeatherServiceDelegate?
    func getWeather(city: String){
        
        let cityEscaped = city.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLHostAllowedCharacterSet())
        let path = "http://api.openweathermap.org/data/2.5/weather?q=\(cityEscaped!)&appid=ff7afe8918b255a09d1ff4ff8c8c24e9"
        let url = NSURL(string: path)
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(url!) { (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in

            let json = JSON(data: data!)
            let lon = json["coord"]["lon"].double
            let lat = json["coord"]["lat"].double
            let temp = json["main"]["temp"].double
            
            let name = json["name"].string
            let desc = json["weather"][0]["description"].string
            let weather = Weather(cityName: name!, temp: temp!, description: desc!)
            
            if self.deleagte != nil {
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                 self.deleagte?.setWeather(weather)
                })
            }
        
            print("lattitude:\(lat!)Longitude: \(lon!) Temperature: \(temp)")
        }
        task.resume()
        
      //  get weather data for City
    /*
    print("Weather service city: \(city)")
    //requesting data
        //  process data
        
        let weather = Weather(cityName: city, temp: 237.12, description: "Nice day ")
        
        if deleagte != nil{
        deleagte?.setWeather(weather)
        }
 */
 }
    
}