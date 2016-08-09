//
//  Weather.swift
//  Live_Weather
//
//  Created by Nikhil Ajay Bachhav on 7/28/16.
//  Copyright © 2016 Nikhil Ajay Bachhav_18479. All rights reserved.
//

import Foundation
struct Weather{
    let cityName: String
    let temp: Double
    let description: String
    init(cityName: String, temp: Double, description: String) {
        self.cityName = cityName
        self.temp = temp
        self.description = description
        
        
    }
}
